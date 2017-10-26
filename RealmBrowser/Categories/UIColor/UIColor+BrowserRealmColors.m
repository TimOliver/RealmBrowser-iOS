//
//  UIColor+RealmColors.m
//  RealmBrowser
//
//  Created by Tim Oliver on 5/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

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
