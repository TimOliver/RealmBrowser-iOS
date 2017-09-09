//
//  RLMBrowserRealmTableViewController.h
//  RealmBrowser
//
//  Created by Tim Oliver on 5/10/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RLMBrowserRealm;

@interface RLMBrowserRealmTableViewController : UITableViewController

@property (nonatomic, readonly) RLMBrowserRealm *browserRealm;

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm;

@end
