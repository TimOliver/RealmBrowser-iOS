//
//  RLMRealmConfiguration+RLMRealmConfiguration_Capture.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <objc/runtime.h>
#import "RLMBrowserConstants.h"
#import "RLMBrowserConfiguration.h"
#import "RLMBrowserList.h"
#import "RLMBrowserRealm.h"
#import "RLMRealm+Capture.h"

@implementation RLMRealm (Capture)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(realmWithConfiguration:error:);
        SEL swizzledSelector = @selector(RLMBrowser_realmWithConfiguration:error:);
    
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
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
    if ([configuration.fileURL.path rangeOfString:kRLMBrowserIdentifier].location != NSNotFound) {
        return;
    }
    
    RLMRealm *browserRealm = [RLMRealm RLMBrowser_realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];

    // See if we've already saved a copy of this Realm
    RLMBrowserRealm *capturedRealm = [[RLMBrowserRealm allObjectsInRealm:browserRealm] objectsWhere:@"filePath == %@ AND inMemoryIdentifier == %@ AND syncURL == %@",
                                      configuration.fileURL.path, configuration.inMemoryIdentifier,
                                      configuration.syncConfiguration.realmURL.absoluteString].firstObject;
    
    // Try to avoid performing a write unless we're sure something has changed
    BOOL writeRequired = NO;
    
    // If there's no existing entry for this Realm, create a new one
    if (capturedRealm == nil) {
        capturedRealm = [RLMRealm RLMBrowser_createNewCapturedRealmWithCurrentRealm:realm];
        writeRequired = YES;
    }
    
    // Get / Make the parent list object in which this entry will belong
    RLMBrowserList *list = [RLMRealm RLMBrowser_defaultRealmBrowserListObjectInRealm:browserRealm];
    writeRequired = (writeRequired || list.realm == nil);
    
    // Check if the state of the Realm has changed at all
    writeRequired = writeRequired || [RLMRealm RLMBrowser_stateIsEqualBetweenCapturedRealm:capturedRealm andCurrentRealm:realm];
    
    // Check if the position of this object in the display list needs changing
    writeRequired = writeRequired || [RLMRealm RLMBrowser_capturedRealm:capturedRealm forRealm:realm isInCorrectPositionInList:list];
    
    // If the state was consistent up until now, a write transaction isn't required
    if (writeRequired) {
        [RLMRealm RLMBrowser_saveCapturedRealm:capturedRealm toList:list inBrowserRealm:browserRealm fromCurrentRealm:realm];
    }
}

#pragma mark - Realm Capture Handling -

/** Create a new instance of `RLMBrowserRealm` to save to the Browser Realm file. */
+ (RLMBrowserRealm *)RLMBrowser_createNewCapturedRealmWithCurrentRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;
    
    // Create a new Realmless instance
    RLMBrowserRealm *capturedRealm = [[RLMBrowserRealm alloc] init];
    
    // Save one of these mutually exclusive Realm types
    if (configuration.syncConfiguration.realmURL) { // Realm is a synchronized one backed by the Object Server
        capturedRealm.syncURL = configuration.syncConfiguration.realmURL.absoluteString;
        capturedRealm.name = configuration.syncConfiguration.realmURL.path;
    }
    else if (configuration.inMemoryIdentifier) { // Realm is in-memory only with no backing file
        capturedRealm.inMemoryIdentifier = configuration.inMemoryIdentifier;
        capturedRealm.name = capturedRealm.inMemoryIdentifier;
    }
    else { // A standard Realm file on disk
        capturedRealm.filePath = configuration.fileURL.path;
        capturedRealm.name = capturedRealm.filePath.lastPathComponent;
    }
    
    // Create a new schema reference for each object schema in this Realm since the last time it was opened
    for (RLMObjectSchema *schema in realm.schema.objectSchema) {
        RLMBrowserSchema *browserSchema = [[RLMBrowserSchema alloc] initWithValue:@[schema.className, [NSNull null]]];
        [capturedRealm.schema addObject:browserSchema];
    }
    
    return capturedRealm;
}

+ (BOOL)RLMBrowser_stateIsEqualBetweenCapturedRealm:(RLMBrowserRealm *)capturedRealm andCurrentRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;
    
    if (capturedRealm.readOnly != configuration.readOnly) { return NO; }
    if (![capturedRealm.encryptionKey isEqual:configuration.encryptionKey]) { return NO; }
    
    RLMArray<RLMBrowserSchema *> *capturedSchema = capturedRealm.schema;
    NSArray<RLMObjectSchema *> *realmSchema = realm.schema.objectSchema;
    
    if (capturedSchema.count != realmSchema.count) { // Properties were added or deleted
        return NO;
    }
    else {
        // Loop through each class name and compare it to ensure sure it wasn't renamed in a migration
        for (NSInteger i = 0; i < realmSchema.count; i++) {
            if (![capturedSchema[i].className isEqualToString:realmSchema[i].className]) {
                return NO;
            }
        }
    }
    
    return YES;
}

+ (BOOL)RLMBrowser_capturedRealm:(RLMBrowserRealm *)capturedRealm forRealm:(RLMRealm *)realm isInCorrectPositionInList:(RLMBrowserList *)list
{
    // See if this object needs to be set as the default Realm
    if (![capturedRealm isEqual:list.defaultRealm]) {
        if ([realm.configuration isEqual:[RLMRealmConfiguration defaultConfiguration]]) {
            return NO;
        }
    }
    
    
    
    return YES;
}

+ (RLMBrowserList *)RLMBrowser_defaultRealmBrowserListObjectInRealm:(RLMRealm *)browserRealm
{
    // Create a new lsit object if one doesn't already exist
    RLMBrowserList *list = [RLMBrowserList allObjectsInRealm:browserRealm].firstObject;
    if (list == nil) {
        list = [[RLMBrowserList alloc] init];
    }
    
    return list;
}

+ (void)RLMBrowser_saveCapturedRealm:(RLMBrowserRealm *)capturedRealm toList:(RLMBrowserList *)list inBrowserRealm:(RLMRealm *)browserRealm fromCurrentRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;

    // Perform a Realm write transaction to update the internal state
    [browserRealm transactionWithBlock:^{
        
        // Add the object for the first time
        if (capturedRealm.realm == nil) {
            [browserRealm addObject:capturedRealm];
        }
        
        // Update the metadata properties
        capturedRealm.encryptionKey = configuration.encryptionKey;
        capturedRealm.readOnly = configuration.readOnly;
        
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
        // the properties on the end will be invalid. They can be safely removed to ensure parity.
        while (capturedRealm.schema.count > realm.schema.objectSchema.count) {
            [browserRealm deleteObject:capturedRealm.schema.lastObject];
        }
    }];
}

@end
