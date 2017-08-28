//
//  RLMRealmTableCellHeaderView.m
//  RealmBrowserExample
//
//  Created by Tim Oliver on 8/28/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserRealmTableCellHeaderView.h"
#import "UIImage+BrowserIcons.h"

@interface RLMBrowserRealmTableCellHeaderView ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIImageView *disclosureArrowView;
@property (nonatomic, strong, readwrite) UILabel *countLabel;

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
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.dimmingView.alpha = 0.0f;
}

@end
