//
//  RLMBrowserList.m
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserList.h"

@implementation RLMBrowserList

+ (instancetype)defaultListInRealm:(RLMRealm *)realm
{
    return [RLMBrowserList allObjectsInRealm:realm].firstObject;
}

+ (BOOL)shouldIncludeInDefaultSchema
{
    return NO;
}

@end
