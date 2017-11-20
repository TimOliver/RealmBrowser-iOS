//
//  RLMBrowserPropertyTableViewCell.m
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
