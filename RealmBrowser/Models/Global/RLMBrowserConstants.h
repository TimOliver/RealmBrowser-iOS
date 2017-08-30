//
//  RLMBrowserConstants.h
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

extern NSString * const kRLMBrowserIdentifier;

@interface UIColor (RLMBrowserColors)
+ (UIColor *)RLMBrowser_tableBackgroundColor;
@end

static inline void RLM_RESET_NAVIGATION_CONTROLLER(UINavigationController *navController) {
    navController.navigationBar.barStyle = UIBarStyleDefault;
    navController.navigationBar.tintColor = nil;
    navController.navigationBar.barTintColor = nil;
    navController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
}

static inline NSString *RLM_OBJECT_VALUE_DESCRIPTION(RLMObject *object, NSString *key) {
    RLMProperty *property = object.objectSchema[key];
    if (property == nil) { return nil; }

    switch (property.type) {
        case RLMPropertyTypeInt:
        case RLMPropertyTypeBool:
        case RLMPropertyTypeFloat:
        case RLMPropertyTypeDouble:
        case RLMPropertyTypeString:
        {
            NSString *string = [object[key] description];
            return (string.length > 0 ? string : nil);
        }
        case RLMPropertyTypeData:
        {
            NSData *data = object[key];
            if (!data || data.length == 0) { return nil; }
            NSString *formattedSize = [NSByteCountFormatter stringFromByteCount:data.length countStyle:NSByteCountFormatterCountStyleMemory];
            return [NSString stringWithFormat:@"Data - %@", formattedSize];
        }
        case RLMPropertyTypeDate:
        {
            NSDate *date = object[key];
            if (!date) { return nil; }
            return date.description;
        }
        case RLMPropertyTypeObject:
        {
            RLMObject *childObject = object[key];
            if (!childObject) { return nil; }
            return childObject.objectSchema.className;
        }
        case RLMPropertyTypeArray:
        {
            RLMArray *array = object[key];
            NSString *className = array.objectClassName;
            return [NSString stringWithFormat:@"RLMArray<%@>", className, (unsigned long)array.count, (array.count != 1 ? @"s" : @"")];
        }
        default: return nil;
    }
}
