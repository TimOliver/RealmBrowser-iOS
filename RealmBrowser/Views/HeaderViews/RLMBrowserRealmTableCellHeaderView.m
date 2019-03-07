//
//  RLMRealmTableCellHeaderView.m
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

#import "RLMBrowserRealmTableCellHeaderView.h"
#import "UIImage+BrowserIcons.h"

@interface RLMBrowserRealmTableCellHeaderView ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIImageView *disclosureArrowView;
@property (nonatomic, strong, readwrite) UILabel *countLabel;
@property (nonatomic, strong, readwrite) UIView *separatorView;

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation RLMBrowserRealmTableCellHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }

    return self;
}

- (void)setUp
{
    _contentInset = UIEdgeInsetsMake(0, 16.0f, 0, 16.0f);

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont systemFontOfSize:13.5f];
    _titleLabel.textColor = [UIColor colorWithRed:90.04/255.0f green:90.0f/255.0f blue:95.0f/255.0f alpha:1.0f];
    [self addSubview:_titleLabel];

    UIImage *arrowIcon = [UIImage RLMBrowser_headerDisclosureArrowIcon];
    _disclosureArrowView = [[UIImageView alloc] initWithImage:arrowIcon];
    _disclosureArrowView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    _disclosureArrowView.tintColor = _titleLabel.textColor;
    _disclosureArrowView.alpha = 0.4f;
    _disclosureArrowView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
    [self.contentView addSubview:_disclosureArrowView];

    _countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _countLabel.font = self.textLabel.font;
    _countLabel.textColor = self.textLabel.textColor;
    [self.contentView addSubview:_countLabel];

    _dimmingView = [[UIView alloc] initWithFrame:self.bounds];
    _dimmingView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.1f];
    _dimmingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _dimmingView.alpha = 0.0f;
    [self addSubview:_dimmingView];

    CGFloat separatorHeight = 1.0f / [UIScreen mainScreen].scale;
    _separatorView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, self.frame.size.height - separatorHeight, self.frame.size.width, separatorHeight)];
    _separatorView.backgroundColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
    _separatorView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    _separatorView.alpha = 0.0f;
    [self addSubview:_separatorView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.titleLabel sizeToFit];
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = self.contentInset.left;
    frame.origin.y = ceilf((self.contentView.frame.size.height - frame.size.height) * 0.5f);
    self.titleLabel.frame = CGRectIntegral(frame);

    frame = self.disclosureArrowView.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) - (frame.size.width + self.contentInset.left);
    frame.origin.y = CGRectGetMidY(self.contentView.bounds) - (frame.size.height * 0.5f);
    self.disclosureArrowView.frame = frame;

    [self.countLabel sizeToFit];
    frame = self.countLabel.frame;
    frame.origin.x = self.disclosureArrowView.center.x - 30.0f;
    frame.origin.y = CGRectGetMidY(self.contentView.bounds) - (frame.size.height * 0.5f);
    self.countLabel.frame = frame;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.collapseToggledHandler = nil;
}

- (void)setCollapsed:(BOOL)collapsed
{
    [self setCollapsed:collapsed animated:NO];
}

- (void)setCollapsed:(BOOL)collapsed animated:(BOOL)animated
{
    if (collapsed == _collapsed) { return; }

    _collapsed = collapsed;

    if (self.collapseToggledHandler) {
        self.collapseToggledHandler();
    }
    __weak typeof(self) weakSelf = self;
    void (^animationBlock)(void) = ^{
        CGFloat angle = _collapsed ? 0.0f : M_PI_2;
        weakSelf.disclosureArrowView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
        weakSelf.separatorView.alpha = collapsed ? 1.0f : 0.0f;
    };

    if (!animated) {
        animationBlock();
        return;
    }

    [UIView animateWithDuration:0.4f
                          delay:0.0f
         usingSpringWithDamping:1.0f
          initialSpringVelocity:0.5f
                        options:0
                     animations:animationBlock
                     completion:nil];
}

#pragma mark - Interaction -

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.dimmingView.alpha = 1.0f;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [UIView animateWithDuration:0.4f animations:^{
        self.dimmingView.alpha = 0.0f;
    }];

    [self setCollapsed:!self.collapsed animated:YES];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.dimmingView.alpha = 0.0f;
}

@end
