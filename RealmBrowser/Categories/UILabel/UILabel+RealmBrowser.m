//
//  UILabel+RealmBrowser.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/25/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "UILabel+RealmBrowser.h"

@implementation UILabel (RealmBrowser)

+ (UILabel *)RLMBrowser_toolbarLabelWithText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:11.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = text;
    [label sizeToFit];
    return label;
}

@end
