//
//  RLMBrowserEmptyView.h
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/10/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RLMRealmMonochromeLogoView;

@interface RLMBrowserEmptyContentView : UIView

@property (nonatomic, weak) IBOutlet RLMRealmMonochromeLogoView *logoView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;

+ (instancetype)emptyView;

@end
