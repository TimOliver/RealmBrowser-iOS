//
//  RLMBrowserObjectsCoordinator.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/23/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMRealm;

@interface RLMBrowserObjectsCoordinator : NSObject

+ (void)clearExpiredRealmObjects;
+ (void)updateSchemaObjectCountInRealm:(RLMRealm *)realm;

@end
