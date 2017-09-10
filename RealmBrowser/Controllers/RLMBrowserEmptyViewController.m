//
//  RLMBrowserEmptyViewController.m
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/10/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

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
