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
    RLMRealm *realm = [RLMRealm RLMBrowser_realmWithConfiguration:configuration error:error];
    if (error) {
        return realm;
    }
    
    // Capture the Realm configuration (But skip our internal one)
    if ([configuration.fileURL.path rangeOfString:kRLMBrowserIdentifier].location == NSNotFound) {
        [RLMRealm RLMBrowser_captureRealmForBrowserWithRealm:realm];
    }
    return realm;
}

+ (void)RLMBrowser_captureRealmForBrowserWithRealm:(RLMRealm *)realm
{
    RLMRealm *browserRealm = [RLMRealm RLMBrowser_realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
    RLMResults *capturedRealms = [RLMBrowserRealm allObjectsInRealm:browserRealm];
    
    RLMRealmConfiguration *configuration = realm.configuration;
    
    // See if we've already save a copy of this configuration
    RLMBrowserRealm *capturedRealm = [capturedRealms objectsWhere:@"filePath == %@ AND inMemoryIdentifier == %@ AND syncURL == %@",
                                   configuration.fileURL.path,
                                   configuration.inMemoryIdentifier,
                                   configuration.syncConfiguration.realmURL.absoluteString].firstObject;
    
    // Try to avoid performing a write unless we're sure something has changed
    BOOL writeRequired = NO;
    
    // If there's no existing entry for this Realm, create a new one
    if (capturedRealm == nil) {
        capturedRealm = [[RLMBrowserRealm alloc] init];
        
        // Save one of these mutually exclusive states
        if (configuration.syncConfiguration.realmURL) {
            capturedRealm.syncURL = configuration.syncConfiguration.realmURL.absoluteString;
            capturedRealm.name = configuration.syncConfiguration.realmURL.path;
        }
        else if (configuration.inMemoryIdentifier) {
            capturedRealm.inMemoryIdentifier = configuration.inMemoryIdentifier;
            capturedRealm.name = capturedRealm.inMemoryIdentifier;
        }
        else if (configuration.fileURL) {
            capturedRealm.filePath = configuration.fileURL.path;
            capturedRealm.name = capturedRealm.filePath.lastPathComponent;
        }
        
        // Create a new schema object for each schema
        for (RLMObjectSchema *schema in realm.schema.objectSchema) {
            RLMBrowserSchema *browserSchema = [[RLMBrowserSchema alloc] initWithValue:@[schema.className]];
            [capturedRealm.schema addObject:browserSchema];
        }
        
        writeRequired = YES;
    }
    
    // Check if encryption key and read-only state have changed
    writeRequired = writeRequired || capturedRealm.readOnly != configuration.readOnly;
    writeRequired = writeRequired || [capturedRealm.encryptionKey isEqual:configuration.encryptionKey] == NO;

    // Check if schema has changed
    if (capturedRealm.schema.count != realm.schema.objectSchema.count) {
        writeRequired = YES;
    }
    else {
        // Loop through each class name to make sure it wasn't renamed
        for (NSInteger i = 0; i < realm.schema.objectSchema.count; i++) {
            if ([capturedRealm.schema[i].name isEqualToString:realm.schema.objectSchema[i].className] == NO) {
                writeRequired = YES;
                break;
            }
        }
    }
    
    // Avoid unnecessary write transactions
    if (writeRequired == NO) {
        return;
    }
    
    // Add/Update captured Realm configuration
    [browserRealm transactionWithBlock:^{
        // Add the object for the first time
        if (capturedRealm.realm == nil) {
            [browserRealm addObject:capturedRealm];
        }
        
        // Update the metadata properties
        capturedRealm.encryptionKey = configuration.encryptionKey;
        capturedRealm.readOnly = configuration.readOnly;
        
        // Rename existing schema, add new schema objects as needed
        for (NSInteger i = 0; i < realm.schema.objectSchema.count; i++) {
            RLMObjectSchema *schema = realm.schema.objectSchema[i];
            if (i >= capturedRealm.schema.count) {
                RLMBrowserSchema *newSchema = [[RLMBrowserSchema alloc] initWithValue:@[schema.className]];
                [capturedRealm.schema addObject:newSchema];
                continue;
            }
            
            capturedRealm.schema[i].name = schema.className;
        }
        
        // Delete any extraneous schema objects
        while (capturedRealm.schema.count > realm.schema.objectSchema.count) {
            [browserRealm deleteObject:capturedRealm.schema.lastObject];
        }
    }];
}

@end
