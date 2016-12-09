//
//  RLMBrowserObjectViewController.h
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface RLMBrowserObjectViewController : UITableViewController

- (instancetype)initWithObject:(RLMObject *)realmObject;

@end
