//
//  RLMBrowserConstants.h
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
