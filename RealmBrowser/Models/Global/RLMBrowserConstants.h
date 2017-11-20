//
//  RLMBrowserConstants.h
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
//        case RLMPropertyTypeArray:
//        {
//            RLMArray *array = object[key];
//            NSString *className = array.objectClassName;
//            return [NSString stringWithFormat:@"RLMArray<%@>", className];
//        }
        default: return nil;
    }
}
