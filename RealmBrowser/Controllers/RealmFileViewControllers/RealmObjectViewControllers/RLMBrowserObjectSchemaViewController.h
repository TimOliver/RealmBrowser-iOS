//
//  RLMBrowserObjectSchemaViewController.h
//  RealmBrowser
//
//  Created by Tim Oliver on 12/4/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RLMBrowserRealm;
@class RLMBrowserSchema;

@interface RLMBrowserObjectSchemaViewController : UITableViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema;

@end
