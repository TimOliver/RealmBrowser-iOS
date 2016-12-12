//
//  RLMBrowserSchema.m
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserSchema.h"

@implementation RLMBrowserSchema

+ (RLMProperty *)preferredPropertyFromProperties:(NSArray *)properties
{
    for (RLMProperty *property in properties) {
        // Skip if not a string
        if (property.type != RLMPropertyTypeString) {
            continue;
        }
        // Skip if it contains 'ID'
        if ([property.name rangeOfString:@"ID" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            continue;
        }
        
        return property;
    }
    
    // If all else fails, default to the first property
    return properties.firstObject;
}

+ (NSArray *)preferredSecondaryPropertiesFromProperties:(NSArray *)properties
                                           maximumCount:(NSInteger) maximumCount
                             excludingPropertyClassName:(NSString *)excludedName
{
    NSMutableArray *newProperties = [NSMutableArray array];
    for (RLMProperty *property in properties) {
        if ([property.name isEqualToString:excludedName]) { continue; }
        [newProperties addObject:property];
        if (newProperties.count >= maximumCount) { break; }
    }
    
    return [NSArray arrayWithArray:newProperties];
}

+ (BOOL)shouldIncludeInDefaultSchema
{
    return NO;
}

@end
