//
//  RLMBrowserTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/24/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserTableViewCell.h"
#import "UIColor+BrowserRealmColors.h"


@interface RLMBrowserTableViewCell ()

@property (nonatomic, strong) UIView *browserCellSelectedBackgroundView;

@end

@implementation RLMBrowserTableViewCell

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];

    if (self.browserCellSelectedBackgroundView == nil) {
        self.browserCellSelectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        self.browserCellSelectedBackgroundView.backgroundColor = [UIColor RLMBrowser_realmColorsLight].lastObject;
        self.selectedBackgroundView = self.browserCellSelectedBackgroundView;
    }
}

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    if (selectedBackgroundColor == _selectedBackgroundColor) {
        return;
    }

    _selectedBackgroundColor = selectedBackgroundColor;

    self.browserCellSelectedBackgroundView.backgroundColor = _selectedBackgroundColor;
}


@end
