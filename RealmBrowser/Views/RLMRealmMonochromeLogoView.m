//
//  RLMRealmMonochromeLogoView.m
//  RealmBrowser
//
//  Created by Tim Oliver on 24/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

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

- (void)drawRealmLogoMonochromeWithFrame:(CGRect)frame strokeWidth:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor
{
    //// Subframes
    CGRect realmLogoMonochrome = CGRectMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + 5, frame.size.width - 10, frame.size.height - 10);
    
    //// RealmLogoMonochrome
    {
        //// Circle
        {
            //// Shape Drawing
            UIBezierPath* shapePath = [UIBezierPath bezierPath];
            [shapePath moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.50000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.14650 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.14650 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.36917 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.23900 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.05383 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.50000 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.05400 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.23917 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.36917 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.14650 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.85350 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.63083 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.05383 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.76100 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.50000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 1.00000 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.23917 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.94600 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.36917 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 1.00000 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.85350 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.85350 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.63083 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 1.00000 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.76100 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.94617 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 1.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.50000 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.94617 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.76100 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 1.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.63083 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.85350 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.14650 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 1.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.36917 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.94617 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.23900 * realmLogoMonochrome.size.height)];
            [shapePath addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.50000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.76100 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.05383 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.63083 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.height)];
            [shapePath addLineToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.50000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.height)];
            [shapePath closePath];
            [strokeColor setStroke];
            shapePath.lineWidth = strokeWidth;
            shapePath.miterLimit = 4;
            [shapePath stroke];
        }
        
        
        //// InnerLines
        {
            //// Shape 2 Drawing
            UIBezierPath* shape2Path = [UIBezierPath bezierPath];
            [shape2Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.71417 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.04884 * realmLogoMonochrome.size.height)];
            [shape2Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.58883 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.05821 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.67217 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.04532 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.62983 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.04834 * realmLogoMonochrome.size.height)];
            [shape2Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.32350 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.15025 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.49767 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.07996 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.41567 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.13335 * realmLogoMonochrome.size.height)];
            [shape2Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.15417 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.13937 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.26733 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.16062 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.20867 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.15661 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape2Path.lineWidth = strokeWidth;
            shape2Path.miterLimit = 4;
            [shape2Path stroke];
            
            
            //// Shape 3 Drawing
            UIBezierPath* shape3Path = [UIBezierPath bezierPath];
            [shape3Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.89100 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.18907 * realmLogoMonochrome.size.height)];
            [shape3Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.64900 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.26270 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.81867 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.23442 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.73433 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.26053 * realmLogoMonochrome.size.height)];
            [shape3Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.30867 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.22622 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.53483 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.26555 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.42283 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.22739 * realmLogoMonochrome.size.height)];
            [shape3Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.04550 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.29383 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.21700 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.22522 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.12567 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.24948 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape3Path.lineWidth = strokeWidth;
            shape3Path.miterLimit = 4;
            [shape3Path stroke];
            
            
            //// Shape 4 Drawing
            UIBezierPath* shape4Path = [UIBezierPath bezierPath];
            [shape4Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.09912 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.43978 * realmLogoMonochrome.size.height)];
            [shape4Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.01067 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.39976 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.06808 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.43037 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.03824 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.41689 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape4Path.lineWidth = strokeWidth;
            shape4Path.miterLimit = 4;
            [shape4Path stroke];
            
            
            //// Shape 5 Drawing
            UIBezierPath* shape5Path = [UIBezierPath bezierPath];
            [shape5Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.99317 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.42101 * realmLogoMonochrome.size.height)];
            [shape5Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.87550 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.35273 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.95750 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.39273 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.91783 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.36947 * realmLogoMonochrome.size.height)];
            [shape5Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.60067 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.33215 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.78867 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.31843 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.69150 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.31107 * realmLogoMonochrome.size.height)];
            [shape5Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.42217 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.39825 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.53883 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.34654 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.48067 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.37332 * realmLogoMonochrome.size.height)];
            [shape5Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.35147 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.42637 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.39887 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.40818 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.37534 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.41787 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape5Path.lineWidth = strokeWidth;
            shape5Path.miterLimit = 4;
            [shape5Path stroke];
            
            
            //// Shape 6 Drawing
            UIBezierPath* shape6Path = [UIBezierPath bezierPath];
            [shape6Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.64251 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.53919 * realmLogoMonochrome.size.height)];
            [shape6Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.48483 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.47490 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.58867 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.52166 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.53691 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.49742 * realmLogoMonochrome.size.height)];
            [shape6Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.28233 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.41365 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.41983 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.44678 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.35267 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.42068 * realmLogoMonochrome.size.height)];
            [shape6Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.07383 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.45096 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.21117 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.40662 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.13817 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.41967 * realmLogoMonochrome.size.height)];
            [shape6Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.00000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.49799 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.04750 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.46368 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.02283 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.47958 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape6Path.lineWidth = strokeWidth;
            shape6Path.miterLimit = 4;
            [shape6Path stroke];
            
            
            //// Shape 7 Drawing
            UIBezierPath* shape7Path = [UIBezierPath bezierPath];
            [shape7Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.99983 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.51121 * realmLogoMonochrome.size.height)];
            [shape7Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.73683 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.50184 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.91583 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.48125 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.82250 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.47724 * realmLogoMonochrome.size.height)];
            [shape7Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.42870 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.65109 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.62695 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.53325 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.53404 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.60683 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape7Path.lineWidth = strokeWidth;
            shape7Path.miterLimit = 4;
            [shape7Path stroke];
            
            
            //// Shape 8 Drawing
            UIBezierPath* shape8Path = [UIBezierPath bezierPath];
            [shape8Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.98133 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.63571 * realmLogoMonochrome.size.height)];
            [shape8Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.87117 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.69261 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.94717 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.65931 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.91017 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.67838 * realmLogoMonochrome.size.height)];
            [shape8Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.60117 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.71018 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.78517 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.72373 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.69050 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.72993 * realmLogoMonochrome.size.height)];
            [shape8Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.27783 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.60760 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.49050 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.68575 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.39000 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.62299 * realmLogoMonochrome.size.height)];
            [shape8Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.02517 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.65797 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.19117 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.59572 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.10100 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.61446 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape8Path.lineWidth = strokeWidth;
            shape8Path.miterLimit = 4;
            [shape8Path stroke];
            
            
            //// Shape 9 Drawing
            UIBezierPath* shape9Path = [UIBezierPath bezierPath];
            [shape9Path moveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.93367 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.75084 * realmLogoMonochrome.size.height)];
            [shape9Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.60633 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.78984 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.82350 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.73896 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.71050 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.75218 * realmLogoMonochrome.size.height)];
            [shape9Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.44417 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.85209 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.55183 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.80958 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.49967 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.83569 * realmLogoMonochrome.size.height)];
            [shape9Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.17650 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.85426 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.35750 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.87769 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.26367 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.87836 * realmLogoMonochrome.size.height)];
            [shape9Path addCurveToPoint: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.12917 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.83853 * realmLogoMonochrome.size.height) controlPoint1: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.16050 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.84974 * realmLogoMonochrome.size.height) controlPoint2: CGPointMake(CGRectGetMinX(realmLogoMonochrome) + 0.14467 * realmLogoMonochrome.size.width, CGRectGetMinY(realmLogoMonochrome) + 0.84456 * realmLogoMonochrome.size.height)];
            [strokeColor setStroke];
            shape9Path.lineWidth = strokeWidth;
            shape9Path.miterLimit = 4;
            [shape9Path stroke];
        }
    }
}

@end
