//
//  UIImage+BrowserTagIcons.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BrowserIcons)

+ (UIImage *)RLMBrowser_localRealmIcon;
+ (UIImage *)RLMBrowser_syncRealmIcon;
+ (UIImage *)RLMBrowser_inMemoryRealmIcon;

+ (UIImage *)RLMBrowser_schemaIconForColor:(UIColor *)color;
+ (UIImage *)RLMBrowser_encryptedIcon;

+ (UIImage *)RLMBrowser_tintedCircleImageForRadius:(CGFloat)radius;
+ (UIImage *)RLMBrowser_tweaksIcon;
+ (UIImage *)RLMBrowser_quickLookIcon;

@end
