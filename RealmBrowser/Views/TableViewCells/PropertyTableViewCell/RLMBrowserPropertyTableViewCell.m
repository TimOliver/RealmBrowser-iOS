//
//  RLMBrowserPropertyTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserPropertyTableViewCell.h"
#import "RLMProperty+BrowserDescription.h"

@implementation RLMBrowserPropertyTableViewCell

- (void)configureCellWithProperty:(RLMProperty *)property
{
    self.titleLabel.text = property.name;
    self.subtitleLabel.text = property.RLMBrowser_configurationDescription;
    self.typeLabel.text = property.RLMBrowser_typeDescription;
}

- (void)setRightInset:(CGFloat)rightInset
{
    if (_rightInset == rightInset) { return; }
    _rightInset = rightInset;

    CGSize viewSize = self.frame.size;

    CGRect frame = self.containerView.frame;
    frame.origin.x = viewSize.width - (frame.size.width + 11 + _rightInset);
    self.containerView.frame = frame;

    frame = self.titleLabel.frame;
    frame.size.width = CGRectGetMinX(self.titleLabel.frame) - frame.origin.x;
    self.titleLabel.frame = frame;
}

@end
