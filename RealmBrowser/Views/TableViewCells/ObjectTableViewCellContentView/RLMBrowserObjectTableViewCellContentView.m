//
//  RLMBrowserObjectView.m
//  RealmBrowser
//
//  Created by Tim Oliver on 12/9/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectTableViewCellContentView.h"

@interface RLMBrowserObjectTableViewCellContentView ()

@property (nonatomic, strong) UILabel *propertyNameLabel;
@property (nonatomic, strong) UILabel *propertyStatsLabel;
@property (nonatomic, strong) UILabel *objectValueLabel;

@end

@implementation RLMBrowserObjectTableViewCellContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.propertyNameLabel = [[UILabel alloc] init];
    self.propertyNameLabel.font = [UIFont systemFontOfSize:17.0f weight:UIFontWeightMedium];
    [self addSubview:self.propertyNameLabel];
    
    self.propertyStatsLabel = [[UILabel alloc] init];
    self.propertyStatsLabel.font = [UIFont systemFontOfSize:11.0f];
    self.propertyStatsLabel.textColor = [UIColor colorWithWhite:0.3f alpha:1.0f];
    [self addSubview:self.propertyStatsLabel];
    
    self.objectValueLabel = [[UILabel alloc] init];
    self.objectValueLabel.textAlignment = NSTextAlignmentRight;
    self.objectValueLabel.font = [UIFont systemFontOfSize:17.0f];
    [self addSubview:self.objectValueLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.propertyStatsLabel sizeToFit];
    [self.propertyNameLabel sizeToFit];
    
    CGFloat midHeight = self.frame.size.height * 0.5f;
    UIView *widerView = nil;
    
    CGRect frame = self.propertyNameLabel.frame;
    frame.origin.x = 10.0f;
    frame.origin.y = midHeight - ((frame.size.height));
    widerView = self.propertyNameLabel;
    self.propertyNameLabel.frame = frame;
    
    frame = self.propertyStatsLabel.frame;
    frame.origin.x = 10.0f;
    frame.origin.y = midHeight;
    if (frame.size.width > widerView.frame.size.width) { widerView = self.propertyStatsLabel; }
    self.propertyStatsLabel.frame = frame;
    
    frame = self.objectValueLabel.frame;
    frame.size.height = self.frame.size.height;
    frame.size.width = (self.frame.size.width - (CGRectGetMaxX(widerView.frame) + 20.0f));
    frame.origin.x = CGRectGetMaxX(widerView.frame) + 10.0f;
    frame.origin.y = 0.0f;
    self.objectValueLabel.frame = frame;
}

#pragma mark - Accessor Overrides -

- (void)setPropertyName:(NSString *)propertyName
{
    self.propertyNameLabel.text = propertyName;
    [self setNeedsLayout];
}

- (NSString *)propertyName
{
    return self.propertyNameLabel.text;
}

- (void)setPropertyStats:(NSString *)propertyStats
{
    self.propertyStatsLabel.text = propertyStats;
    [self setNeedsLayout];
}

- (NSString *)propertyStats
{
    return self.propertyStatsLabel.text;
}

- (void)setObjectValue:(NSString *)objectValue
{
    self.objectValueLabel.text = objectValue;
    [self setNeedsLayout];
}

- (NSString *)objectValue
{
    return self.objectValueLabel.text;
}

@end
