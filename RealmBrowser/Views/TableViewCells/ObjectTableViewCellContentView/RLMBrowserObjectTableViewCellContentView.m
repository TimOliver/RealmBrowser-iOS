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
    
    self.propertyNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.propertyNameLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightSemibold];
    self.propertyNameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.propertyNameLabel];
    
    self.propertyStatsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.propertyStatsLabel.font = [UIFont systemFontOfSize:14.0f];
    self.propertyStatsLabel.textAlignment = NSTextAlignmentLeft;
    self.propertyStatsLabel.textColor = [UIColor colorWithWhite:0.7f alpha:1.0f];
    [self addSubview:self.propertyStatsLabel];
    
    self.objectValueLabel = [[UILabel alloc] init];
    self.objectValueLabel.textAlignment = NSTextAlignmentLeft;
    self.objectValueLabel.font = [UIFont systemFontOfSize:17.0f];
    self.objectValueLabel.textColor = [UIColor colorWithWhite:0.3f alpha:1.0f];
    [self addSubview:self.objectValueLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.propertyNameLabel sizeToFit];
    
    CGFloat contentHeight = self.propertyNameLabel.font.lineHeight + self.objectValueLabel.font.lineHeight;
    CGFloat midPoint = self.frame.size.height * 0.5f;
    
    CGRect frame = self.propertyNameLabel.frame;
    frame.origin.x = 0.0f;
    frame.origin.y = midPoint - (contentHeight * 0.5f);
    self.propertyNameLabel.frame = frame;
    
    CGFloat titleLineY = CGRectGetMaxY(frame) + self.propertyNameLabel.font.descender;
    
    frame = self.propertyStatsLabel.frame;
    frame.origin.x = CGRectGetMaxX(self.propertyNameLabel.frame) + 3.0f;
    frame.size.width = 100.0f;
    frame.size.height = self.propertyStatsLabel.font.lineHeight;
    frame.origin.y = titleLineY - (frame.size.height + self.propertyStatsLabel.font.descender);
    self.propertyStatsLabel.frame = frame;
    
    frame = self.objectValueLabel.frame;
    frame.size.height = self.objectValueLabel.font.lineHeight;
    frame.size.width = self.frame.size.width;
    frame.origin.x = 0.0f;
    frame.origin.y = CGRectGetMaxY(self.propertyNameLabel.frame);
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
