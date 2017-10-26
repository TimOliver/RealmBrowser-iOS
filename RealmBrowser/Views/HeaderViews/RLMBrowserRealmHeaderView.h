//
//  RLMBrowserRealmHeaderView.h
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/9/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserRealmHeaderView : UIView

@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;

+ (RLMBrowserRealmHeaderView *)headerView;

@end
