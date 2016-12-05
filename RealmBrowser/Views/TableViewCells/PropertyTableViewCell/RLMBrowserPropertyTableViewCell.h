//
//  RLMBrowserPropertyTableViewCell.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserPropertyTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@property (nonatomic, weak) IBOutlet UIView *tagContainerView;
@property (nonatomic, weak) IBOutlet UIImageView *optionalTagView;
@property (nonatomic, weak) IBOutlet UIImageView *indexedTagView;

@end
