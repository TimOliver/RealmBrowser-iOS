//
//  RLMBrowserEmptyView.m
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/10/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserEmptyContentView.h"
#import "RLMRealmMonochromeLogoView.h"

@implementation RLMBrowserEmptyContentView

+ (instancetype)emptyView
{
    return [[NSBundle mainBundle] loadNibNamed:@"RLMBrowserEmptyContentView" owner:self options:nil].firstObject;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.logoView.backgroundColor = [UIColor clearColor];
    self.logoView.strokeColor = [UIColor colorWithWhite:0.7f alpha:1.0f];
    self.logoView.strokeWidth = 5.0f;
}

@end
