//
//  RLMBrowserRealm.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserRealm.h"

@implementation RLMBrowserRealm

+ (NSArray<NSString *> *)indexedProperties
{
    return @[@"filePath", @"inMemoryIdentifier", @"syncURL"];
}

+ (BOOL)shouldIncludeInDefaultSchema
{
    return NO;
}

+ (NSString *)primaryKey
{
    return @"uuid";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"uuid": [NSUUID UUID].UUIDString};
}

@end
