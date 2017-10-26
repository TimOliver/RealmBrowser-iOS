//
//  RLMBrowserAppGroupRealm.m
//  DZNEmptyDataSet
//
//  Created by Tim Oliver on 8/29/17.
//

#import "RLMBrowserAppGroupRealm.h"

@implementation RLMBrowserAppGroupRealm

+ (NSArray<NSString *> *)indexedProperties
{
    return @[@"realmFilePath", @"groupIdentifier"];
}

+ (BOOL)shouldIncludeInDefaultSchema
{
    return NO;
}

@end
