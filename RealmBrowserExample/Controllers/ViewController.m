//
//  ViewController.m
//  realm-browser-ios
//
//  Created by Tim Oliver on 23/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "ViewController.h"
#import "RLMRealmLogoView.h"
#import "RLMBrowserViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView = [[RLMRealmLogoView alloc] init];
    self.navigationItem.titleView.frame = CGRectMake(0,0,31,31);
}


- (IBAction)showButtonTapped:(id)sender
{
    RLMBrowserViewController *controller = [[RLMBrowserViewController alloc] init];
    [controller show];
}

@end
