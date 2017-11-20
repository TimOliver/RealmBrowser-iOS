//
//  RLMBrowserObjectsCoordinator.m
//
//  Copyright 2016-2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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

    void (^updateSchemaBlock)(void) = ^{
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
