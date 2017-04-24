//
//  RLMBrowserRealmTableViewCell.h
//  RealmBrowser
//
//  Created by Tim Oliver on 27/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserRealmTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *lockIconView;

@end
