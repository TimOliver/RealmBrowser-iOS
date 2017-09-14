//
//  RLMBrowserPropertyTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserPropertyTableViewCell.h"
#import "RLMProperty+BrowserDescription.h"

@implementation RLMBrowserPropertyTableViewCell

- (void)configureCellWithProperty:(RLMProperty *)property
{
    self.titleLabel.text = property.name;
    self.subtitleLabel.text = property.RLMBrowser_configurationDescription;
    self.typeLabel.text = property.RLMBrowser_typeDescription;
}

@end
