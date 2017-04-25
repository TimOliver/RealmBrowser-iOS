//
//  RLMRealmSchemaTableViewCell.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/23/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMBrowserTableViewCell.h"

@interface RLMBrowserSchemaTableViewCell : RLMBrowserTableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;

@end
