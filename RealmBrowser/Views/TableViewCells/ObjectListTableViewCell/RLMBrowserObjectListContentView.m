//
//  RLMBrowserObjectListTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 27/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectListContentView.h"

@implementation RLMBrowserObjectListContentView

+ (instancetype)objectListContentView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RLMBrowserObjectListContentView" owner:nil options:nil] firstObject];
}

@end
