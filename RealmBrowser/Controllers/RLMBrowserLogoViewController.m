//
//  RLMBrowserLogoViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserConstants.h"
#import "RLMBrowserLogoViewController.h"
#import "RLMRealmMonochromeLogoView.h"

@interface RLMBrowserLogoViewController ()
@property (nonatomic, strong) RLMRealmMonochromeLogoView *logoView;
@end

@implementation RLMBrowserLogoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RLM_RESET_NAVIGATION_CONTROLLER(self.navigationController);

    self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:239.0f/255.0f blue:244.0f/255.0f alpha:1.0f];
    
    self.logoView = [[RLMRealmMonochromeLogoView alloc] initWithFrame:(CGRect){0,0,150,150}];
    self.logoView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
                                        | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.logoView.center = self.view.center;
    [self.view addSubview:self.logoView];
}

@end
