//
//  RLMBrowserPropertyTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserPropertyTableViewCell.h"

@implementation RLMBrowserPropertyTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.indexedTagView.hidden && self.optionalTagView.hidden) {
        return;
    }
    
    CGSize containerSize = self.tagContainerView.frame.size;
    
    CGRect frame = CGRectZero;
    if (self.indexedTagView.hidden == NO) {
        frame.size = self.indexedTagView.image.size;
        frame.origin.x = containerSize.width - frame.size.width;
        frame.origin.y = (containerSize.height - frame.size.height) * 0.5f;
        self.indexedTagView.frame = frame;
    }
    
    if (self.optionalTagView.hidden == NO) {
        frame.size = self.optionalTagView.image.size;
        frame.origin.x = containerSize.width - frame.size.width;
        frame.origin.y = (containerSize.height - frame.size.height) * 0.5f;
        self.optionalTagView.frame = frame;
    }
    
    if (self.indexedTagView.hidden == NO && self.optionalTagView.hidden == NO) {
        frame = self.optionalTagView.frame;
        frame = CGRectOffset(frame, 0.0f, -(frame.size.height + 3));
        self.optionalTagView.frame = frame;
        
        frame = self.indexedTagView.frame;
        frame = CGRectOffset(frame, 0.0f, 3);
        self.indexedTagView.frame = frame;
    }
}

@end
