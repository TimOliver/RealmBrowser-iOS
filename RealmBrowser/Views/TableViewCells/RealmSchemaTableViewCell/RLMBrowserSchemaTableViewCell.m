//
//  RLMRealmSchemaTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/23/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserSchemaTableViewCell.h"

@implementation RLMBrowserSchemaTableViewCell

@synthesize imageView = __imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
