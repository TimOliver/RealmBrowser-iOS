//
//  RLMBrowserObjectSchemaViewController.h
//  RealmBrowser
//
//  Created by Tim Oliver on 12/4/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RLMObject;
@class RLMBrowserRealm;
@class RLMBrowserSchema;

@interface RLMBrowserObjectSchemaPickerViewController : UIViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema demoObject:(RLMObject *)object;

@end
