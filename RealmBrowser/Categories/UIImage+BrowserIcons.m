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

+ (UIImage *)RLMBrowser_tweaksIcon
{
    UIImage *image = nil;
    
    CGRect rect = (CGRect){0, 0, 25.0f, 25.0f};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// Layer 2 Drawing
        UIBezierPath* layer2Path = [UIBezierPath bezierPath];
        [layer2Path moveToPoint: CGPointMake(14.79, 8.49)];
        [layer2Path addLineToPoint: CGPointMake(16.63, 10.34)];
        [layer2Path addCurveToPoint: CGPointMake(18.98, 10.34) controlPoint1: CGPointMake(17.28, 10.99) controlPoint2: CGPointMake(18.34, 10.99)];
        [layer2Path addLineToPoint: CGPointMake(23.85, 5.42)];
        [layer2Path addCurveToPoint: CGPointMake(24.5, 8.61) controlPoint1: CGPointMake(24.27, 6.4) controlPoint2: CGPointMake(24.5, 7.48)];
        [layer2Path addCurveToPoint: CGPointMake(16.39, 16.72) controlPoint1: CGPointMake(24.5, 13.09) controlPoint2: CGPointMake(20.87, 16.72)];
        [layer2Path addCurveToPoint: CGPointMake(13.5, 16.3) controlPoint1: CGPointMake(15.74, 16.72) controlPoint2: CGPointMake(14.1, 16.44)];
        [layer2Path addCurveToPoint: CGPointMake(8.25, 23.17) controlPoint1: CGPointMake(11.48, 18.5) controlPoint2: CGPointMake(9.4, 22.02)];
        [layer2Path addCurveToPoint: CGPointMake(1.83, 23.17) controlPoint1: CGPointMake(6.48, 24.94) controlPoint2: CGPointMake(3.6, 24.94)];
        [layer2Path addCurveToPoint: CGPointMake(1.83, 16.75) controlPoint1: CGPointMake(0.06, 21.4) controlPoint2: CGPointMake(0.06, 18.52)];
        [layer2Path addCurveToPoint: CGPointMake(8.47, 11.1) controlPoint1: CGPointMake(3.11, 15.47) controlPoint2: CGPointMake(6.64, 12.95)];
        [layer2Path addCurveToPoint: CGPointMake(8.28, 8.61) controlPoint1: CGPointMake(8.38, 10.62) controlPoint2: CGPointMake(8.28, 9.12)];
        [layer2Path addCurveToPoint: CGPointMake(16.39, 0.5) controlPoint1: CGPointMake(8.28, 4.13) controlPoint2: CGPointMake(11.91, 0.5)];
        [layer2Path addCurveToPoint: CGPointMake(19.49, 1.12) controlPoint1: CGPointMake(17.49, 0.5) controlPoint2: CGPointMake(18.53, 0.72)];
        [layer2Path addLineToPoint: CGPointMake(14.79, 6.14)];
        [layer2Path addCurveToPoint: CGPointMake(14.79, 8.49) controlPoint1: CGPointMake(14.14, 6.79) controlPoint2: CGPointMake(14.14, 7.84)];
        [layer2Path closePath];
        [UIColor.blackColor setStroke];
        layer2Path.lineWidth = 1;
        layer2Path.lineJoinStyle = kCGLineJoinRound;
        [layer2Path stroke];
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(3.5, 18.5, 3, 3)];
        [UIColor.blackColor setStroke];
        ovalPath.lineWidth = 1;
        [ovalPath stroke];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
