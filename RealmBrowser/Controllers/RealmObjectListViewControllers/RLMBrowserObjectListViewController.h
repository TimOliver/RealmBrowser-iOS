//
//  RLMBrowserRealmsViewControllerTableViewController.h
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RLMBrowserRealm;
@class RLMBrowserSchema;

@interface RLMBrowserObjectListViewController : UITableViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema;

@end
