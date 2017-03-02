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
    
    CGFloat height = 1.0f / [UIScreen mainScreen].scale;
    
    // Set the separator to the physical pixel height
    CGRect frame = self.topSeparatorView.frame;
    frame.size.height = height;
    self.topSeparatorView.frame = frame;
    
    frame = self.bottomSeparatorView.frame;
    frame.size.height = height;
    self.bottomSeparatorView.frame = frame;
    
    // Set the toolbar height
    self.navbar.frame = self.bounds;
    
    // Create the preview view
    self.objectPreviewView = [RLMBrowserObjectListContentView objectListContentView];
    self.objectPreviewView.frame = CGRectInset(self.contentView.bounds, 0.0f, 1.0f);
    [self.contentView addSubview:self.objectPreviewView];
}

@end
