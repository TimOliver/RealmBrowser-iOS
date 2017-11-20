//
//  RLMObject+JSONSerialization.m
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

#import "RLMObject+JSONSerialization.h"

@implementation RLMObject (JSONSerialization)

- (NSDictionary *)RLMBrowser_toJSONDictionary
{
    return [[self class] JSONDictionaryForObject:self];
}

- (NSString *)RLMBrowser_toJSONStringWithError:(NSError **)error
{
    NSDictionary *JSONDictionary = [self RLMBrowser_toJSONDictionary];
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:JSONDictionary options:NSJSONWritingPrettyPrinted error:error];
    if (*error) {
        return nil;
    }

    return [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
}

+ (id)JSONValueForValue:(id)value ofType:(RLMPropertyType)propertyType
{
    switch (propertyType) {
        case RLMPropertyTypeInt:
        case RLMPropertyTypeBool:
        case RLMPropertyTypeFloat:
        case RLMPropertyTypeDouble:
            return (NSNumber *)value;
        case RLMPropertyTypeString:
            return (NSString *)value;
        case RLMPropertyTypeData:
        {
            NSData *encodedData = [(NSData *)value base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
            return [[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
        }
        case RLMPropertyTypeDate:
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
            return [dateFormatter stringFromDate:value];
        }
        case RLMPropertyTypeObject:
            return [[self class] JSONDictionaryForObject:value];
//        case RLMPropertyTypeArray:
//        {
//            NSMutableArray *array = [NSMutableArray array];
//            for (RLMObject *object in (RLMArray *)value) {
//                [array addObject:[[self class] JSONDictionaryForObject:object]];
//            }
//            return array;
//        }
        default:
            break;
    }

    return nil;
}

+ (NSDictionary *)JSONDictionaryForObject:(RLMObject *)object
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    RLMObjectSchema *schema = object.objectSchema;

    for (RLMProperty *property in schema.properties) {
        id value = [[self class] JSONValueForValue:object[property.name] ofType:property.type];
        dictionary[property.name] = value ?: [NSNull null];
    }

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
