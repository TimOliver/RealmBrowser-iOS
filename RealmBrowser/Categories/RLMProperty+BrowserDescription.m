//
//  RLMProperty+RLMBrowser_formattedDescription.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMProperty+BrowserDescription.h"

@implementation RLMProperty (BrowserDescription)

- (NSString *)RLMBrowser_formattedDescription
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
            return [NSString stringWithFormat:@"Array<%@>", self.objectClassName];
        case RLMPropertyTypeLinkingObjects:
            return [NSString stringWithFormat:@"LinkingObjects<%@>", self.objectClassName];
        default:
            return @"Unknown";
    }
}

@end
