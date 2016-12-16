//
//  RLMBrowserSchemaPreviewView.m
//  RealmBrowser
//
//  Created by Tim Oliver on 12/15/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserSchemaPreviewView.h"

@implementation RLMBrowserSchemaPreviewView

+ (instancetype)contentView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RLMBrowserSchemaPreviewView" owner:self options:nil] firstObject];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Set the separator to the physical pixel height
    CGRect frame = self.separatorView.frame;
    frame.size.height = 1.0f / [UIScreen mainScreen].scale;
    self.separatorView.frame = frame;
    
    // Set the toolbar height
    self.toolbar.frame = self.bounds;
    
    // Create the preview view
    self.objectPreviewView = [RLMBrowserObjectListContentView objectListContentView];
    self.objectPreviewView.frame = CGRectInset(self.contentView.bounds, 0.0f, 1.0f);
    [self.contentView addSubview:self.objectPreviewView];
}

@end
