//
//  RLMBrowserSchemaPreviewView.h
//  RealmBrowser
//
//  Created by Tim Oliver on 12/15/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RLMBrowserObjectListContentView.h"

@interface RLMBrowserSchemaPreviewView : UIView

@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UIView *separatorView;
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) RLMBrowserObjectListContentView *objectPreviewView;

+ (instancetype)contentView;

@end
