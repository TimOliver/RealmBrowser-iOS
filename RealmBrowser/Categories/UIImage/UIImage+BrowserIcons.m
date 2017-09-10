//
//  UIImage+BrowserTagIcons.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "UIImage+BrowserIcons.h"

@implementation UIImage (BrowserIcons)

+ (UIImage *)RLMBrowser_localRealmLargeIcon
{
    UIImage *image = nil;
    CGRect rect = (CGRect){0, 0, 90, 90};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// Color Declarations
        UIColor* fillColor7 = [UIColor colorWithRed: 0.349 green: 0.337 blue: 0.62 alpha: 1];
        UIColor* fillColor5 = [UIColor colorWithRed: 0.827 green: 0.298 blue: 0.639 alpha: 1];
        UIColor* fillColor = [UIColor colorWithRed: 0.988 green: 0.765 blue: 0.592 alpha: 1];
        UIColor* fillColor2 = [UIColor colorWithRed: 0.988 green: 0.624 blue: 0.584 alpha: 1];
        UIColor* fillColor3 = [UIColor colorWithRed: 0.969 green: 0.486 blue: 0.533 alpha: 1];
        UIColor* fillColor6 = [UIColor colorWithRed: 0.604 green: 0.314 blue: 0.647 alpha: 1];
        UIColor* fillColor4 = [UIColor colorWithRed: 0.949 green: 0.318 blue: 0.573 alpha: 1];
        UIColor* fillColor8 = [UIColor colorWithRed: 0.224 green: 0.278 blue: 0.498 alpha: 1];
        UIColor* color = [UIColor colorWithRed: 0.83 green: 0.83 blue: 0.83 alpha: 1];
        UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.25, 0.25, 89.5, 89.5) cornerRadius: 22];
        [color2 setFill];
        [backgroundPath fill];
        [color setStroke];
        backgroundPath.lineWidth = 0.5;
        backgroundPath.lineCapStyle = kCGLineCapRound;
        backgroundPath.lineJoinStyle = kCGLineJoinRound;
        [backgroundPath stroke];


        //// Orby
        {
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(59.86, 14.23)];
            [bezierPath addCurveToPoint: CGPointMake(45.5, 11) controlPoint1: CGPointMake(55.51, 12.16) controlPoint2: CGPointMake(50.64, 11)];
            [bezierPath addCurveToPoint: CGPointMake(22.38, 20.26) controlPoint1: CGPointMake(36.53, 11) controlPoint2: CGPointMake(28.39, 14.52)];
            [bezierPath addCurveToPoint: CGPointMake(59.86, 14.23) controlPoint1: CGPointMake(15.98, 26.36) controlPoint2: CGPointMake(71.18, 19.6)];
            [bezierPath closePath];
            bezierPath.usesEvenOddFillRule = YES;
            [fillColor setFill];
            [bezierPath fill];


            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(71.67, 23.59)];
            [bezier2Path addCurveToPoint: CGPointMake(60.61, 28.39) controlPoint1: CGPointMake(71.71, 23.63) controlPoint2: CGPointMake(68.94, 27.34)];
            [bezier2Path addCurveToPoint: CGPointMake(14.99, 30.64) controlPoint1: CGPointMake(43.8, 30.51) controlPoint2: CGPointMake(14.95, 30.73)];
            [bezier2Path addCurveToPoint: CGPointMake(22.38, 20.26) controlPoint1: CGPointMake(16.78, 26.72) controlPoint2: CGPointMake(19.3, 23.2)];
            [bezier2Path addCurveToPoint: CGPointMake(33.68, 20.99) controlPoint1: CGPointMake(26, 21.39) controlPoint2: CGPointMake(29.95, 21.68)];
            [bezier2Path addCurveToPoint: CGPointMake(51.43, 14.85) controlPoint1: CGPointMake(39.85, 19.86) controlPoint2: CGPointMake(45.33, 16.3)];
            [bezier2Path addCurveToPoint: CGPointMake(59.86, 14.23) controlPoint1: CGPointMake(54.14, 14.2) controlPoint2: CGPointMake(57.09, 14.01)];
            [bezier2Path addCurveToPoint: CGPointMake(71.67, 23.59) controlPoint1: CGPointMake(64.48, 16.42) controlPoint2: CGPointMake(68.51, 19.64)];
            [bezier2Path closePath];
            bezier2Path.usesEvenOddFillRule = YES;
            [fillColor2 setFill];
            [bezier2Path fill];


            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(78.59, 39.25)];
            [bezier3Path addCurveToPoint: CGPointMake(22.21, 41.91) controlPoint1: CGPointMake(78.61, 39.39) controlPoint2: CGPointMake(40.69, 42.95)];
            [bezier3Path addCurveToPoint: CGPointMake(12.68, 37.74) controlPoint1: CGPointMake(16.2, 41.57) controlPoint2: CGPointMake(12.64, 37.93)];
            [bezier3Path addCurveToPoint: CGPointMake(14.99, 30.64) controlPoint1: CGPointMake(13.19, 35.26) controlPoint2: CGPointMake(13.97, 32.88)];
            [bezier3Path addCurveToPoint: CGPointMake(32.7, 26.1) controlPoint1: CGPointMake(20.33, 27.72) controlPoint2: CGPointMake(26.61, 26.03)];
            [bezier3Path addCurveToPoint: CGPointMake(55.47, 28.53) controlPoint1: CGPointMake(40.34, 26.18) controlPoint2: CGPointMake(47.83, 28.72)];
            [bezier3Path addCurveToPoint: CGPointMake(71.67, 23.59) controlPoint1: CGPointMake(61.14, 28.39) controlPoint2: CGPointMake(66.85, 26.58)];
            [bezier3Path addCurveToPoint: CGPointMake(78.59, 39.25) controlPoint1: CGPointMake(75.22, 28.02) controlPoint2: CGPointMake(77.67, 33.39)];
            [bezier3Path closePath];
            bezier3Path.usesEvenOddFillRule = YES;
            [fillColor3 setFill];
            [bezier3Path fill];


            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(79, 44.5)];
            [bezier4Path addCurveToPoint: CGPointMake(79, 45.06) controlPoint1: CGPointMake(79, 44.69) controlPoint2: CGPointMake(79, 45.06)];
            [bezier4Path addCurveToPoint: CGPointMake(54.9, 47.55) controlPoint1: CGPointMake(79, 45.06) controlPoint2: CGPointMake(68.46, 47.71)];
            [bezier4Path addCurveToPoint: CGPointMake(12, 44.21) controlPoint1: CGPointMake(35.9, 47.33) controlPoint2: CGPointMake(12, 44.27)];
            [bezier4Path addCurveToPoint: CGPointMake(12.69, 37.72) controlPoint1: CGPointMake(12.02, 41.99) controlPoint2: CGPointMake(12.26, 39.82)];
            [bezier4Path addCurveToPoint: CGPointMake(28.07, 41.32) controlPoint1: CGPointMake(17.24, 40.53) controlPoint2: CGPointMake(22.76, 41.9)];
            [bezier4Path addCurveToPoint: CGPointMake(40.22, 37.64) controlPoint1: CGPointMake(32.3, 40.87) controlPoint2: CGPointMake(36.31, 39.3)];
            [bezier4Path addCurveToPoint: CGPointMake(52.16, 33.23) controlPoint1: CGPointMake(44.14, 35.97) controlPoint2: CGPointMake(48.03, 34.19)];
            [bezier4Path addCurveToPoint: CGPointMake(70.55, 34.6) controlPoint1: CGPointMake(58.24, 31.82) controlPoint2: CGPointMake(64.74, 32.31)];
            [bezier4Path addCurveToPoint: CGPointMake(78.59, 39.25) controlPoint1: CGPointMake(73.37, 35.72) controlPoint2: CGPointMake(76.18, 37.32)];
            [bezier4Path addCurveToPoint: CGPointMake(79, 44.5) controlPoint1: CGPointMake(78.86, 40.96) controlPoint2: CGPointMake(79, 42.71)];
            [bezier4Path closePath];
            bezier4Path.usesEvenOddFillRule = YES;
            [fillColor4 setFill];
            [bezier4Path fill];


            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(41.01, 55.38)];
            [bezier5Path addCurveToPoint: CGPointMake(13.67, 54.96) controlPoint1: CGPointMake(30.96, 57.23) controlPoint2: CGPointMake(13.71, 55.09)];
            [bezier5Path addCurveToPoint: CGPointMake(12, 44.5) controlPoint1: CGPointMake(12.58, 51.67) controlPoint2: CGPointMake(12, 48.15)];
            [bezier5Path addCurveToPoint: CGPointMake(12, 44.21) controlPoint1: CGPointMake(12, 44.4) controlPoint2: CGPointMake(12, 44.31)];
            [bezier5Path addCurveToPoint: CGPointMake(17.05, 41.08) controlPoint1: CGPointMake(13.53, 43) controlPoint2: CGPointMake(15.31, 41.92)];
            [bezier5Path addCurveToPoint: CGPointMake(31, 38.59) controlPoint1: CGPointMake(21.35, 39) controlPoint2: CGPointMake(26.24, 38.12)];
            [bezier5Path addCurveToPoint: CGPointMake(44.54, 42.68) controlPoint1: CGPointMake(35.7, 39.06) controlPoint2: CGPointMake(40.19, 40.8)];
            [bezier5Path addCurveToPoint: CGPointMake(55.64, 47.15) controlPoint1: CGPointMake(48.2, 44.26) controlPoint2: CGPointMake(51.84, 45.97)];
            [bezier5Path addCurveToPoint: CGPointMake(41.01, 55.38) controlPoint1: CGPointMake(56.02, 47.26) controlPoint2: CGPointMake(52.07, 53.33)];
            [bezier5Path closePath];
            bezier5Path.usesEvenOddFillRule = YES;
            [fillColor5 setFill];
            [bezier5Path fill];


            //// Bezier 6 Drawing
            UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
            [bezier6Path moveToPoint: CGPointMake(77.79, 53.45)];
            [bezier6Path addCurveToPoint: CGPointMake(62.25, 61.25) controlPoint1: CGPointMake(77.09, 54.63) controlPoint2: CGPointMake(71.3, 60.57)];
            [bezier6Path addCurveToPoint: CGPointMake(39.93, 54.75) controlPoint1: CGPointMake(50.27, 62.16) controlPoint2: CGPointMake(35.23, 56.59)];
            [bezier6Path addCurveToPoint: CGPointMake(61.37, 44.46) controlPoint1: CGPointMake(47.32, 51.85) controlPoint2: CGPointMake(53.73, 46.63)];
            [bezier6Path addCurveToPoint: CGPointMake(79, 45.06) controlPoint1: CGPointMake(67.07, 42.82) controlPoint2: CGPointMake(73.4, 43.08)];
            [bezier6Path addCurveToPoint: CGPointMake(77.79, 53.45) controlPoint1: CGPointMake(78.95, 47.96) controlPoint2: CGPointMake(78.53, 50.77)];
            [bezier6Path closePath];
            bezier6Path.usesEvenOddFillRule = YES;
            [fillColor6 setFill];
            [bezier6Path fill];


            //// Bezier 7 Drawing
            UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
            [bezier7Path moveToPoint: CGPointMake(74.55, 61.2)];
            [bezier7Path addCurveToPoint: CGPointMake(20.68, 67) controlPoint1: CGPointMake(68.76, 71.24) controlPoint2: CGPointMake(26.81, 73.76)];
            [bezier7Path addCurveToPoint: CGPointMake(13.67, 54.96) controlPoint1: CGPointMake(17.56, 63.56) controlPoint2: CGPointMake(15.15, 59.47)];
            [bezier7Path addCurveToPoint: CGPointMake(30.65, 51.56) controlPoint1: CGPointMake(18.82, 52.02) controlPoint2: CGPointMake(24.85, 50.76)];
            [bezier7Path addCurveToPoint: CGPointMake(52.27, 58.4) controlPoint1: CGPointMake(38.15, 52.58) controlPoint2: CGPointMake(44.87, 56.77)];
            [bezier7Path addCurveToPoint: CGPointMake(70.33, 57.23) controlPoint1: CGPointMake(58.25, 59.72) controlPoint2: CGPointMake(64.58, 59.31)];
            [bezier7Path addCurveToPoint: CGPointMake(77.79, 53.45) controlPoint1: CGPointMake(72.93, 56.28) controlPoint2: CGPointMake(75.51, 55.02)];
            [bezier7Path addCurveToPoint: CGPointMake(74.55, 61.2) controlPoint1: CGPointMake(77.03, 56.19) controlPoint2: CGPointMake(75.94, 58.79)];
            [bezier7Path closePath];
            bezier7Path.usesEvenOddFillRule = YES;
            [fillColor7 setFill];
            [bezier7Path fill];


            //// Bezier 8 Drawing
            UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
            [bezier8Path moveToPoint: CGPointMake(74.6, 61.11)];
            [bezier8Path addCurveToPoint: CGPointMake(45.5, 78) controlPoint1: CGPointMake(68.83, 71.2) controlPoint2: CGPointMake(57.96, 78)];
            [bezier8Path addCurveToPoint: CGPointMake(20.68, 67) controlPoint1: CGPointMake(35.66, 78) controlPoint2: CGPointMake(26.81, 73.76)];
            [bezier8Path addCurveToPoint: CGPointMake(23.88, 68.02) controlPoint1: CGPointMake(21.7, 67.39) controlPoint2: CGPointMake(22.83, 67.72)];
            [bezier8Path addCurveToPoint: CGPointMake(41.78, 67.87) controlPoint1: CGPointMake(29.71, 69.62) controlPoint2: CGPointMake(35.98, 69.58)];
            [bezier8Path addCurveToPoint: CGPointMake(52.63, 63.72) controlPoint1: CGPointMake(45.49, 66.78) controlPoint2: CGPointMake(48.98, 65.04)];
            [bezier8Path addCurveToPoint: CGPointMake(74.6, 61.11) controlPoint1: CGPointMake(59.58, 61.21) controlPoint2: CGPointMake(67.24, 60.33)];
            [bezier8Path addLineToPoint: CGPointMake(74.6, 61.11)];
            [bezier8Path closePath];
            bezier8Path.usesEvenOddFillRule = YES;
            [fillColor8 setFill];
            [bezier8Path fill];
        }

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)RLMBrowser_syncRealmLargeIcon
{
    UIImage *image = nil;
    CGRect rect = (CGRect){0, 0, 90, 90};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();

        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.83 green: 0.83 blue: 0.83 alpha: 1];
        UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        UIColor* gradientColor = [UIColor colorWithRed: 0.988 green: 0.765 blue: 0.592 alpha: 1];
        UIColor* gradientColor2 = [UIColor colorWithRed: 0.988 green: 0.624 blue: 0.584 alpha: 1];
        UIColor* gradientColor3 = [UIColor colorWithRed: 0.969 green: 0.486 blue: 0.533 alpha: 1];
        UIColor* gradientColor4 = [UIColor colorWithRed: 0.949 green: 0.318 blue: 0.573 alpha: 1];
        UIColor* gradientColor5 = [UIColor colorWithRed: 0.827 green: 0.298 blue: 0.639 alpha: 1];
        UIColor* gradientColor6 = [UIColor colorWithRed: 0.604 green: 0.314 blue: 0.647 alpha: 1];
        UIColor* gradientColor7 = [UIColor colorWithRed: 0.349 green: 0.337 blue: 0.62 alpha: 1];
        UIColor* gradientColor8 = [UIColor colorWithRed: 0.224 green: 0.278 blue: 0.498 alpha: 1];

        //// Gradient Declarations
        CGFloat linearGradient1Locations[] = {0, 0.16, 0.3, 0.43, 0.56, 0.69, 0.84, 1};
        CGGradientRef linearGradient1 = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor, (id)gradientColor4.CGColor, (id)gradientColor5.CGColor, (id)gradientColor6.CGColor, (id)gradientColor7.CGColor, (id)gradientColor8.CGColor], linearGradient1Locations);

        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.25, 0.25, 89.5, 89.5) cornerRadius: 22];
        [color2 setFill];
        [backgroundPath fill];
        [color setStroke];
        backgroundPath.lineWidth = 0.5;
        backgroundPath.lineCapStyle = kCGLineCapRound;
        backgroundPath.lineJoinStyle = kCGLineJoinRound;
        [backgroundPath stroke];


        //// Ziggy Drawing
        UIBezierPath* ziggyPath = [UIBezierPath bezierPath];
        [ziggyPath moveToPoint: CGPointMake(39.56, 29.14)];
        [ziggyPath addCurveToPoint: CGPointMake(29.53, 34.2) controlPoint1: CGPointMake(36.38, 31.19) controlPoint2: CGPointMake(32.96, 32.87)];
        [ziggyPath addCurveToPoint: CGPointMake(26.23, 35.37) controlPoint1: CGPointMake(28.34, 34.67) controlPoint2: CGPointMake(27.23, 35.06)];
        [ziggyPath addCurveToPoint: CGPointMake(25.03, 35.73) controlPoint1: CGPointMake(25.65, 35.56) controlPoint2: CGPointMake(25.24, 35.67)];
        [ziggyPath addCurveToPoint: CGPointMake(23.55, 36.27) controlPoint1: CGPointMake(24.35, 35.95) controlPoint2: CGPointMake(23.89, 36.11)];
        [ziggyPath addCurveToPoint: CGPointMake(22.9, 36.66) controlPoint1: CGPointMake(23.3, 36.39) controlPoint2: CGPointMake(23.1, 36.51)];
        [ziggyPath addCurveToPoint: CGPointMake(22.2, 39.06) controlPoint1: CGPointMake(22.22, 37.19) controlPoint2: CGPointMake(21.77, 37.93)];
        [ziggyPath addCurveToPoint: CGPointMake(23.86, 40.38) controlPoint1: CGPointMake(22.55, 39.98) controlPoint2: CGPointMake(23.13, 40.26)];
        [ziggyPath addCurveToPoint: CGPointMake(24.57, 40.43) controlPoint1: CGPointMake(24.08, 40.42) controlPoint2: CGPointMake(24.31, 40.43)];
        [ziggyPath addCurveToPoint: CGPointMake(26.04, 40.28) controlPoint1: CGPointMake(24.95, 40.42) controlPoint2: CGPointMake(25.44, 40.37)];
        [ziggyPath addLineToPoint: CGPointMake(59.09, 35.57)];
        [ziggyPath addCurveToPoint: CGPointMake(24.29, 55.6) controlPoint1: CGPointMake(47.49, 42.24) controlPoint2: CGPointMake(24.29, 55.6)];
        [ziggyPath addCurveToPoint: CGPointMake(26.04, 60.76) controlPoint1: CGPointMake(20.46, 57.8) controlPoint2: CGPointMake(21.69, 61.38)];
        [ziggyPath addLineToPoint: CGPointMake(57.83, 56.22)];
        [ziggyPath addCurveToPoint: CGPointMake(47.85, 62.68) controlPoint1: CGPointMake(54.41, 58.18) controlPoint2: CGPointMake(51.04, 60.34)];
        [ziggyPath addCurveToPoint: CGPointMake(33.01, 78.06) controlPoint1: CGPointMake(41.09, 67.62) controlPoint2: CGPointMake(35.93, 72.76)];
        [ziggyPath addLineToPoint: CGPointMake(36.49, 80)];
        [ziggyPath addCurveToPoint: CGPointMake(50.19, 65.91) controlPoint1: CGPointMake(39.08, 75.31) controlPoint2: CGPointMake(43.86, 70.54)];
        [ziggyPath addCurveToPoint: CGPointMake(61.43, 58.77) controlPoint1: CGPointMake(53.76, 63.3) controlPoint2: CGPointMake(57.59, 60.9)];
        [ziggyPath addCurveToPoint: CGPointMake(65.13, 56.8) controlPoint1: CGPointMake(62.77, 58.03) controlPoint2: CGPointMake(64.02, 57.37)];
        [ziggyPath addCurveToPoint: CGPointMake(66.51, 56.12) controlPoint1: CGPointMake(65.8, 56.47) controlPoint2: CGPointMake(66.27, 56.24)];
        [ziggyPath addCurveToPoint: CGPointMake(64.96, 51.11) controlPoint1: CGPointMake(70.51, 54.06) controlPoint2: CGPointMake(69.35, 50.48)];
        [ziggyPath addLineToPoint: CGPointMake(31.84, 55.86)];
        [ziggyPath addLineToPoint: CGPointMake(66.71, 35.79)];
        [ziggyPath addCurveToPoint: CGPointMake(64.96, 30.63) controlPoint1: CGPointMake(70.5, 33.6) controlPoint2: CGPointMake(69.35, 30)];
        [ziggyPath addLineToPoint: CGPointMake(38.61, 34.37)];
        [ziggyPath addCurveToPoint: CGPointMake(41.71, 32.51) controlPoint1: CGPointMake(38.6, 34.37) controlPoint2: CGPointMake(40.69, 33.17)];
        [ziggyPath addCurveToPoint: CGPointMake(57.46, 10.57) controlPoint1: CGPointMake(50.39, 26.92) controlPoint2: CGPointMake(56.15, 19.68)];
        [ziggyPath addLineToPoint: CGPointMake(53.51, 10)];
        [ziggyPath addCurveToPoint: CGPointMake(39.56, 29.14) controlPoint1: CGPointMake(52.39, 17.78) controlPoint2: CGPointMake(47.36, 24.12)];
        [ziggyPath closePath];
        ziggyPath.usesEvenOddFillRule = YES;
        CGContextSaveGState(context);
        [ziggyPath addClip];
        CGContextDrawLinearGradient(context, linearGradient1,
                                    CGPointMake(45.5, 27.74),
                                    CGPointMake(45.5, 62.26),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);


        //// Cleanup
        CGGradientRelease(linearGradient1);


        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)RLMBrowser_inMemoryRealmLargeIcon
{
    UIImage *image = nil;
    CGRect rect = (CGRect){0, 0, 90, 90};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();

        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.83 green: 0.83 blue: 0.83 alpha: 1];
        UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        UIColor* gradientColor = [UIColor colorWithRed: 0.988 green: 0.765 blue: 0.592 alpha: 1];
        UIColor* gradientColor2 = [UIColor colorWithRed: 0.988 green: 0.624 blue: 0.584 alpha: 1];
        UIColor* gradientColor3 = [UIColor colorWithRed: 0.969 green: 0.486 blue: 0.533 alpha: 1];
        UIColor* gradientColor4 = [UIColor colorWithRed: 0.949 green: 0.318 blue: 0.573 alpha: 1];
        UIColor* gradientColor5 = [UIColor colorWithRed: 0.827 green: 0.298 blue: 0.639 alpha: 1];
        UIColor* gradientColor6 = [UIColor colorWithRed: 0.604 green: 0.314 blue: 0.647 alpha: 1];
        UIColor* gradientColor7 = [UIColor colorWithRed: 0.349 green: 0.337 blue: 0.62 alpha: 1];
        UIColor* gradientColor8 = [UIColor colorWithRed: 0.224 green: 0.278 blue: 0.498 alpha: 1];

        //// Gradient Declarations
        CGFloat linearGradient1Locations[] = {0, 0.16, 0.3, 0.43, 0.56, 0.69, 0.84, 1};
        CGGradientRef linearGradient1 = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor, (id)gradientColor4.CGColor, (id)gradientColor5.CGColor, (id)gradientColor6.CGColor, (id)gradientColor7.CGColor, (id)gradientColor8.CGColor], linearGradient1Locations);

        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.25, 0.25, 89.5, 89.5) cornerRadius: 22];
        [color2 setFill];
        [backgroundPath fill];
        [color setStroke];
        backgroundPath.lineWidth = 0.5;
        backgroundPath.lineCapStyle = kCGLineCapRound;
        backgroundPath.lineJoinStyle = kCGLineJoinRound;
        [backgroundPath stroke];


        //// ramChip Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 9.5, 56.5);
        CGContextRotateCTM(context, -45 * M_PI/180);

        UIBezierPath* ramChipPath = [UIBezierPath bezierPath];
        [ramChipPath moveToPoint: CGPointMake(20.15, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(26.87, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(26.87, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(20.15, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(20.15, 17.49)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(40.31, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(47.02, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(47.02, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(40.31, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(40.31, 17.49)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(50.38, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(57.1, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(57.1, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(50.38, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(50.38, 17.49)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(10.08, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(16.79, 17.49)];
        [ramChipPath addLineToPoint: CGPointMake(16.79, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(10.08, 8.75)];
        [ramChipPath addLineToPoint: CGPointMake(10.08, 17.49)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(61.58, 0)];
        [ramChipPath addLineToPoint: CGPointMake(5.6, 0)];
        [ramChipPath addCurveToPoint: CGPointMake(0, 5.25) controlPoint1: CGPointMake(2.51, 0) controlPoint2: CGPointMake(0, 2.35)];
        [ramChipPath addLineToPoint: CGPointMake(0, 20.99)];
        [ramChipPath addCurveToPoint: CGPointMake(5.6, 26.24) controlPoint1: CGPointMake(0, 23.89) controlPoint2: CGPointMake(2.51, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(5.6, 31.48)];
        [ramChipPath addCurveToPoint: CGPointMake(7.46, 33.23) controlPoint1: CGPointMake(5.6, 32.45) controlPoint2: CGPointMake(6.43, 33.23)];
        [ramChipPath addLineToPoint: CGPointMake(59.71, 33.23)];
        [ramChipPath addCurveToPoint: CGPointMake(61.58, 31.48) controlPoint1: CGPointMake(60.74, 33.23) controlPoint2: CGPointMake(61.58, 32.45)];
        [ramChipPath addLineToPoint: CGPointMake(61.58, 26.24)];
        [ramChipPath addCurveToPoint: CGPointMake(67.18, 20.99) controlPoint1: CGPointMake(64.67, 26.24) controlPoint2: CGPointMake(67.18, 23.89)];
        [ramChipPath addLineToPoint: CGPointMake(67.18, 5.25)];
        [ramChipPath addCurveToPoint: CGPointMake(61.58, 0) controlPoint1: CGPointMake(67.18, 2.35) controlPoint2: CGPointMake(64.67, 0)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(13.06, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(9.33, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(9.33, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(13.06, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(13.06, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(20.53, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(16.79, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(16.79, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(20.53, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(20.53, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(27.99, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(24.26, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(24.26, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(27.99, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(27.99, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(29.86, 20.99)];
        [ramChipPath addLineToPoint: CGPointMake(6.72, 20.99)];
        [ramChipPath addLineToPoint: CGPointMake(6.72, 5.25)];
        [ramChipPath addLineToPoint: CGPointMake(29.86, 5.25)];
        [ramChipPath addLineToPoint: CGPointMake(29.86, 20.99)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(35.45, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(31.72, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(31.72, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(35.45, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(35.45, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(42.92, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(39.19, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(39.19, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(42.92, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(42.92, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(50.38, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(46.65, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(46.65, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(50.38, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(50.38, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(57.85, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(54.11, 29.74)];
        [ramChipPath addLineToPoint: CGPointMake(54.11, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(57.85, 26.24)];
        [ramChipPath addLineToPoint: CGPointMake(57.85, 29.74)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(60.46, 20.99)];
        [ramChipPath addLineToPoint: CGPointMake(37.32, 20.99)];
        [ramChipPath addLineToPoint: CGPointMake(37.32, 5.25)];
        [ramChipPath addLineToPoint: CGPointMake(60.46, 5.25)];
        [ramChipPath addLineToPoint: CGPointMake(60.46, 20.99)];
        [ramChipPath closePath];
        CGContextSaveGState(context);
        [ramChipPath addClip];
        CGContextDrawLinearGradient(context, linearGradient1,
                                    CGPointMake(50.13, 7.49),
                                    CGPointMake(16.29, 25.16),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);

        CGContextRestoreGState(context);


        //// Cleanup
        CGGradientRelease(linearGradient1);

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)RLMBrowser_localRealmIcon
{
    UIImage *image = nil;

    CGRect rect = (CGRect){0, 0, 32, 32};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// Color Declarations
        UIColor* fillColor7 = [UIColor colorWithRed: 0.349 green: 0.337 blue: 0.62 alpha: 1];
        UIColor* fillColor5 = [UIColor colorWithRed: 0.827 green: 0.298 blue: 0.639 alpha: 1];
        UIColor* fillColor = [UIColor colorWithRed: 0.988 green: 0.765 blue: 0.592 alpha: 1];
        UIColor* fillColor2 = [UIColor colorWithRed: 0.988 green: 0.624 blue: 0.584 alpha: 1];
        UIColor* fillColor3 = [UIColor colorWithRed: 0.969 green: 0.486 blue: 0.533 alpha: 1];
        UIColor* fillColor6 = [UIColor colorWithRed: 0.604 green: 0.314 blue: 0.647 alpha: 1];
        UIColor* fillColor4 = [UIColor colorWithRed: 0.949 green: 0.318 blue: 0.573 alpha: 1];
        UIColor* fillColor8 = [UIColor colorWithRed: 0.224 green: 0.278 blue: 0.498 alpha: 1];
        UIColor* color = [UIColor colorWithRed: 0.83 green: 0.83 blue: 0.83 alpha: 1];
        UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.25, 0.25, 31.5, 31.5) cornerRadius: 7];
        [color2 setFill];
        [backgroundPath fill];
        [color setStroke];
        backgroundPath.lineWidth = 0.5;
        backgroundPath.lineCapStyle = kCGLineCapRound;
        backgroundPath.lineJoinStyle = kCGLineJoinRound;
        [backgroundPath stroke];


        //// Orby
        {
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(20.72, 6.06)];
            [bezierPath addCurveToPoint: CGPointMake(16, 5) controlPoint1: CGPointMake(19.29, 5.38) controlPoint2: CGPointMake(17.69, 5)];
            [bezierPath addCurveToPoint: CGPointMake(8.41, 8.04) controlPoint1: CGPointMake(13.06, 5) controlPoint2: CGPointMake(10.38, 6.16)];
            [bezierPath addCurveToPoint: CGPointMake(20.72, 6.06) controlPoint1: CGPointMake(6.31, 10.04) controlPoint2: CGPointMake(24.43, 7.83)];
            [bezierPath closePath];
            bezierPath.usesEvenOddFillRule = YES;
            [fillColor setFill];
            [bezierPath fill];


            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(24.59, 9.13)];
            [bezier2Path addCurveToPoint: CGPointMake(20.96, 10.71) controlPoint1: CGPointMake(24.61, 9.15) controlPoint2: CGPointMake(23.7, 10.36)];
            [bezier2Path addCurveToPoint: CGPointMake(5.98, 11.45) controlPoint1: CGPointMake(15.44, 11.41) controlPoint2: CGPointMake(5.97, 11.48)];
            [bezier2Path addCurveToPoint: CGPointMake(8.41, 8.04) controlPoint1: CGPointMake(6.57, 10.16) controlPoint2: CGPointMake(7.4, 9.01)];
            [bezier2Path addCurveToPoint: CGPointMake(12.12, 8.28) controlPoint1: CGPointMake(9.6, 8.41) controlPoint2: CGPointMake(10.89, 8.51)];
            [bezier2Path addCurveToPoint: CGPointMake(17.95, 6.26) controlPoint1: CGPointMake(14.14, 7.91) controlPoint2: CGPointMake(15.94, 6.74)];
            [bezier2Path addCurveToPoint: CGPointMake(20.72, 6.06) controlPoint1: CGPointMake(18.84, 6.05) controlPoint2: CGPointMake(19.8, 5.99)];
            [bezier2Path addCurveToPoint: CGPointMake(24.59, 9.13) controlPoint1: CGPointMake(22.23, 6.78) controlPoint2: CGPointMake(23.56, 7.84)];
            [bezier2Path closePath];
            bezier2Path.usesEvenOddFillRule = YES;
            [fillColor2 setFill];
            [bezier2Path fill];


            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(26.87, 14.28)];
            [bezier3Path addCurveToPoint: CGPointMake(8.35, 15.15) controlPoint1: CGPointMake(26.87, 14.32) controlPoint2: CGPointMake(14.42, 15.49)];
            [bezier3Path addCurveToPoint: CGPointMake(5.22, 13.78) controlPoint1: CGPointMake(6.38, 15.04) controlPoint2: CGPointMake(5.21, 13.84)];
            [bezier3Path addCurveToPoint: CGPointMake(5.98, 11.45) controlPoint1: CGPointMake(5.39, 12.97) controlPoint2: CGPointMake(5.65, 12.19)];
            [bezier3Path addCurveToPoint: CGPointMake(11.8, 9.96) controlPoint1: CGPointMake(7.74, 10.49) controlPoint2: CGPointMake(9.8, 9.94)];
            [bezier3Path addCurveToPoint: CGPointMake(19.27, 10.76) controlPoint1: CGPointMake(14.3, 9.98) controlPoint2: CGPointMake(16.76, 10.82)];
            [bezier3Path addCurveToPoint: CGPointMake(24.59, 9.13) controlPoint1: CGPointMake(21.13, 10.71) controlPoint2: CGPointMake(23.01, 10.11)];
            [bezier3Path addCurveToPoint: CGPointMake(26.87, 14.28) controlPoint1: CGPointMake(25.76, 10.59) controlPoint2: CGPointMake(26.56, 12.35)];
            [bezier3Path closePath];
            bezier3Path.usesEvenOddFillRule = YES;
            [fillColor3 setFill];
            [bezier3Path fill];


            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(27, 16)];
            [bezier4Path addCurveToPoint: CGPointMake(27, 16.18) controlPoint1: CGPointMake(27, 16.06) controlPoint2: CGPointMake(27, 16.18)];
            [bezier4Path addCurveToPoint: CGPointMake(19.09, 17) controlPoint1: CGPointMake(27, 16.18) controlPoint2: CGPointMake(23.54, 17.05)];
            [bezier4Path addCurveToPoint: CGPointMake(5, 15.91) controlPoint1: CGPointMake(12.85, 16.93) controlPoint2: CGPointMake(5, 15.92)];
            [bezier4Path addCurveToPoint: CGPointMake(5.23, 13.77) controlPoint1: CGPointMake(5.01, 15.18) controlPoint2: CGPointMake(5.08, 14.46)];
            [bezier4Path addCurveToPoint: CGPointMake(10.28, 14.96) controlPoint1: CGPointMake(6.72, 14.7) controlPoint2: CGPointMake(8.53, 15.15)];
            [bezier4Path addCurveToPoint: CGPointMake(14.27, 13.75) controlPoint1: CGPointMake(11.66, 14.81) controlPoint2: CGPointMake(12.98, 14.29)];
            [bezier4Path addCurveToPoint: CGPointMake(18.19, 12.3) controlPoint1: CGPointMake(15.55, 13.2) controlPoint2: CGPointMake(16.83, 12.61)];
            [bezier4Path addCurveToPoint: CGPointMake(24.22, 12.75) controlPoint1: CGPointMake(20.18, 11.84) controlPoint2: CGPointMake(22.32, 12)];
            [bezier4Path addCurveToPoint: CGPointMake(26.87, 14.28) controlPoint1: CGPointMake(25.15, 13.12) controlPoint2: CGPointMake(26.07, 13.64)];
            [bezier4Path addCurveToPoint: CGPointMake(27, 16) controlPoint1: CGPointMake(26.95, 14.84) controlPoint2: CGPointMake(27, 15.41)];
            [bezier4Path closePath];
            bezier4Path.usesEvenOddFillRule = YES;
            [fillColor4 setFill];
            [bezier4Path fill];


            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(14.53, 19.57)];
            [bezier5Path addCurveToPoint: CGPointMake(5.55, 19.43) controlPoint1: CGPointMake(11.22, 20.18) controlPoint2: CGPointMake(5.56, 19.48)];
            [bezier5Path addCurveToPoint: CGPointMake(5, 16) controlPoint1: CGPointMake(5.19, 18.35) controlPoint2: CGPointMake(5, 17.2)];
            [bezier5Path addCurveToPoint: CGPointMake(5, 15.91) controlPoint1: CGPointMake(5, 15.97) controlPoint2: CGPointMake(5, 15.94)];
            [bezier5Path addCurveToPoint: CGPointMake(6.66, 14.88) controlPoint1: CGPointMake(5.5, 15.51) controlPoint2: CGPointMake(6.09, 15.15)];
            [bezier5Path addCurveToPoint: CGPointMake(11.24, 14.06) controlPoint1: CGPointMake(8.07, 14.19) controlPoint2: CGPointMake(9.67, 13.91)];
            [bezier5Path addCurveToPoint: CGPointMake(15.68, 15.4) controlPoint1: CGPointMake(12.78, 14.21) controlPoint2: CGPointMake(14.26, 14.79)];
            [bezier5Path addCurveToPoint: CGPointMake(19.33, 16.87) controlPoint1: CGPointMake(16.89, 15.92) controlPoint2: CGPointMake(18.08, 16.48)];
            [bezier5Path addCurveToPoint: CGPointMake(14.53, 19.57) controlPoint1: CGPointMake(19.45, 16.91) controlPoint2: CGPointMake(18.16, 18.9)];
            [bezier5Path closePath];
            bezier5Path.usesEvenOddFillRule = YES;
            [fillColor5 setFill];
            [bezier5Path fill];


            //// Bezier 6 Drawing
            UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
            [bezier6Path moveToPoint: CGPointMake(26.6, 18.94)];
            [bezier6Path addCurveToPoint: CGPointMake(21.5, 21.5) controlPoint1: CGPointMake(26.37, 19.33) controlPoint2: CGPointMake(24.47, 21.28)];
            [bezier6Path addCurveToPoint: CGPointMake(14.17, 19.37) controlPoint1: CGPointMake(17.57, 21.8) controlPoint2: CGPointMake(12.63, 19.97)];
            [bezier6Path addCurveToPoint: CGPointMake(21.21, 15.99) controlPoint1: CGPointMake(16.6, 18.41) controlPoint2: CGPointMake(18.7, 16.7)];
            [bezier6Path addCurveToPoint: CGPointMake(27, 16.18) controlPoint1: CGPointMake(23.08, 15.45) controlPoint2: CGPointMake(25.16, 15.53)];
            [bezier6Path addCurveToPoint: CGPointMake(26.6, 18.94) controlPoint1: CGPointMake(26.98, 17.14) controlPoint2: CGPointMake(26.85, 18.06)];
            [bezier6Path closePath];
            bezier6Path.usesEvenOddFillRule = YES;
            [fillColor6 setFill];
            [bezier6Path fill];


            //// Bezier 7 Drawing
            UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
            [bezier7Path moveToPoint: CGPointMake(25.54, 21.48)];
            [bezier7Path addCurveToPoint: CGPointMake(7.85, 23.39) controlPoint1: CGPointMake(23.64, 24.78) controlPoint2: CGPointMake(9.86, 25.61)];
            [bezier7Path addCurveToPoint: CGPointMake(5.55, 19.43) controlPoint1: CGPointMake(6.83, 22.26) controlPoint2: CGPointMake(6.03, 20.92)];
            [bezier7Path addCurveToPoint: CGPointMake(11.12, 18.32) controlPoint1: CGPointMake(7.24, 18.47) controlPoint2: CGPointMake(9.22, 18.06)];
            [bezier7Path addCurveToPoint: CGPointMake(18.22, 20.57) controlPoint1: CGPointMake(13.59, 18.65) controlPoint2: CGPointMake(15.79, 20.03)];
            [bezier7Path addCurveToPoint: CGPointMake(24.15, 20.18) controlPoint1: CGPointMake(20.19, 21) controlPoint2: CGPointMake(22.27, 20.86)];
            [bezier7Path addCurveToPoint: CGPointMake(26.6, 18.94) controlPoint1: CGPointMake(25.01, 19.87) controlPoint2: CGPointMake(25.85, 19.45)];
            [bezier7Path addCurveToPoint: CGPointMake(25.54, 21.48) controlPoint1: CGPointMake(26.35, 19.84) controlPoint2: CGPointMake(25.99, 20.69)];
            [bezier7Path closePath];
            bezier7Path.usesEvenOddFillRule = YES;
            [fillColor7 setFill];
            [bezier7Path fill];


            //// Bezier 8 Drawing
            UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
            [bezier8Path moveToPoint: CGPointMake(25.55, 21.45)];
            [bezier8Path addCurveToPoint: CGPointMake(16, 27) controlPoint1: CGPointMake(23.66, 24.77) controlPoint2: CGPointMake(20.09, 27)];
            [bezier8Path addCurveToPoint: CGPointMake(7.85, 23.39) controlPoint1: CGPointMake(12.77, 27) controlPoint2: CGPointMake(9.86, 25.61)];
            [bezier8Path addCurveToPoint: CGPointMake(8.9, 23.72) controlPoint1: CGPointMake(8.18, 23.52) controlPoint2: CGPointMake(8.56, 23.63)];
            [bezier8Path addCurveToPoint: CGPointMake(14.78, 23.67) controlPoint1: CGPointMake(10.81, 24.25) controlPoint2: CGPointMake(12.87, 24.24)];
            [bezier8Path addCurveToPoint: CGPointMake(18.34, 22.31) controlPoint1: CGPointMake(16, 23.32) controlPoint2: CGPointMake(17.14, 22.74)];
            [bezier8Path addCurveToPoint: CGPointMake(25.55, 21.45) controlPoint1: CGPointMake(20.62, 21.49) controlPoint2: CGPointMake(23.14, 21.2)];
            [bezier8Path addLineToPoint: CGPointMake(25.55, 21.45)];
            [bezier8Path closePath];
            bezier8Path.usesEvenOddFillRule = YES;
            [fillColor8 setFill];
            [bezier8Path fill];
        }

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)RLMBrowser_syncRealmIcon
{
    UIImage *image = nil;

    CGRect rect = (CGRect){0, 0, 32, 32};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();

        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.83 green: 0.83 blue: 0.83 alpha: 1];
        UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        UIColor* gradientColor = [UIColor colorWithRed: 0.988 green: 0.765 blue: 0.592 alpha: 1];
        UIColor* gradientColor2 = [UIColor colorWithRed: 0.988 green: 0.624 blue: 0.584 alpha: 1];
        UIColor* gradientColor3 = [UIColor colorWithRed: 0.969 green: 0.486 blue: 0.533 alpha: 1];
        UIColor* gradientColor4 = [UIColor colorWithRed: 0.949 green: 0.318 blue: 0.573 alpha: 1];
        UIColor* gradientColor5 = [UIColor colorWithRed: 0.827 green: 0.298 blue: 0.639 alpha: 1];
        UIColor* gradientColor6 = [UIColor colorWithRed: 0.604 green: 0.314 blue: 0.647 alpha: 1];
        UIColor* gradientColor7 = [UIColor colorWithRed: 0.349 green: 0.337 blue: 0.62 alpha: 1];
        UIColor* gradientColor8 = [UIColor colorWithRed: 0.224 green: 0.278 blue: 0.498 alpha: 1];

        //// Gradient Declarations
        CGFloat linearGradient1Locations[] = {0, 0.16, 0.3, 0.43, 0.56, 0.69, 0.84, 1};
        CGGradientRef linearGradient1 = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor, (id)gradientColor4.CGColor, (id)gradientColor5.CGColor, (id)gradientColor6.CGColor, (id)gradientColor7.CGColor, (id)gradientColor8.CGColor], linearGradient1Locations);

        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.25, 0.25, 31.5, 31.5) cornerRadius: 7];
        [color2 setFill];
        [backgroundPath fill];
        [color setStroke];
        backgroundPath.lineWidth = 0.5;
        backgroundPath.lineCapStyle = kCGLineCapRound;
        backgroundPath.lineJoinStyle = kCGLineJoinRound;
        [backgroundPath stroke];


        //// Ziggy Drawing
        UIBezierPath* ziggyPath = [UIBezierPath bezierPath];
        [ziggyPath moveToPoint: CGPointMake(13.8, 10.93)];
        [ziggyPath addCurveToPoint: CGPointMake(10.66, 12.5) controlPoint1: CGPointMake(12.8, 11.57) controlPoint2: CGPointMake(11.73, 12.09)];
        [ziggyPath addCurveToPoint: CGPointMake(9.63, 12.86) controlPoint1: CGPointMake(10.29, 12.65) controlPoint2: CGPointMake(9.94, 12.77)];
        [ziggyPath addCurveToPoint: CGPointMake(9.26, 12.98) controlPoint1: CGPointMake(9.45, 12.92) controlPoint2: CGPointMake(9.32, 12.96)];
        [ziggyPath addCurveToPoint: CGPointMake(8.79, 13.15) controlPoint1: CGPointMake(9.04, 13.04) controlPoint2: CGPointMake(8.9, 13.1)];
        [ziggyPath addCurveToPoint: CGPointMake(8.59, 13.26) controlPoint1: CGPointMake(8.72, 13.18) controlPoint2: CGPointMake(8.65, 13.22)];
        [ziggyPath addCurveToPoint: CGPointMake(8.37, 14.01) controlPoint1: CGPointMake(8.38, 13.43) controlPoint2: CGPointMake(8.24, 13.66)];
        [ziggyPath addCurveToPoint: CGPointMake(8.89, 14.42) controlPoint1: CGPointMake(8.48, 14.29) controlPoint2: CGPointMake(8.66, 14.38)];
        [ziggyPath addCurveToPoint: CGPointMake(9.11, 14.43) controlPoint1: CGPointMake(8.96, 14.43) controlPoint2: CGPointMake(9.03, 14.43)];
        [ziggyPath addCurveToPoint: CGPointMake(9.57, 14.39) controlPoint1: CGPointMake(9.23, 14.43) controlPoint2: CGPointMake(9.38, 14.41)];
        [ziggyPath addLineToPoint: CGPointMake(19.9, 12.93)];
        [ziggyPath addCurveToPoint: CGPointMake(9.02, 19.14) controlPoint1: CGPointMake(16.28, 15) controlPoint2: CGPointMake(9.02, 19.14)];
        [ziggyPath addCurveToPoint: CGPointMake(9.57, 20.73) controlPoint1: CGPointMake(7.83, 19.82) controlPoint2: CGPointMake(8.21, 20.93)];
        [ziggyPath addLineToPoint: CGPointMake(19.51, 19.33)];
        [ziggyPath addCurveToPoint: CGPointMake(16.39, 21.33) controlPoint1: CGPointMake(18.44, 19.94) controlPoint2: CGPointMake(17.39, 20.61)];
        [ziggyPath addCurveToPoint: CGPointMake(11.75, 26.1) controlPoint1: CGPointMake(14.28, 22.86) controlPoint2: CGPointMake(12.66, 24.46)];
        [ziggyPath addLineToPoint: CGPointMake(12.84, 26.7)];
        [ziggyPath addCurveToPoint: CGPointMake(17.12, 22.33) controlPoint1: CGPointMake(13.65, 25.25) controlPoint2: CGPointMake(15.14, 23.77)];
        [ziggyPath addCurveToPoint: CGPointMake(20.63, 20.12) controlPoint1: CGPointMake(18.24, 21.52) controlPoint2: CGPointMake(19.43, 20.78)];
        [ziggyPath addCurveToPoint: CGPointMake(21.79, 19.51) controlPoint1: CGPointMake(21.05, 19.89) controlPoint2: CGPointMake(21.44, 19.68)];
        [ziggyPath addCurveToPoint: CGPointMake(22.22, 19.3) controlPoint1: CGPointMake(22, 19.4) controlPoint2: CGPointMake(22.15, 19.33)];
        [ziggyPath addCurveToPoint: CGPointMake(21.74, 17.74) controlPoint1: CGPointMake(23.47, 18.66) controlPoint2: CGPointMake(23.11, 17.55)];
        [ziggyPath addLineToPoint: CGPointMake(11.39, 19.22)];
        [ziggyPath addLineToPoint: CGPointMake(22.28, 12.99)];
        [ziggyPath addCurveToPoint: CGPointMake(21.74, 11.4) controlPoint1: CGPointMake(23.47, 12.32) controlPoint2: CGPointMake(23.11, 11.2)];
        [ziggyPath addLineToPoint: CGPointMake(13.5, 12.56)];
        [ziggyPath addCurveToPoint: CGPointMake(14.47, 11.98) controlPoint1: CGPointMake(13.5, 12.56) controlPoint2: CGPointMake(14.15, 12.18)];
        [ziggyPath addCurveToPoint: CGPointMake(19.39, 5.18) controlPoint1: CGPointMake(17.18, 10.25) controlPoint2: CGPointMake(18.98, 8)];
        [ziggyPath addLineToPoint: CGPointMake(18.16, 5)];
        [ziggyPath addCurveToPoint: CGPointMake(13.8, 10.93) controlPoint1: CGPointMake(17.81, 7.41) controlPoint2: CGPointMake(16.24, 9.38)];
        [ziggyPath closePath];
        ziggyPath.usesEvenOddFillRule = YES;
        CGContextSaveGState(context);
        [ziggyPath addClip];
        CGContextDrawLinearGradient(context, linearGradient1,
                                    CGPointMake(15.65, 5),
                                    CGPointMake(15.65, 26.7),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Cleanup
        CGGradientRelease(linearGradient1);

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)RLMBrowser_schemaIconForColor:(UIColor *)fillColor
{
    UIImage *image = nil;

    CGRect rect = (CGRect){0, 0, 18, 18};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 18, 18)];
        [fillColor setFill];
        [ovalPath fill];


        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(4, 5, 10, 2) cornerRadius: 1];
        [UIColor.whiteColor setFill];
        [rectanglePath fill];


        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(4, 8, 10, 2) cornerRadius: 1];
        [UIColor.whiteColor setFill];
        [rectangle2Path fill];


        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(4, 11, 10, 2) cornerRadius: 1];
        [UIColor.whiteColor setFill];
        [rectangle3Path fill];

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)RLMBrowser_encryptedIcon
{
    UIImage *image = nil;

    CGRect rect = (CGRect){0, 0, 12, 16};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {

        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 7.5, 11, 8) cornerRadius: 2];
        [UIColor.blackColor setStroke];
        rectanglePath.lineWidth = 1;
        [rectanglePath stroke];


        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(2.5, 7.5)];
        [rectangle2Path addLineToPoint: CGPointMake(2.5, 4)];
        [rectangle2Path addCurveToPoint: CGPointMake(6, 0.5) controlPoint1: CGPointMake(2.5, 1.51) controlPoint2: CGPointMake(4.07, 0.5)];
        [rectangle2Path addLineToPoint: CGPointMake(6, 0.5)];
        [rectangle2Path addLineToPoint: CGPointMake(6, 0.5)];
        [rectangle2Path addLineToPoint: CGPointMake(6, 0.5)];
        [rectangle2Path addLineToPoint: CGPointMake(6, 0.5)];
        [rectangle2Path addLineToPoint: CGPointMake(6, 0.5)];
        [rectangle2Path addCurveToPoint: CGPointMake(9.5, 4) controlPoint1: CGPointMake(7.93, 0.5) controlPoint2: CGPointMake(9.5, 1.51)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 4)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 4)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 4)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 4)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 7.5)];
        [UIColor.blackColor setStroke];
        rectangle2Path.lineWidth = 1;
        [rectangle2Path stroke];


        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)RLMBrowser_inMemoryRealmIcon
{
    UIImage *image = nil;

    CGRect rect = (CGRect){0, 0, 32, 32};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    {
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();

        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.83 green: 0.83 blue: 0.83 alpha: 1];
        UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        UIColor* gradientColor = [UIColor colorWithRed: 0.988 green: 0.765 blue: 0.592 alpha: 1];
        UIColor* gradientColor2 = [UIColor colorWithRed: 0.988 green: 0.624 blue: 0.584 alpha: 1];
        UIColor* gradientColor3 = [UIColor colorWithRed: 0.969 green: 0.486 blue: 0.533 alpha: 1];
        UIColor* gradientColor4 = [UIColor colorWithRed: 0.949 green: 0.318 blue: 0.573 alpha: 1];
        UIColor* gradientColor5 = [UIColor colorWithRed: 0.827 green: 0.298 blue: 0.639 alpha: 1];
        UIColor* gradientColor6 = [UIColor colorWithRed: 0.604 green: 0.314 blue: 0.647 alpha: 1];
        UIColor* gradientColor7 = [UIColor colorWithRed: 0.349 green: 0.337 blue: 0.62 alpha: 1];
        UIColor* gradientColor8 = [UIColor colorWithRed: 0.224 green: 0.278 blue: 0.498 alpha: 1];

        //// Gradient Declarations
        CGFloat linearGradient1Locations[] = {0, 0.16, 0.3, 0.43, 0.56, 0.69, 0.84, 1};
        CGGradientRef linearGradient1 = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor, (id)gradientColor4.CGColor, (id)gradientColor5.CGColor, (id)gradientColor6.CGColor, (id)gradientColor7.CGColor, (id)gradientColor8.CGColor], linearGradient1Locations);

        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.25, 0.25, 31.5, 31.5) cornerRadius: 7];
        [color2 setFill];
        [backgroundPath fill];
        [color setStroke];
        backgroundPath.lineWidth = 0.5;
        backgroundPath.lineCapStyle = kCGLineCapRound;
        backgroundPath.lineJoinStyle = kCGLineJoinRound;
        [backgroundPath stroke];


        //// ramChip Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 4.29, 19.79);
        CGContextRotateCTM(context, -45 * M_PI/180);

        UIBezierPath* ramChipPath = [UIBezierPath bezierPath];
        [ramChipPath moveToPoint: CGPointMake(6.6, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(8.8, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(8.8, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(6.6, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(6.6, 5.53)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(13.2, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(15.4, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(15.4, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(13.2, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(13.2, 5.53)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(16.5, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(18.7, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(18.7, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(16.5, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(16.5, 5.53)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(3.3, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(5.5, 5.53)];
        [ramChipPath addLineToPoint: CGPointMake(5.5, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(3.3, 2.76)];
        [ramChipPath addLineToPoint: CGPointMake(3.3, 5.53)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(20.17, 0)];
        [ramChipPath addLineToPoint: CGPointMake(1.83, 0)];
        [ramChipPath addCurveToPoint: CGPointMake(0, 1.66) controlPoint1: CGPointMake(0.82, 0) controlPoint2: CGPointMake(0, 0.74)];
        [ramChipPath addLineToPoint: CGPointMake(0, 6.63)];
        [ramChipPath addCurveToPoint: CGPointMake(1.83, 8.29) controlPoint1: CGPointMake(0, 7.55) controlPoint2: CGPointMake(0.82, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(1.83, 9.95)];
        [ramChipPath addCurveToPoint: CGPointMake(2.44, 10.5) controlPoint1: CGPointMake(1.83, 10.25) controlPoint2: CGPointMake(2.11, 10.5)];
        [ramChipPath addLineToPoint: CGPointMake(19.56, 10.5)];
        [ramChipPath addCurveToPoint: CGPointMake(20.17, 9.95) controlPoint1: CGPointMake(19.89, 10.5) controlPoint2: CGPointMake(20.17, 10.25)];
        [ramChipPath addLineToPoint: CGPointMake(20.17, 8.29)];
        [ramChipPath addCurveToPoint: CGPointMake(22, 6.63) controlPoint1: CGPointMake(21.18, 8.29) controlPoint2: CGPointMake(22, 7.55)];
        [ramChipPath addLineToPoint: CGPointMake(22, 1.66)];
        [ramChipPath addCurveToPoint: CGPointMake(20.17, 0) controlPoint1: CGPointMake(22, 0.74) controlPoint2: CGPointMake(21.18, 0)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(4.28, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(3.06, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(3.06, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(4.28, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(4.28, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(6.72, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(5.5, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(5.5, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(6.72, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(6.72, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(9.17, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(7.94, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(7.94, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(9.17, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(9.17, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(9.78, 6.63)];
        [ramChipPath addLineToPoint: CGPointMake(2.2, 6.63)];
        [ramChipPath addLineToPoint: CGPointMake(2.2, 1.66)];
        [ramChipPath addLineToPoint: CGPointMake(9.78, 1.66)];
        [ramChipPath addLineToPoint: CGPointMake(9.78, 6.63)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(11.61, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(10.39, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(10.39, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(11.61, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(11.61, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(14.06, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(12.83, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(12.83, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(14.06, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(14.06, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(16.5, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(15.28, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(15.28, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(16.5, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(16.5, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(18.94, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(17.72, 9.39)];
        [ramChipPath addLineToPoint: CGPointMake(17.72, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(18.94, 8.29)];
        [ramChipPath addLineToPoint: CGPointMake(18.94, 9.39)];
        [ramChipPath closePath];
        [ramChipPath moveToPoint: CGPointMake(19.8, 6.63)];
        [ramChipPath addLineToPoint: CGPointMake(12.22, 6.63)];
        [ramChipPath addLineToPoint: CGPointMake(12.22, 1.66)];
        [ramChipPath addLineToPoint: CGPointMake(19.8, 1.66)];
        [ramChipPath addLineToPoint: CGPointMake(19.8, 6.63)];
        [ramChipPath closePath];
        CGContextSaveGState(context);
        [ramChipPath addClip];
        CGContextDrawLinearGradient(context, linearGradient1,
                                    CGPointMake(21.84, -0.52),
                                    CGPointMake(-0.33, 10.65),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        //// Cleanup
        CGGradientRelease(linearGradient1);

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

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

+ (UIImage *)RLMBrowser_headerDisclosureArrowIcon
{
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions((CGSize){8, 13}, NO, 0.0f);
    {
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.309 green: 0.309 blue: 0.309 alpha: 1];

        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(1, 12.5)];
        [bezierPath addLineToPoint: CGPointMake(7, 6.5)];
        [bezierPath addLineToPoint: CGPointMake(1, 0.5)];
        [color setStroke];
        bezierPath.lineWidth = 1.5;
        [bezierPath stroke];

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)RLMBrowser_checkmarkIcon
{
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions((CGSize){13, 10}, NO, 0.0f);
    {
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(1, 4.5)];
        [bezierPath addLineToPoint: CGPointMake(4.83, 8.5)];
        [bezierPath addLineToPoint: CGPointMake(12, 1)];
        [UIColor.blackColor setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)RLMBrowser_favoriteIconFilled:(BOOL)filled
{
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions((CGSize){27,22}, NO, 0.0f);
    {

        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(13.52, 21.5)];
        [bezier2Path addCurveToPoint: CGPointMake(0.5, 7.24) controlPoint1: CGPointMake(11.39, 20.27) controlPoint2: CGPointMake(0.5, 13.67)];
        [bezier2Path addCurveToPoint: CGPointMake(7.4, 0.5) controlPoint1: CGPointMake(0.5, 3.52) controlPoint2: CGPointMake(3.6, 0.5)];
        [bezier2Path addCurveToPoint: CGPointMake(12.89, 3.16) controlPoint1: CGPointMake(9.57, 0.5) controlPoint2: CGPointMake(11.57, 1.47)];
        [bezier2Path addLineToPoint: CGPointMake(13.5, 3.94)];
        [bezier2Path addLineToPoint: CGPointMake(14.11, 3.16)];
        [bezier2Path addCurveToPoint: CGPointMake(19.6, 0.5) controlPoint1: CGPointMake(15.43, 1.47) controlPoint2: CGPointMake(17.43, 0.5)];
        [bezier2Path addCurveToPoint: CGPointMake(26.5, 7.24) controlPoint1: CGPointMake(23.4, 0.5) controlPoint2: CGPointMake(26.5, 3.52)];
        [bezier2Path addCurveToPoint: CGPointMake(13.52, 21.5) controlPoint1: CGPointMake(26.5, 14.24) controlPoint2: CGPointMake(15.65, 20.36)];
        [bezier2Path closePath];
        if (filled) {
        [UIColor.blackColor setFill];
        [bezier2Path fill];
        }
        [UIColor.blackColor setStroke];
        bezier2Path.lineWidth = 1;
        bezier2Path.miterLimit = 4;
        [bezier2Path stroke];


        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
