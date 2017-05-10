//
//  RLMObject+JSONSerialization.m
//  RealmBrowser
//
//  Created by Tim Oliver on 5/9/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

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
            return [(NSNumber *)value stringValue];
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
        case RLMPropertyTypeArray:
        {
            NSMutableArray *array = [NSMutableArray array];
            for (RLMObject *object in (RLMArray *)value) {
                [array addObject:[[self class] JSONDictionaryForObject:object]];
            }
            return array;
        }
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
