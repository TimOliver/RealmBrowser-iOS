//
//  RLMBrowserSchemaPreviewView.m
//
//  Copyright 2016-2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
