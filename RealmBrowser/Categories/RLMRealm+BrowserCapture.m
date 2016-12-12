//
//  RLMRealmConfiguration+RLMRealmConfiguration_Capture.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <objc/runtime.h>
#import "RLMRealm+BrowserCapture.h"

// Static Information
#import "RLMBrowserConstants.h"
#import "RLMBrowserConfiguration.h"

// Realm Model Classes
#import "RLMBrowserList.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

// Categories
#import "RLMRealmConfiguration+BrowserCompare.h"

@implementation RLMRealm (BrowserCapture)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(realmWithConfiguration:error:);
        SEL swizzledSelector = @selector(RLMBrowser_realmWithConfiguration:error:);
    
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =  class_addMethod(class, originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

+ (RLMRealm *)RLMBrowser_realmWithConfiguration:(RLMRealmConfiguration *)configuration error:(NSError **)error {
    // Get the Realm instance the user was trying to create. Return the error if one occurs.
    RLMRealm *realm = [RLMRealm RLMBrowser_realmWithConfiguration:configuration error:error];
    if (error) { return realm; }
    [RLMRealm RLMBrowser_captureRealmForBrowserWithRealm:realm];
    return realm;
}

+ (void)RLMBrowser_captureRealmForBrowserWithRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;
    
    // Exit if this is for one of the Realms that manages the Browser's data,
    // or if it was dynamically opened (Most likely via the Browser)
    if ([[configuration valueForKey:@"dynamic"] boolValue] || [configuration.fileURL.path rangeOfString:kRLMBrowserIdentifier].location != NSNotFound) {
        return;
    }
    
    // Set up the Realm file that will store the state of all captured Realms for the Browser
    RLMRealm *browserRealm = [RLMRealm RLMBrowser_realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
    
    // Query for an existing object representing this Realm
    RLMBrowserRealm *capturedRealm = [RLMRealm RLMBrowser_capturedRealmObjectInRealm:browserRealm forConfiguration:configuration];
    
    // Create an NSDictionary that will contain all necessary changes needed to be saved
    NSMutableDictionary *capturedRealmChanges = [NSMutableDictionary dictionary];
    
    // If there's no existing entry for this Realm, create a new one from scratch
    if (capturedRealm == nil) {
        [capturedRealmChanges addEntriesFromDictionary:[RLMRealm RLMBrowser_createNewCapturedRealmDictionaryForRealm:realm]];
    }
    else { // Otherwise compare the two to ensure nothing has changed
        [capturedRealmChanges addEntriesFromDictionary:[RLMRealm RLMBrowser_stateChangesBetweenCapturedRealm:capturedRealm andCurrentRealm:realm]];
    }
    
    [RLMRealm RLMBrowser_saveChanges:capturedRealmChanges forCapturedRealm:capturedRealm inBrowserRealm:browserRealm fromCurrentRealm:realm];
}


#pragma mark - New Object Creation -

/** Return (or create on the first time) the master list object that stores a reference to these Realms */
+ (RLMBrowserList *)RLMBrowser_defaultRealmBrowserListObjectInRealm:(RLMRealm *)browserRealm
{
    // Create a new list object if one doesn't already exist
    RLMBrowserList *list = [RLMBrowserList allObjectsInRealm:browserRealm].firstObject;
    if (list == nil) {
        list = [[RLMBrowserList alloc] init];
    }
    
    return list;
}

/** Create a new instance of `RLMBrowserRealm` to save to the Browser Realm file. */
+ (NSDictionary *)RLMBrowser_createNewCapturedRealmDictionaryForRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;
    NSMutableDictionary *newRealm = [NSMutableDictionary dictionary];
    
    // Save one of these mutually exclusive Realm types
    if (configuration.syncConfiguration.realmURL) { // Realm is a synchronized one backed by the Object Server
        newRealm[@"syncURL"] = configuration.syncConfiguration.realmURL.absoluteString;
        newRealm[@"name"] = configuration.syncConfiguration.realmURL.path;
    }
    else if (configuration.inMemoryIdentifier) { // Realm is in-memory only with no backing file
        newRealm[@"inMemoryIdentifier"] = configuration.inMemoryIdentifier;
        newRealm[@"name"] = configuration.inMemoryIdentifier;
    }
    else { // A standard Realm file on disk
        newRealm[@"filePath"] = [RLMBrowserRealm relativeFilePathFromAbsolutePath:configuration.fileURL.path];
        newRealm[@"name"] = configuration.fileURL.path.lastPathComponent;
    }
    
    newRealm[@"schemaVersion"] = @(configuration.schemaVersion);
    newRealm[@"schema"] = [NSMutableArray array];
    
    // Create a new schema reference for each object schema in this Realm since the last time it was opened
    for (RLMObjectSchema *schema in realm.schema.objectSchema) {
        RLMBrowserSchema *browserSchema = [[RLMBrowserSchema alloc] init];
        browserSchema.className = schema.className;
        browserSchema.preferredPropertyName = [[RLMBrowserSchema preferredPropertyFromProperties:schema.properties] name];
        
        NSArray *secondaryProperties = [RLMBrowserSchema preferredSecondaryPropertiesFromProperties:schema.properties
                                                                                       maximumCount:5
                                                                         excludingPropertyClassName:browserSchema.preferredPropertyName];
        for (RLMProperty *property in secondaryProperties) {
            RLMBrowserObjectProperty *objectProperty = [[RLMBrowserObjectProperty alloc] initWithValue:@[property.name]];
            [browserSchema.secondaryPropertyNames addObject:objectProperty];
        }
        [newRealm[@"schema"] addObject:browserSchema];
    }
    
    return newRealm;
}

#pragma mark - Present State Checking -

+ (RLMBrowserRealm *)RLMBrowser_capturedRealmObjectInRealm:(RLMRealm *)realm forConfiguration:(RLMRealmConfiguration *)configuration
{
    RLMResults *allRealmObjects = [RLMBrowserRealm allObjectsInRealm:realm];
    return [allRealmObjects objectsWhere:@"filePath == %@ AND inMemoryIdentifier == %@ AND syncURL == %@",
            [RLMBrowserRealm relativeFilePathFromAbsolutePath:configuration.fileURL.path],
            configuration.inMemoryIdentifier,
            configuration.syncConfiguration.realmURL.absoluteString].firstObject;
}

/* Go through each property and check that it hasn't changed */
+ (NSDictionary *)RLMBrowser_stateChangesBetweenCapturedRealm:(RLMBrowserRealm *)capturedRealm andCurrentRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;
    NSMutableDictionary *changes = [NSMutableDictionary dictionary];
    
    // Update readOnly property
    if (capturedRealm.readOnly != configuration.readOnly) {
        changes[@"readOnly"] = @(configuration.readOnly);
    }
    
    // Update encryption key property
    if (![capturedRealm.encryptionKey isEqual:configuration.encryptionKey]) {
        changes[@"encryptionKey"] = configuration.encryptionKey;
    }
    
    return changes;
}

#pragma mark - Realm Write Transactions -

+ (void)RLMBrowser_updateSchemaForCapturedRealm:(RLMBrowserRealm *)capturedRealm fromRealm:(RLMRealm *)realm
{
    // NB: This assumes it is being run inside of a write transaction
    
    // Loop through the current Realm's schema, and copy each className verbatim, in order
    for (NSInteger i = 0; i < realm.schema.objectSchema.count; i++) {
        RLMObjectSchema *schema = realm.schema.objectSchema[i];
        
        // If we reached the end our schema array, add a new object with the value and continue
        if (i >= capturedRealm.schema.count) {
            RLMBrowserSchema *newSchema = [[RLMBrowserSchema alloc] initWithValue:@[schema.className]];
            [capturedRealm.schema addObject:newSchema];
            continue;
        }
        
        // If the schema don't match up
        if (![schema.className isEqualToString:capturedRealm.schema[i].className]) {
            capturedRealm.schema[i].className = schema.className;
        }
    }
    
    // If the captured Realm's schema account has more entries than the current Realm, only
    // the properties on the end will be redundant. They can be safely backtracked until parity.
    while (capturedRealm.schema.count > realm.schema.objectSchema.count) {
        [capturedRealm.realm deleteObject:capturedRealm.schema.lastObject];
    }

}

+ (void)RLMBrowser_saveChanges:(NSMutableDictionary *)changes
              forCapturedRealm:(RLMBrowserRealm *)capturedRealm
                inBrowserRealm:(RLMRealm *)browserRealm
              fromCurrentRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;
    
    // Get a reference to the main list (Or create it in the process)
    RLMBrowserList *defaultList = [RLMRealm RLMBrowser_defaultRealmBrowserListObjectInRealm:browserRealm];
    RLMArray *allRealmsList = defaultList.allRealms;
    
    // Assess the arguments provided to see if we need to perform a write
    BOOL writeRequired = NO;
    writeRequired = changes.allKeys.count > 0; // If there are ANY entries that need to be updated
    writeRequired = writeRequired || capturedRealm.schemaVersion != configuration.schemaVersion; // A new migration has occurred
    writeRequired = writeRequired || allRealmsList.count == 0; // There should at least be this object in there already
    writeRequired = writeRequired || (![allRealmsList.firstObject isEqual:capturedRealm]); // A write is needed to bring this to the top

    // Terminate if a write isn't needed
    if (writeRequired == NO) {
        return;
    }
    
    // Add the primary key to ensure the right object is updated
    if (capturedRealm) {
        changes[@"uuid"] = capturedRealm.uuid;
    }
    
    // Perform a Realm write transaction to update the internal state
    [browserRealm transactionWithBlock:^{
        // Add the list object if this was the first time
        if (!defaultList.realm) { [browserRealm addObject:defaultList]; }
        
        // Update the object
        RLMBrowserRealm *updatedRealm = [RLMBrowserRealm createOrUpdateInRealm:browserRealm withValue:changes];
        
        // If the schema versions don't match, flush and rebuild the schema
        if (updatedRealm.schemaVersion != configuration.schemaVersion) {
            [RLMRealm RLMBrowser_updateSchemaForCapturedRealm:updatedRealm fromRealm:realm];
            updatedRealm.schemaVersion = configuration.schemaVersion;
        }
        
        // Update the lists with the placement of this Realm
        [defaultList.allRealms insertObject:updatedRealm atIndex:0];
        
        // Check if this particular Realm is the default Realm, and promote it if need be
        if ([configuration RLMBrowser_isEqualToConfiguration:[RLMRealmConfiguration defaultConfiguration]]) {
            defaultList.defaultRealm = updatedRealm;
        }
    }];
}

@end
