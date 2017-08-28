//
//  RLMRealm+RLMRealm_UpdateCapture.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/24/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMRealm+BrowserCaptureWrites.h"
#import <objc/runtime.h>

#import "RLMBrowserConfiguration.h"
#import "RLMBrowserRealm.h"

#import <Realm/RLMRealm_Dynamic.h>

@implementation RLMRealm (BrowserCaptureWrites)

#pragma mark - Method Swizzling -

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [RLMRealm RLMBrowser_swizzleSelector:@selector(commitWriteTransaction:) withSelector:@selector(RLMBrowser_commitWriteTransaction:)];
        [RLMRealm RLMBrowser_swizzleSelector:@selector(commitWriteTransactionWithoutNotifying:error:) withSelector:@selector(RLMBrowser_commitWriteTransactionWithoutNotifying:error:)];
    });
}

+ (void)RLMBrowser_swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector
{
    Class class = [self class];

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

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
}

#pragma mark - Swizzled Methods -

- (BOOL)RLMBrowser_commitWriteTransaction:(NSError *)error
{
    BOOL result = [self RLMBrowser_commitWriteTransaction:error];
    if (result) {
        [RLMRealm RLMBrowser_updateSchemaObjectCountForRealmWithConfiguration:self.configuration];
    }
    return result;
}

- (BOOL)RLMBrowser_commitWriteTransactionWithoutNotifying:(NSArray<RLMNotificationToken *> *)tokens error:(NSError **)error
{
    BOOL result = [self RLMBrowser_commitWriteTransactionWithoutNotifying:tokens error:error];
    if (result) {
        [RLMRealm RLMBrowser_updateSchemaObjectCountForRealmWithConfiguration:self.configuration];
    }
    return result;
}

#pragma mark - Update Logic -
+ (dispatch_queue_t)RLMBrowser_schemaUpdateQueue
{
    static dispatch_queue_t dispatchQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_queue_attr_t qosAttribute = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY, 0);
        dispatchQueue = dispatch_queue_create("io.realm.realmbrowser.coordinator", qosAttribute);
    });

    return dispatchQueue;
}

+ (void)RLMBrowser_updateSchemaObjectCountForRealmWithConfiguration:(RLMRealmConfiguration *)configuration
{
    void (^updateSchemaBlock)() = ^{
        RLMRealm *backgroundRealm = [RLMRealm realmWithConfiguration:configuration error:nil];
        RLMRealm *browserRealm = [RLMRealm realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
        if ([backgroundRealm isEqual:browserRealm]) { return; }

        RLMBrowserRealm *browserRealmObject = [RLMBrowserRealm allBrowserRealmObjectsInRealm:browserRealm forConfiguration:configuration].firstObject;
        if (browserRealmObject == nil) { return; }

        BOOL hasChanges = NO;
        [browserRealm beginWriteTransaction];
        for (RLMBrowserSchema *schema in browserRealmObject.schema) {
            RLMResults *results = [backgroundRealm allObjects:schema.className];
            if (schema.numberOfObjects != results.count) {
                schema.numberOfObjects = results.count;
                hasChanges = YES;
            }
        }

        if (hasChanges) {
            [browserRealm RLMBrowser_commitWriteTransaction:nil];
        }
        else {
            [browserRealm cancelWriteTransaction];
        }
    };

    dispatch_async([RLMRealm RLMBrowser_schemaUpdateQueue], ^{
        @autoreleasepool { updateSchemaBlock(); }
    });
}

@end
