//
//  RLMBrowserSchema.m
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
#import "RLMBrowserSchema.h"

@implementation RLMBrowserSchema

+ (NSArray *)ignoredProperties
{
    return @[@"secondaryPropertyNameStrings"];
}

+ (NSString *)preferredPropertyClassNameFromProperties:(NSArray *)properties
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
        
        return property.name;
    }
    
    // If all else fails, default to the first property
    return [properties.firstObject name];
}

+ (NSArray *)preferredSecondaryPropertyClassNamesFromProperties:(NSArray *)properties
                                                   maximumCount:(NSInteger)maximumCount
                                     excludingPropertyClassName:(NSString *)excludedName
{
    NSMutableArray *newProperties = [NSMutableArray array];
    for (RLMProperty *property in properties) {
        if ([property.name isEqualToString:excludedName]) { continue; }
        [newProperties addObject:property.name];
        if (newProperties.count >= maximumCount) { break; }
    }
    
    return [NSArray arrayWithArray:newProperties];
}

+ (BOOL)shouldIncludeInDefaultSchema
{
    return NO;
}

- (NSArray<NSString *> *)secondaryPropertyNameStrings
{
    NSMutableArray *properties = [NSMutableArray array];
    for (RLMBrowserObjectProperty *property in self.secondaryPropertyNames) {
        [properties addObject:property.name];
    }
    return properties;
}

@end
