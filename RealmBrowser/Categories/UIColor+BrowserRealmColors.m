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
    return @[[UIColor colorWithRed:231.0f/255.0f green:167.0f/255.0f blue:118.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:228.0f/255.0f green:125.0f/255.0f blue:114.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:233.0f/255.0f green:99.0f/255.0f blue:111.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:242.0f/255.0f green:81.0f/255.0f blue:145.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:154.0f/255.0f green:80.0f/255.0f blue:164.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:88.0f/255.0f green:86.0f/255.0f blue:157.0f/255.0f alpha:1.0f],
             [UIColor colorWithRed:56.0f/255.0f green:71.0f/255.0f blue:126.0f/255.0f alpha:1.0f]
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

@end
