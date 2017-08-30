//
//  RLMBrowserPropertyTableViewCell.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMBrowserTableViewCell.h"

@interface RLMBrowserPropertyTableViewCell : RLMBrowserTableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *typeLabel;

@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@property (nonatomic, weak) IBOutlet UIImageView *checkmarkView;

@end
