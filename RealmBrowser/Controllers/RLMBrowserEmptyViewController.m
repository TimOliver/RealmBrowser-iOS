//
//  RLMBrowserEmptyViewController.m
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

#import "RLMBrowserEmptyViewController.h"
#import "RLMBrowserEmptyContentView.h"
#import "RLMRealmMonochromeLogoView.h"
#import "RLMRealmLogoView.h"

@interface RLMBrowserEmptyViewController ()

@property (nonatomic, strong) RLMBrowserEmptyContentView *emptyView;

@end

@implementation RLMBrowserEmptyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.emptyView = [RLMBrowserEmptyContentView emptyView];
    self.emptyView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |
                        UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.emptyView.center = (CGPoint){CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)};
    [self.view addSubview:self.emptyView];

    self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:239.0f/255.0f blue:244.0f/255.0f alpha:1.0f];

    self.navigationItem.titleView = [[RLMRealmLogoView alloc] initWithFrame:(CGRect){0,0,30,30}];

    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(id)kCFBundleNameKey];
    NSString *subtitleString = [NSString stringWithFormat:NSLocalizedString(@"%@ needs to open each Realm before it will appear here.", @""), appName];
    self.emptyView.subtitleLabel.text = subtitleString;
}

@end
