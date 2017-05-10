//
//  RLMBrowserTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/24/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserTableViewCell.h"

@interface RLMBrowserTableViewCell ()

@property (nonatomic, strong) UIView *browserCellSelectedBackgroundView;

@end

@implementation RLMBrowserTableViewCell

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    if (selectedBackgroundColor == _selectedBackgroundColor) {
        return;
    }

    _selectedBackgroundColor = selectedBackgroundColor;

    if (self.browserCellSelectedBackgroundView == nil) {
        self.browserCellSelectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = self.browserCellSelectedBackgroundView;
    }

    self.browserCellSelectedBackgroundView.backgroundColor = _selectedBackgroundColor;
}

@end
