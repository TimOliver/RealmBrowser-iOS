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
    NSString *propertyString = nil;
    switch (self.type) {
        case RLMPropertyTypeInt:
            propertyString = @"Integer";
            break;
        case RLMPropertyTypeBool:
            propertyString = @"Boolean";
            break;
        case RLMPropertyTypeFloat:
            propertyString = @"Float";
            break;
        case RLMPropertyTypeDouble:
            propertyString = @"Double";
            break;
        case RLMPropertyTypeString:
            propertyString = @"String";
            break;
        case RLMPropertyTypeData:
            propertyString = @"Data";
            break;
        case RLMPropertyTypeDate:
            propertyString = @"Date";
            break;
        case RLMPropertyTypeObject:
            propertyString = self.objectClassName;
            break;
        case RLMPropertyTypeLinkingObjects:
            return [NSString stringWithFormat:@"LinkingObjects <%@>", self.linkOriginPropertyName];
        default:
            return @"Unknown";
    }
    
    if (self.array) {
        propertyString = [NSString stringWithFormat:@"Array <%@", propertyString];
    }
    
    return propertyString;
}

- (NSString *)RLMBrowser_configurationDescription
{
    NSString *description = self.optional ? @"Optional" : @"Non-Optional";
    if (self.indexed) {
        description = [description stringByAppendingString:@" • Indexed"];
    }
    
    return description;
}

@end
