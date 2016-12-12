//
//  RLMProperty+RLMBrowser_formattedDescription.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMProperty+BrowserDescription.h"

@implementation RLMProperty (BrowserDescription)

- (NSString *)RLMBrowser_typeDescription
{
    switch (self.type) {
        case RLMPropertyTypeInt:
            return @"Integer";
        case RLMPropertyTypeBool:
            return @"Boolean";
        case RLMPropertyTypeFloat:
            return @"Float";
        case RLMPropertyTypeDouble:
            return @"Double";
        case RLMPropertyTypeString:
            return @"String";
        case RLMPropertyTypeData:
            return @"Data";
        case RLMPropertyTypeDate:
            return @"Date";
        case RLMPropertyTypeObject:
            return self.objectClassName;
        case RLMPropertyTypeArray:
            return [NSString stringWithFormat:@"Array <%@>", self.objectClassName];
        case RLMPropertyTypeLinkingObjects:
            return [NSString stringWithFormat:@"LinkingObjects <%@>", self.objectClassName];
        default:
            return @"Unknown";
    }
}

- (NSString *)RLMBrowser_configurationDescription
{
    NSString *description = self.optional ? @"Optional" : @"Non-Optional";
    if (self.indexed) {
        description = [description stringByAppendingString:@" • Indexed"];
    }
    
    return description;
}

- (NSString *)RLMBrowser_typeAndConfigurationDescription
{
    NSString *description = [self RLMBrowser_typeDescription];
    
    BOOL numberProperty = (self.type == RLMPropertyTypeInt || self.type == RLMPropertyTypeBool
                           || self.type == RLMPropertyTypeFloat || self.type == RLMPropertyTypeFloat);
    
    BOOL optional = (self.optional && numberProperty);
    BOOL indexed = self.indexed;
    
    if (!indexed && !optional) {
        return description;
    }
    
    description = [description stringByAppendingString:@" ("];
    if (optional) {
        description = [description stringByAppendingFormat:@"Optional%@", indexed ? @" • " : nil];
    }
    
    if (indexed) {
        [description stringByAppendingString:@"Indexed"];
    }
    
    description = [description stringByAppendingString:@")"];

    return description;
}

@end
