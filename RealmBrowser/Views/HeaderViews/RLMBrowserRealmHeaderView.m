//
//  RLMBrowserRealmHeaderView.m
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/9/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserRealmHeaderView.h"

@implementation RLMBrowserRealmHeaderView

+ (RLMBrowserRealmHeaderView *)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"RLMBrowserRealmHeaderView"
                                         owner:self options:nil].firstObject;
}

@end
