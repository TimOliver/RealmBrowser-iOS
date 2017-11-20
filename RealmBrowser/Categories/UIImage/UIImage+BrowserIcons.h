//
//  UIImage+BrowserTagIcons.h
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
