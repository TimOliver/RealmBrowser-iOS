//
//  RLMBrowserObjectSchemaViewController.h
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/14/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface RLMBrowserObjectSchemaViewController : UITableViewController

- (instancetype)initWithObjectSchema:(RLMObjectSchema *)objectSchema;

@end
