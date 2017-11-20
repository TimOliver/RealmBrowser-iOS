//
//  UIColor+RealmColors.m
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

#import "UIColor+BrowserRealmColors.h"

@implementation UIColor (BrowserRealmColors)

+ (NSArray *)RLMBrowser_realmColors
{
    return @[[UIColor colorWithRed:252.0f/255.0f green:195.0f/255.0f blue:151.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:252.0f/255.0f green:158.0f/255.0f blue:148.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:247.0f/255.0f green:124.0f/255.0f blue:135.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:242.0f/255.0f green:81.0f/255.0f blue:145.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:211.0f/255.0f green:75.0f/255.0f blue:163.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:154.0f/255.0f green:80.0f/255.0f blue:164.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:88.0f/255.0f green:86.0f/255.0f blue:157.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:56.0f/255.0f green:71.0f/255.0f blue:126.0f/255.0f alpha:1.0f]
            ];
}

+ (NSArray *)RLMBrowser_realmColorsLight
{
    return @[[UIColor colorWithRed:253.0f/255.0f green:249.0f/255.0f blue:245.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:252.0f/255.0f green:246.0f/255.0f blue:245.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:252.0f/255.0f green:243.0f/255.0f blue:244.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:251.0f/255.0f green:240.0f/255.0f blue:245.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:248.0f/255.0f green:240.0f/255.0f blue:246.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:244.0f/255.0f green:239.0f/255.0f blue:246.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:240.0f/255.0f green:239.0f/255.0f blue:245.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:243.0f/255.0f alpha:1.0f]
             ];
}

+ (NSArray *)RLMBrowser_realmColorsInvertedRepeating
{
    NSArray *realmColors = [UIColor RLMBrowser_realmColors];
    NSArray *invertedColors = [[realmColors reverseObjectEnumerator] allObjects];
    
    NSMutableArray *colors = [NSMutableArray array];
    [colors addObjectsFromArray:invertedColors];
    [colors removeLastObject]; // Remove repeating color
    [colors addObjectsFromArray:realmColors];
    [colors removeLastObject]; // Remove repeating color
     
    return [NSArray arrayWithArray:colors];
}

+ (NSArray *)RLMBrowser_realmColorsLightInvertedRepeating
{
    NSArray *realmColors = [UIColor RLMBrowser_realmColorsLight];
    NSArray *invertedColors = [[realmColors reverseObjectEnumerator] allObjects];

    NSMutableArray *colors = [NSMutableArray array];
    [colors addObjectsFromArray:invertedColors];
    [colors removeLastObject]; // Remove repeating color
    [colors addObjectsFromArray:realmColors];
    [colors removeLastObject]; // Remove repeating color

    return [NSArray arrayWithArray:colors];
}

@end
