//
//  RLMBrowserRealm.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/24/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserRealm.h"
#import "RLMBrowserConfiguration.h"

@implementation RLMRealm (RealmBrowser)

+ (instancetype)defaultBrowserRealm
{
    return [RLMRealm realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
}

@end
