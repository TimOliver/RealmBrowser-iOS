//
//  RLMBrowserObjectView.h
//  RealmBrowser
//
//  Created by Tim Oliver on 12/9/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserObjectContentView : UIView

@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) UIImage *quickLookIcon;
@property (nonatomic, copy) NSString *propertyName;
@property (nonatomic, copy) NSString *propertyStats;
@property (nonatomic, copy) NSString *objectValue;
@property (nonatomic, assign) BOOL nilValue;

@property (nonatomic, strong) UIColor *iconColor;

@property (nonatomic, readonly) UIButton *quickLookButton;

+ (instancetype)objectContentView;

- (void)showCopyButton;

@end
