//
//  RLMProperty+RLMBrowser_formattedDescription.m
//
//  Copyright 2016-2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
