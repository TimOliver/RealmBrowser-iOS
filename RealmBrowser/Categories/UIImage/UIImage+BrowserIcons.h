//
//  UIImage+BrowserTagIcons.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BrowserIcons)

/* Small Realm icons for the Realms list view */
+ (UIImage *)RLMBrowser_localRealmIcon;
+ (UIImage *)RLMBrowser_syncRealmIcon;
+ (UIImage *)RLMBrowser_inMemoryRealmIcon;

/* Larger versions of the icons for the Realm info view */
+ (UIImage *)RLMBrowser_localRealmLargeIcon;
+ (UIImage *)RLMBrowser_syncRealmLargeIcon;
+ (UIImage *)RLMBrowser_inMemoryRealmLargeIcon;

/* Icon for the schema row of a Realm */
+ (UIImage *)RLMBrowser_schemaIconForColor:(UIColor *)color;

/* Icon indicating the Realm is using encryption */
+ (UIImage *)RLMBrowser_encryptedIcon;

/* A circle icon that can be tinted */
+ (UIImage *)RLMBrowser_tintedCircleImageForRadius:(CGFloat)radius;

/* A spanner icon for the Realm schema settings icon */
+ (UIImage *)RLMBrowser_tweaksIcon;

/* A standard Apple-style 'Quick Look' icon for more complex data like URLs and Data */
+ (UIImage *)RLMBrowser_quickLookIcon;

/* A chevron icon used for the collapsable Realm list sections */
+ (UIImage *)RLMBrowser_headerDisclosureArrowIcon;

/* A checkmark icon for the Realm schema configuration view */
+ (UIImage *)RLMBrowser_checkmarkIcon;

/* A favorite icon used to save specific Realms in the favorites list */
+ (UIImage *)RLMBrowser_favoriteIconFilled:(BOOL)filled;

@end
