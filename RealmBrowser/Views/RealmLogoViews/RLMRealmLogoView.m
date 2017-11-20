//
//  RLMRealmLogoView.m
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

#import "RLMRealmLogoView.h"

@interface RLMRealmLogoView()
- (void)drawRealmLogoWithFrame:(CGRect)frame;
@end

@implementation RLMRealmLogoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawRealmLogoWithFrame:self.bounds];
}

- (void)drawRealmLogoWithFrame: (CGRect)frame
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.979 green: 0.714 blue: 0.523 alpha: 1];
    UIColor* fillColor2 = [UIColor colorWithRed: 0.976 green: 0.545 blue: 0.514 alpha: 1];
    UIColor* fillColor3 = [UIColor colorWithRed: 0.95 green: 0.392 blue: 0.46 alpha: 1];
    UIColor* fillColor4 = [UIColor colorWithRed: 0.924 green: 0.208 blue: 0.501 alpha: 1];
    UIColor* fillColor5 = [UIColor colorWithRed: 0.778 green: 0.191 blue: 0.572 alpha: 1];
    UIColor* fillColor6 = [UIColor colorWithRed: 0.528 green: 0.219 blue: 0.581 alpha: 1];
    UIColor* fillColor7 = [UIColor colorWithRed: 0.277 green: 0.253 blue: 0.55 alpha: 1];
    UIColor* fillColor8 = [UIColor colorWithRed: 0.17 green: 0.206 blue: 0.422 alpha: 1];
    
    
    //// Subframes
    CGRect orby = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), frame.size.width, frame.size.height);
    
    
    //// Orby
    {
        //// Melon Drawing
        UIBezierPath* melonPath = [UIBezierPath bezierPath];
        [melonPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.71438 * orby.size.width, CGRectGetMinY(orby) + 0.04816 * orby.size.height)];
        [melonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.50000 * orby.size.width, CGRectGetMinY(orby) + 0.00000 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.64941 * orby.size.width, CGRectGetMinY(orby) + 0.01728 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.57672 * orby.size.width, CGRectGetMinY(orby) + 0.00000 * orby.size.height)];
        [melonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.15485 * orby.size.width, CGRectGetMinY(orby) + 0.13823 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.36616 * orby.size.width, CGRectGetMinY(orby) + 0.00000 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.24459 * orby.size.width, CGRectGetMinY(orby) + 0.05259 * orby.size.height)];
        [melonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.71438 * orby.size.width, CGRectGetMinY(orby) + 0.04816 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.05944 * orby.size.width, CGRectGetMinY(orby) + 0.22929 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.88326 * orby.size.width, CGRectGetMinY(orby) + 0.12843 * orby.size.height)];
        [melonPath closePath];
        melonPath.usesEvenOddFillRule = YES;
        [fillColor setFill];
        [melonPath fill];
        
        
        //// Peach Drawing
        UIBezierPath* peachPath = [UIBezierPath bezierPath];
        [peachPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.89062 * orby.size.width, CGRectGetMinY(orby) + 0.18785 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.72555 * orby.size.width, CGRectGetMinY(orby) + 0.25952 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.89119 * orby.size.width, CGRectGetMinY(orby) + 0.18856 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.84984 * orby.size.width, CGRectGetMinY(orby) + 0.24383 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.04467 * orby.size.width, CGRectGetMinY(orby) + 0.29312 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.47470 * orby.size.width, CGRectGetMinY(orby) + 0.29119 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.04403 * orby.size.width, CGRectGetMinY(orby) + 0.29454 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.15485 * orby.size.width, CGRectGetMinY(orby) + 0.13823 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.07132 * orby.size.width, CGRectGetMinY(orby) + 0.23457 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.10892 * orby.size.width, CGRectGetMinY(orby) + 0.18207 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.32362 * orby.size.width, CGRectGetMinY(orby) + 0.14907 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.20898 * orby.size.width, CGRectGetMinY(orby) + 0.15513 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.26789 * orby.size.width, CGRectGetMinY(orby) + 0.15934 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.58851 * orby.size.width, CGRectGetMinY(orby) + 0.05741 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.41563 * orby.size.width, CGRectGetMinY(orby) + 0.13224 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.49750 * orby.size.width, CGRectGetMinY(orby) + 0.07907 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.71438 * orby.size.width, CGRectGetMinY(orby) + 0.04816 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.62891 * orby.size.width, CGRectGetMinY(orby) + 0.04770 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.67292 * orby.size.width, CGRectGetMinY(orby) + 0.04487 * orby.size.height)];
        [peachPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.89062 * orby.size.width, CGRectGetMinY(orby) + 0.18785 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.78326 * orby.size.width, CGRectGetMinY(orby) + 0.08090 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.84347 * orby.size.width, CGRectGetMinY(orby) + 0.12892 * orby.size.height)];
        [peachPath closePath];
        peachPath.usesEvenOddFillRule = YES;
        [fillColor2 setFill];
        [peachPath fill];
        
        
        //// Sexy-Salmon Drawing
        UIBezierPath* sexySalmonPath = [UIBezierPath bezierPath];
        [sexySalmonPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.99390 * orby.size.width, CGRectGetMinY(orby) + 0.42168 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.15246 * orby.size.width, CGRectGetMinY(orby) + 0.46139 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.99422 * orby.size.width, CGRectGetMinY(orby) + 0.42369 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.42823 * orby.size.width, CGRectGetMinY(orby) + 0.47689 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.01020 * orby.size.width, CGRectGetMinY(orby) + 0.39905 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.06261 * orby.size.width, CGRectGetMinY(orby) + 0.45633 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.00959 * orby.size.width, CGRectGetMinY(orby) + 0.40201 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.04468 * orby.size.width, CGRectGetMinY(orby) + 0.29311 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.01777 * orby.size.width, CGRectGetMinY(orby) + 0.36208 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.02943 * orby.size.width, CGRectGetMinY(orby) + 0.32661 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.30896 * orby.size.width, CGRectGetMinY(orby) + 0.22533 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.12435 * orby.size.width, CGRectGetMinY(orby) + 0.24951 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.21808 * orby.size.width, CGRectGetMinY(orby) + 0.22434 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.64873 * orby.size.width, CGRectGetMinY(orby) + 0.26167 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.42294 * orby.size.width, CGRectGetMinY(orby) + 0.22650 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.53475 * orby.size.width, CGRectGetMinY(orby) + 0.26450 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.89062 * orby.size.width, CGRectGetMinY(orby) + 0.18785 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.73338 * orby.size.width, CGRectGetMinY(orby) + 0.25951 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.81869 * orby.size.width, CGRectGetMinY(orby) + 0.23250 * orby.size.height)];
        [sexySalmonPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.99390 * orby.size.width, CGRectGetMinY(orby) + 0.42168 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.94362 * orby.size.width, CGRectGetMinY(orby) + 0.25409 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.98013 * orby.size.width, CGRectGetMinY(orby) + 0.33411 * orby.size.height)];
        [sexySalmonPath closePath];
        sexySalmonPath.usesEvenOddFillRule = YES;
        [fillColor3 setFill];
        [sexySalmonPath fill];
        
        
        //// Flamingo Drawing
        UIBezierPath* flamingoPath = [UIBezierPath bezierPath];
        [flamingoPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 1.00000 * orby.size.width, CGRectGetMinY(orby) + 0.50000 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.99993 * orby.size.width, CGRectGetMinY(orby) + 0.50830 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 1.00000 * orby.size.width, CGRectGetMinY(orby) + 0.50277 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.99993 * orby.size.width, CGRectGetMinY(orby) + 0.50830 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.64027 * orby.size.width, CGRectGetMinY(orby) + 0.54558 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.99993 * orby.size.width, CGRectGetMinY(orby) + 0.50830 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.84273 * orby.size.width, CGRectGetMinY(orby) + 0.54795 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.00002 * orby.size.width, CGRectGetMinY(orby) + 0.49569 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.35669 * orby.size.width, CGRectGetMinY(orby) + 0.54227 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.00001 * orby.size.width, CGRectGetMinY(orby) + 0.49653 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.01025 * orby.size.width, CGRectGetMinY(orby) + 0.39877 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.00030 * orby.size.width, CGRectGetMinY(orby) + 0.46251 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.00381 * orby.size.width, CGRectGetMinY(orby) + 0.43011 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.23989 * orby.size.width, CGRectGetMinY(orby) + 0.45258 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.07819 * orby.size.width, CGRectGetMinY(orby) + 0.44069 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.16059 * orby.size.width, CGRectGetMinY(orby) + 0.46123 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.42126 * orby.size.width, CGRectGetMinY(orby) + 0.39758 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.30295 * orby.size.width, CGRectGetMinY(orby) + 0.44575 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.36285 * orby.size.width, CGRectGetMinY(orby) + 0.42242 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.59946 * orby.size.width, CGRectGetMinY(orby) + 0.33175 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.47966 * orby.size.width, CGRectGetMinY(orby) + 0.37275 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.53773 * orby.size.width, CGRectGetMinY(orby) + 0.34608 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.87383 * orby.size.width, CGRectGetMinY(orby) + 0.35225 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.69014 * orby.size.width, CGRectGetMinY(orby) + 0.31075 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.78715 * orby.size.width, CGRectGetMinY(orby) + 0.31808 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.99389 * orby.size.width, CGRectGetMinY(orby) + 0.42162 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.91601 * orby.size.width, CGRectGetMinY(orby) + 0.36888 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.95785 * orby.size.width, CGRectGetMinY(orby) + 0.39279 * orby.size.height)];
        [flamingoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 1.00000 * orby.size.width, CGRectGetMinY(orby) + 0.50000 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.99791 * orby.size.width, CGRectGetMinY(orby) + 0.44716 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 1.00000 * orby.size.width, CGRectGetMinY(orby) + 0.47334 * orby.size.height)];
        [flamingoPath closePath];
        flamingoPath.usesEvenOddFillRule = YES;
        [fillColor4 setFill];
        [flamingoPath fill];
        
        
        //// Mulberry Drawing
        UIBezierPath* mulberryPath = [UIBezierPath bezierPath];
        [mulberryPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.43295 * orby.size.width, CGRectGetMinY(orby) + 0.66235 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.02486 * orby.size.width, CGRectGetMinY(orby) + 0.65612 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.28294 * orby.size.width, CGRectGetMinY(orby) + 0.69005 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.02550 * orby.size.width, CGRectGetMinY(orby) + 0.65810 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.00000 * orby.size.width, CGRectGetMinY(orby) + 0.50000 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.00873 * orby.size.width, CGRectGetMinY(orby) + 0.60700 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.00000 * orby.size.width, CGRectGetMinY(orby) + 0.55452 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.00002 * orby.size.width, CGRectGetMinY(orby) + 0.49569 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.00000 * orby.size.width, CGRectGetMinY(orby) + 0.49856 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.00001 * orby.size.width, CGRectGetMinY(orby) + 0.49712 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.07536 * orby.size.width, CGRectGetMinY(orby) + 0.44901 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.02279 * orby.size.width, CGRectGetMinY(orby) + 0.47763 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.04939 * orby.size.width, CGRectGetMinY(orby) + 0.46153 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.28351 * orby.size.width, CGRectGetMinY(orby) + 0.41185 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.13959 * orby.size.width, CGRectGetMinY(orby) + 0.41785 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.21246 * orby.size.width, CGRectGetMinY(orby) + 0.40485 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.48568 * orby.size.width, CGRectGetMinY(orby) + 0.47285 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.35373 * orby.size.width, CGRectGetMinY(orby) + 0.41885 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.42078 * orby.size.width, CGRectGetMinY(orby) + 0.44485 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.65141 * orby.size.width, CGRectGetMinY(orby) + 0.53953 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.54035 * orby.size.width, CGRectGetMinY(orby) + 0.49644 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.59466 * orby.size.width, CGRectGetMinY(orby) + 0.52192 * orby.size.height)];
        [mulberryPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.43295 * orby.size.width, CGRectGetMinY(orby) + 0.66235 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.65697 * orby.size.width, CGRectGetMinY(orby) + 0.54125 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.59808 * orby.size.width, CGRectGetMinY(orby) + 0.63185 * orby.size.height)];
        [mulberryPath closePath];
        mulberryPath.usesEvenOddFillRule = YES;
        [fillColor5 setFill];
        [mulberryPath fill];
        
        
        //// Grape-Jelly Drawing
        UIBezierPath* grapeJellyPath = [UIBezierPath bezierPath];
        [grapeJellyPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.98196 * orby.size.width, CGRectGetMinY(orby) + 0.63356 * orby.size.height)];
        [grapeJellyPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.73682 * orby.size.width, CGRectGetMinY(orby) + 0.72106 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.97149 * orby.size.width, CGRectGetMinY(orby) + 0.65125 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.87186 * orby.size.width, CGRectGetMinY(orby) + 0.71085 * orby.size.height)];
        [grapeJellyPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.41685 * orby.size.width, CGRectGetMinY(orby) + 0.65301 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.55801 * orby.size.width, CGRectGetMinY(orby) + 0.73457 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.34678 * orby.size.width, CGRectGetMinY(orby) + 0.68052 * orby.size.height)];
        [grapeJellyPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.73682 * orby.size.width, CGRectGetMinY(orby) + 0.49935 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.52717 * orby.size.width, CGRectGetMinY(orby) + 0.60968 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.62284 * orby.size.width, CGRectGetMinY(orby) + 0.53185 * orby.size.height)];
        [grapeJellyPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.99993 * orby.size.width, CGRectGetMinY(orby) + 0.50829 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.82196 * orby.size.width, CGRectGetMinY(orby) + 0.47496 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.91635 * orby.size.width, CGRectGetMinY(orby) + 0.47881 * orby.size.height)];
        [grapeJellyPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.98196 * orby.size.width, CGRectGetMinY(orby) + 0.63356 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.99923 * orby.size.width, CGRectGetMinY(orby) + 0.55161 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.99302 * orby.size.width, CGRectGetMinY(orby) + 0.59359 * orby.size.height)];
        [grapeJellyPath closePath];
        grapeJellyPath.usesEvenOddFillRule = YES;
        [fillColor6 setFill];
        [grapeJellyPath fill];
        
        
        //// Indigo Drawing
        UIBezierPath* indigoPath = [UIBezierPath bezierPath];
        [indigoPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.93357 * orby.size.width, CGRectGetMinY(orby) + 0.74920 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.12958 * orby.size.width, CGRectGetMinY(orby) + 0.83585 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.84724 * orby.size.width, CGRectGetMinY(orby) + 0.89909 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.22106 * orby.size.width, CGRectGetMinY(orby) + 0.93668 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.02486 * orby.size.width, CGRectGetMinY(orby) + 0.65612 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.08302 * orby.size.width, CGRectGetMinY(orby) + 0.78452 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.04697 * orby.size.width, CGRectGetMinY(orby) + 0.72348 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.27829 * orby.size.width, CGRectGetMinY(orby) + 0.60533 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.10175 * orby.size.width, CGRectGetMinY(orby) + 0.61217 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.19177 * orby.size.width, CGRectGetMinY(orby) + 0.59350 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.60109 * orby.size.width, CGRectGetMinY(orby) + 0.70750 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.39027 * orby.size.width, CGRectGetMinY(orby) + 0.62067 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.49060 * orby.size.width, CGRectGetMinY(orby) + 0.68317 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.87064 * orby.size.width, CGRectGetMinY(orby) + 0.69000 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.69027 * orby.size.width, CGRectGetMinY(orby) + 0.72717 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.78478 * orby.size.width, CGRectGetMinY(orby) + 0.72100 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.98196 * orby.size.width, CGRectGetMinY(orby) + 0.63356 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.90945 * orby.size.width, CGRectGetMinY(orby) + 0.67588 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.94793 * orby.size.width, CGRectGetMinY(orby) + 0.65695 * orby.size.height)];
        [indigoPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.93357 * orby.size.width, CGRectGetMinY(orby) + 0.74920 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.97066 * orby.size.width, CGRectGetMinY(orby) + 0.67444 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.95429 * orby.size.width, CGRectGetMinY(orby) + 0.71323 * orby.size.height)];
        [indigoPath closePath];
        indigoPath.usesEvenOddFillRule = YES;
        [fillColor7 setFill];
        [indigoPath fill];
        
        
        //// East-Bay Drawing
        UIBezierPath* eastBayPath = [UIBezierPath bezierPath];
        [eastBayPath moveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.93429 * orby.size.width, CGRectGetMinY(orby) + 0.74794 * orby.size.height)];
        [eastBayPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.50000 * orby.size.width, CGRectGetMinY(orby) + 1.00000 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.84814 * orby.size.width, CGRectGetMinY(orby) + 0.89853 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.68592 * orby.size.width, CGRectGetMinY(orby) + 1.00000 * orby.size.height)];
        [eastBayPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.12953 * orby.size.width, CGRectGetMinY(orby) + 0.83580 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.35311 * orby.size.width, CGRectGetMinY(orby) + 1.00000 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.22101 * orby.size.width, CGRectGetMinY(orby) + 0.93666 * orby.size.height)];
        [eastBayPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.17725 * orby.size.width, CGRectGetMinY(orby) + 0.85100 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.14471 * orby.size.width, CGRectGetMinY(orby) + 0.84160 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.16169 * orby.size.width, CGRectGetMinY(orby) + 0.84662 * orby.size.height)];
        [eastBayPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.44448 * orby.size.width, CGRectGetMinY(orby) + 0.84883 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.26428 * orby.size.width, CGRectGetMinY(orby) + 0.87500 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.35795 * orby.size.width, CGRectGetMinY(orby) + 0.87433 * orby.size.height)];
        [eastBayPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.60637 * orby.size.width, CGRectGetMinY(orby) + 0.78683 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.49988 * orby.size.width, CGRectGetMinY(orby) + 0.83250 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.55196 * orby.size.width, CGRectGetMinY(orby) + 0.80650 * orby.size.height)];
        [eastBayPath addCurveToPoint: CGPointMake(CGRectGetMinX(orby) + 0.93429 * orby.size.width, CGRectGetMinY(orby) + 0.74794 * orby.size.height) controlPoint1: CGPointMake(CGRectGetMinX(orby) + 0.71020 * orby.size.width, CGRectGetMinY(orby) + 0.74939 * orby.size.height) controlPoint2: CGPointMake(CGRectGetMinX(orby) + 0.82447 * orby.size.width, CGRectGetMinY(orby) + 0.73621 * orby.size.height)];
        [eastBayPath addLineToPoint: CGPointMake(CGRectGetMinX(orby) + 0.93429 * orby.size.width, CGRectGetMinY(orby) + 0.74794 * orby.size.height)];
        [eastBayPath closePath];
        eastBayPath.usesEvenOddFillRule = YES;
        [fillColor8 setFill];
        [eastBayPath fill];
    }
}

@end
