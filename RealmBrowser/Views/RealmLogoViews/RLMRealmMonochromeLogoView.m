//
//  RLMRealmMonochromeLogoView.m
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

#import "RLMRealmMonochromeLogoView.h"

@interface RLMRealmMonochromeLogoView ()
- (void)drawRealmLogoMonochromeWithFrame:(CGRect)frame strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor;
@end

@implementation RLMRealmMonochromeLogoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _strokeColor = [UIColor whiteColor];
        _strokeWidth = 4.0f;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawRealmLogoMonochromeWithFrame:self.bounds strokeWidth:self.strokeWidth strokeColor:self.strokeColor];
}

- (UIImage *)image
{
    return [self imageInRect:self.bounds];
}

- (UIImage *)imageInRect:(CGRect)rect
{
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0f);
    [self drawRealmLogoMonochromeWithFrame:rect strokeWidth:self.strokeWidth strokeColor:self.strokeColor];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)drawRealmLogoMonochromeWithFrame:(CGRect)frame strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor
{
    //// Subframes
    CGRect group2 = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), frame.size.width, frame.size.height);


    //// Group 2
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    {
        //// Circle Drawing
        UIBezierPath* circlePath = [UIBezierPath bezierPath];
        [circlePath moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.50000 * group2.size.width, CGRectGetMinY(group2) + 0.00000 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.14650 * group2.size.width, CGRectGetMinY(group2) + 0.14650 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.36917 * group2.size.width, CGRectGetMinY(group2) + 0.00000 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.23900 * group2.size.width, CGRectGetMinY(group2) + 0.05383 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.00000 * group2.size.width, CGRectGetMinY(group2) + 0.50000 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.05400 * group2.size.width, CGRectGetMinY(group2) + 0.23917 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.00000 * group2.size.width, CGRectGetMinY(group2) + 0.36917 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.14650 * group2.size.width, CGRectGetMinY(group2) + 0.85350 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.00000 * group2.size.width, CGRectGetMinY(group2) + 0.63083 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.05383 * group2.size.width, CGRectGetMinY(group2) + 0.76100 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.50000 * group2.size.width, CGRectGetMinY(group2) + 1.00000 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.23917 * group2.size.width, CGRectGetMinY(group2) + 0.94600 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.36917 * group2.size.width, CGRectGetMinY(group2) + 1.00000 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.85350 * group2.size.width, CGRectGetMinY(group2) + 0.85350 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.63083 * group2.size.width, CGRectGetMinY(group2) + 1.00000 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.76100 * group2.size.width, CGRectGetMinY(group2) + 0.94617 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 1.00000 * group2.size.width, CGRectGetMinY(group2) + 0.50000 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.94617 * group2.size.width, CGRectGetMinY(group2) + 0.76100 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 1.00000 * group2.size.width, CGRectGetMinY(group2) + 0.63083 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.85350 * group2.size.width, CGRectGetMinY(group2) + 0.14650 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 1.00000 * group2.size.width, CGRectGetMinY(group2) + 0.36917 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.94617 * group2.size.width, CGRectGetMinY(group2) + 0.23900 * group2.size.height)];
        [circlePath addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.50000 * group2.size.width, CGRectGetMinY(group2) + 0.00000 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.76100 * group2.size.width, CGRectGetMinY(group2) + 0.05383 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.63083 * group2.size.width, CGRectGetMinY(group2) + 0.00000 * group2.size.height)];
        [circlePath addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 0.50000 * group2.size.width, CGRectGetMinY(group2) + 0.00000 * group2.size.height)];
        [circlePath closePath];

        CGContextAddPath(context, circlePath.CGPath);
        CGContextClip(context);

        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.71417 * group2.size.width, CGRectGetMinY(group2) + 0.04883 * group2.size.height)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.58883 * group2.size.width, CGRectGetMinY(group2) + 0.05817 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.67217 * group2.size.width, CGRectGetMinY(group2) + 0.04533 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.62983 * group2.size.width, CGRectGetMinY(group2) + 0.04833 * group2.size.height)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.32350 * group2.size.width, CGRectGetMinY(group2) + 0.14983 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.49767 * group2.size.width, CGRectGetMinY(group2) + 0.07983 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.41567 * group2.size.width, CGRectGetMinY(group2) + 0.13300 * group2.size.height)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.15417 * group2.size.width, CGRectGetMinY(group2) + 0.13900 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.26733 * group2.size.width, CGRectGetMinY(group2) + 0.16017 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.20867 * group2.size.width, CGRectGetMinY(group2) + 0.15617 * group2.size.height)];
        [strokeColor setStroke];
        bezier2Path.lineWidth = strokeWidth;
        [bezier2Path stroke];


        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.89100 * group2.size.width, CGRectGetMinY(group2) + 0.18850 * group2.size.height)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.64900 * group2.size.width, CGRectGetMinY(group2) + 0.26183 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.81867 * group2.size.width, CGRectGetMinY(group2) + 0.23367 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.73433 * group2.size.width, CGRectGetMinY(group2) + 0.25967 * group2.size.height)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.30867 * group2.size.width, CGRectGetMinY(group2) + 0.22550 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.53483 * group2.size.width, CGRectGetMinY(group2) + 0.26467 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.42283 * group2.size.width, CGRectGetMinY(group2) + 0.22667 * group2.size.height)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.04550 * group2.size.width, CGRectGetMinY(group2) + 0.29283 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.21700 * group2.size.width, CGRectGetMinY(group2) + 0.22450 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.12567 * group2.size.width, CGRectGetMinY(group2) + 0.24867 * group2.size.height)];
        [strokeColor setStroke];
        bezier3Path.lineWidth = strokeWidth;
        [bezier3Path stroke];


        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.09912 * group2.size.width, CGRectGetMinY(group2) + 0.43820 * group2.size.height)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.01067 * group2.size.width, CGRectGetMinY(group2) + 0.39833 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.06808 * group2.size.width, CGRectGetMinY(group2) + 0.42882 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.03824 * group2.size.width, CGRectGetMinY(group2) + 0.41539 * group2.size.height)];
        [strokeColor setStroke];
        bezier4Path.lineWidth = strokeWidth;
        [bezier4Path stroke];


        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.99317 * group2.size.width, CGRectGetMinY(group2) + 0.41950 * group2.size.height)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.87550 * group2.size.width, CGRectGetMinY(group2) + 0.35150 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.95750 * group2.size.width, CGRectGetMinY(group2) + 0.39133 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.91783 * group2.size.width, CGRectGetMinY(group2) + 0.36817 * group2.size.height)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.60067 * group2.size.width, CGRectGetMinY(group2) + 0.33100 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.78867 * group2.size.width, CGRectGetMinY(group2) + 0.31733 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.69150 * group2.size.width, CGRectGetMinY(group2) + 0.31000 * group2.size.height)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.42217 * group2.size.width, CGRectGetMinY(group2) + 0.39683 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.53883 * group2.size.width, CGRectGetMinY(group2) + 0.34533 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.48067 * group2.size.width, CGRectGetMinY(group2) + 0.37200 * group2.size.height)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.35147 * group2.size.width, CGRectGetMinY(group2) + 0.42484 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.39887 * group2.size.width, CGRectGetMinY(group2) + 0.40672 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.37534 * group2.size.width, CGRectGetMinY(group2) + 0.41637 * group2.size.height)];
        [strokeColor setStroke];
        bezier5Path.lineWidth = strokeWidth;
        [bezier5Path stroke];


        //// Bezier 6 Drawing
        UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
        [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.64251 * group2.size.width, CGRectGetMinY(group2) + 0.53720 * group2.size.height)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.48483 * group2.size.width, CGRectGetMinY(group2) + 0.47317 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.58867 * group2.size.width, CGRectGetMinY(group2) + 0.51975 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.53691 * group2.size.width, CGRectGetMinY(group2) + 0.49560 * group2.size.height)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.28233 * group2.size.width, CGRectGetMinY(group2) + 0.41217 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.41983 * group2.size.width, CGRectGetMinY(group2) + 0.44517 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.35267 * group2.size.width, CGRectGetMinY(group2) + 0.41917 * group2.size.height)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.07383 * group2.size.width, CGRectGetMinY(group2) + 0.44933 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.21117 * group2.size.width, CGRectGetMinY(group2) + 0.40517 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.13817 * group2.size.width, CGRectGetMinY(group2) + 0.41817 * group2.size.height)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.00000 * group2.size.width, CGRectGetMinY(group2) + 0.49617 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.04750 * group2.size.width, CGRectGetMinY(group2) + 0.46200 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.02283 * group2.size.width, CGRectGetMinY(group2) + 0.47783 * group2.size.height)];
        [strokeColor setStroke];
        bezier6Path.lineWidth = strokeWidth;
        [bezier6Path stroke];


        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.99983 * group2.size.width, CGRectGetMinY(group2) + 0.50933 * group2.size.height)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.73683 * group2.size.width, CGRectGetMinY(group2) + 0.50000 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.91583 * group2.size.width, CGRectGetMinY(group2) + 0.47950 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.82250 * group2.size.width, CGRectGetMinY(group2) + 0.47550 * group2.size.height)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.42870 * group2.size.width, CGRectGetMinY(group2) + 0.64865 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.62694 * group2.size.width, CGRectGetMinY(group2) + 0.53128 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.53404 * group2.size.width, CGRectGetMinY(group2) + 0.60456 * group2.size.height)];
        [strokeColor setStroke];
        bezier7Path.lineWidth = strokeWidth;
        [bezier7Path stroke];


        //// Bezier 8 Drawing
        UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
        [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.98133 * group2.size.width, CGRectGetMinY(group2) + 0.63333 * group2.size.height)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.87117 * group2.size.width, CGRectGetMinY(group2) + 0.69000 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.94717 * group2.size.width, CGRectGetMinY(group2) + 0.65683 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.91017 * group2.size.width, CGRectGetMinY(group2) + 0.67583 * group2.size.height)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.60117 * group2.size.width, CGRectGetMinY(group2) + 0.70750 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.78517 * group2.size.width, CGRectGetMinY(group2) + 0.72100 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.69050 * group2.size.width, CGRectGetMinY(group2) + 0.72717 * group2.size.height)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.27783 * group2.size.width, CGRectGetMinY(group2) + 0.60533 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.49050 * group2.size.width, CGRectGetMinY(group2) + 0.68317 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.39000 * group2.size.width, CGRectGetMinY(group2) + 0.62067 * group2.size.height)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.02517 * group2.size.width, CGRectGetMinY(group2) + 0.65550 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.19117 * group2.size.width, CGRectGetMinY(group2) + 0.59350 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.10100 * group2.size.width, CGRectGetMinY(group2) + 0.61217 * group2.size.height)];
        [strokeColor setStroke];
        bezier8Path.lineWidth = strokeWidth;
        [bezier8Path stroke];


        //// Bezier 9 Drawing
        UIBezierPath* bezier9Path = [UIBezierPath bezierPath];
        [bezier9Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.93367 * group2.size.width, CGRectGetMinY(group2) + 0.74800 * group2.size.height)];
        [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.60633 * group2.size.width, CGRectGetMinY(group2) + 0.78683 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.82350 * group2.size.width, CGRectGetMinY(group2) + 0.73617 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.71050 * group2.size.width, CGRectGetMinY(group2) + 0.74933 * group2.size.height)];
        [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.44417 * group2.size.width, CGRectGetMinY(group2) + 0.84883 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.55183 * group2.size.width, CGRectGetMinY(group2) + 0.80650 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.49967 * group2.size.width, CGRectGetMinY(group2) + 0.83250 * group2.size.height)];
        [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.17650 * group2.size.width, CGRectGetMinY(group2) + 0.85100 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.35750 * group2.size.width, CGRectGetMinY(group2) + 0.87433 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.26367 * group2.size.width, CGRectGetMinY(group2) + 0.87500 * group2.size.height)];
        [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 0.12917 * group2.size.width, CGRectGetMinY(group2) + 0.83533 * group2.size.height) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 0.16050 * group2.size.width, CGRectGetMinY(group2) + 0.84650 * group2.size.height) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.14467 * group2.size.width, CGRectGetMinY(group2) + 0.84133 * group2.size.height)];
        [strokeColor setStroke];
        bezier9Path.lineWidth = strokeWidth;
        [bezier9Path stroke];

        CGContextAddPath(context, circlePath.CGPath);
        CGContextSetLineWidth(context, strokeWidth * 2.0f);
        CGContextStrokePath(context);

    }
    CGContextRestoreGState(context);
}

@end
