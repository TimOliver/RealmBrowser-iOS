//
//  RLMBrowserConstants.m
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserConstants.h"

NSString * const kRLMBrowserIdentifier = @"io.realm.browser";

@implementation UIColor(RLMBrowserColors)

+ (UIColor *)RLMBrowser_tableBackgroundColor {
    return [UIColor colorWithRed:238.0f/255.0f green:239.0f/255.0f blue:244.0f/255.0f alpha:1.0f];
}

@end
