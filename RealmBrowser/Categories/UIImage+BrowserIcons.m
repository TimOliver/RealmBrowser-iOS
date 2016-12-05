//
//  UIImage+BrowserTagIcons.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "UIImage+BrowserIcons.h"

@implementation UIImage (BrowserIcons)

+ (UIImage *)RLMBrowser_tintedCircleImageForRadius:(CGFloat)radius
{
    UIImage *image = nil;
    
    CGRect rect = (CGRect){0, 0, radius, radius};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        [[UIColor whiteColor] set];
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        [path fill];

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
