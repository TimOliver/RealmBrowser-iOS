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

+ (UIImage *)RLMBrowser_quickLookIcon
{
    UIImage *image = nil;

    CGRect rect = (CGRect){0, 0, 31, 17};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// InsideShape Drawing
        UIBezierPath* insideShapePath = [UIBezierPath bezierPath];
        [insideShapePath moveToPoint: CGPointMake(19, 8.5)];
        [insideShapePath addCurveToPoint: CGPointMake(15.5, 12) controlPoint1: CGPointMake(19, 10.43) controlPoint2: CGPointMake(17.43, 12)];
        [insideShapePath addCurveToPoint: CGPointMake(12, 8.5) controlPoint1: CGPointMake(13.57, 12) controlPoint2: CGPointMake(12, 10.43)];
        [insideShapePath addCurveToPoint: CGPointMake(15.5, 5) controlPoint1: CGPointMake(12, 6.57) controlPoint2: CGPointMake(13.57, 5)];
        [insideShapePath addCurveToPoint: CGPointMake(19, 8.5) controlPoint1: CGPointMake(17.43, 5) controlPoint2: CGPointMake(19, 6.57)];
        [insideShapePath closePath];
        [UIColor.blackColor setFill];
        [insideShapePath fill];

        //// OutsideShape Drawing
        UIBezierPath* outsideShapePath = [UIBezierPath bezierPath];
        [outsideShapePath moveToPoint: CGPointMake(15.5, 3)];
        [outsideShapePath addCurveToPoint: CGPointMake(11.44, 4.79) controlPoint1: CGPointMake(13.89, 3) controlPoint2: CGPointMake(12.45, 3.69)];
        [outsideShapePath addCurveToPoint: CGPointMake(10, 8.5) controlPoint1: CGPointMake(10.55, 5.77) controlPoint2: CGPointMake(10, 7.07)];
        [outsideShapePath addCurveToPoint: CGPointMake(15.5, 14) controlPoint1: CGPointMake(10, 11.54) controlPoint2: CGPointMake(12.46, 14)];
        [outsideShapePath addCurveToPoint: CGPointMake(21, 8.5) controlPoint1: CGPointMake(18.54, 14) controlPoint2: CGPointMake(21, 11.54)];
        [outsideShapePath addCurveToPoint: CGPointMake(15.5, 3) controlPoint1: CGPointMake(21, 5.46) controlPoint2: CGPointMake(18.54, 3)];
        [outsideShapePath closePath];
        [outsideShapePath moveToPoint: CGPointMake(30.97, 8.46)];
        [outsideShapePath addCurveToPoint: CGPointMake(15.5, 17) controlPoint1: CGPointMake(31, 8.5) controlPoint2: CGPointMake(24.61, 17.02)];
        [outsideShapePath addCurveToPoint: CGPointMake(0, 8.5) controlPoint1: CGPointMake(6.39, 16.98) controlPoint2: CGPointMake(0, 8.5)];
        [outsideShapePath addCurveToPoint: CGPointMake(15.5, -0) controlPoint1: CGPointMake(0.2, 8.24) controlPoint2: CGPointMake(6.53, 0.02)];
        [outsideShapePath addCurveToPoint: CGPointMake(31, 8.5) controlPoint1: CGPointMake(24.61, -0.02) controlPoint2: CGPointMake(31, 8.5)];
        [outsideShapePath addLineToPoint: CGPointMake(30.97, 8.46)];
        [outsideShapePath closePath];
        [UIColor.blackColor setFill];
        [outsideShapePath fill];

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
