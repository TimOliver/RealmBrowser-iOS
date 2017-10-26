//
//  AppDelegate.m
//  realm-browser-ios
//
//  Created by Tim Oliver on 23/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm/Realm.h>
#import "Person.h"

#import <TOStatusBarSimulator/TOStatusBarSimulator.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    RLMRealm *realm = [RLMRealm defaultRealm];
    if (realm.isEmpty) {
        [realm transactionWithBlock:^{
            [realm addObjects:[Person generateTestData]];
        }];
    }

    [TOStatusBarSimulator show];
    [TOStatusBarSimulator setCarrierString:@"Realm"];

    return YES;
}

@end
