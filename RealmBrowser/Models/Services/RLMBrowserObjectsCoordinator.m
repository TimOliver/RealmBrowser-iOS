//
//  RLMBrowserObjectsCoordinator.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/23/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectsCoordinator.h"
#import "RLMBrowserConfiguration.h"
#import "RLMBrowserRealm.h"

#import <Realm/Realm.h>
#import <Realm/RLMRealm_Dynamic.h>

@implementation RLMBrowserObjectsCoordinator

+ (dispatch_queue_t)sharedDispatchQueue
{
    static dispatch_queue_t dispatchQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_queue_attr_t qosAttribute = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY, 0);
        dispatchQueue = dispatch_queue_create("io.realm.realmbrowser.coordinator", qosAttribute);
    });

    return dispatchQueue;
}

+ (void)clearExpiredRealmObjects
{
    static BOOL previouslyCompleted = NO;
    if (previouslyCompleted) { return; }


}

+ (void)updateSchemaObjectCountInRealm:(RLMRealm *)realm
{
    RLMRealmConfiguration *configuration = realm.configuration;

    void (^updateSchemaBlock)() = ^{
        RLMRealm *browserRealm = [RLMRealm realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
        RLMBrowserRealm *browserRealmObject = [RLMBrowserRealm allBrowserRealmObjectsInRealm:browserRealm forConfiguration:configuration].firstObject;
        if (browserRealmObject == nil) { return; }

        RLMRealm *backgroundRealm = [RLMRealm realmWithConfiguration:configuration error:nil];

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
            [browserRealm commitWriteTransaction];
        }
        else {
            [browserRealm cancelWriteTransaction];
        }
    };

    dispatch_async([RLMBrowserObjectsCoordinator sharedDispatchQueue], ^{
        @autoreleasepool { updateSchemaBlock(); }
    });
}


@end
