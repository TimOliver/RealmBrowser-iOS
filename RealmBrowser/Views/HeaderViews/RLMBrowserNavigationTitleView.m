//
//  RLMBrowserObjectListHeaderView.m
//  RealmBrowser
//
//  Created by Tim Oliver on 28/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserNavigationTitleView.h"

@implementation RLMBrowserNavigationTitleView

- (instancetype)init
{
    if ((self = [[NSBundle mainBundle] loadNibNamed:@"RLMBrowserNavigationTitleView"
                                               owner:self options:nil].firstObject)) {
        
    }
    
    return self;
}

- (void)setAutoresizingMask:(UIViewAutoresizing)autoresizingMask
{
    return [super setAutoresizingMask:autoresizingMask];
}

- (void)sizeToFit
{
    CGSize titleSize = [self.titleLabel sizeThatFits:self.bounds.size];
    CGSize subtitleSize = [self.subtitleLabel sizeThatFits:self.bounds.size];
    CGSize newSize = (CGSize){MAX(titleSize.width, subtitleSize.width), self.bounds.size.height};
    self.frame = (CGRect){CGPointZero, newSize};
}

@end
