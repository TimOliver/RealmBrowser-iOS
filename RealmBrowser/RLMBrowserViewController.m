//
//  RLMBrowserViewController.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserViewController.h"
#import "RLMBrowserRealmListViewController.h"
#import "RLMBrowserLogoViewController.h"

@interface RLMBrowserViewController () <UISplitViewControllerDelegate>

@property (nonatomic, strong) UISplitViewController *innerSplitController;

@property (nonatomic, strong) UINavigationController *realmListNavigationController;
@property (nonatomic, strong) RLMBrowserRealmListViewController *realmListController;

@property (nonatomic, strong) UINavigationController *logoNavigationController;
@property (nonatomic, strong) RLMBrowserLogoViewController *logoController;

@property (nonatomic, strong) UIBarButtonItem *doneButton;

- (void)setUp;
- (void)doneButtonTapped:(id)sender;
- (void)setDoneButtonLocationForSizeClass:(UIUserInterfaceSizeClass)sizeClass;

@end

@implementation RLMBrowserViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self setUp];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp
{
    self.delegate = self;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;

    _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonTapped:)];
    
    _realmListController = [[RLMBrowserRealmListViewController alloc] init];
    _realmListNavigationController = [[UINavigationController alloc] initWithRootViewController:_realmListController];
    
    _logoController = [[RLMBrowserLogoViewController alloc] init];
    _logoController.navigationItem.rightBarButtonItem = _doneButton;
    _logoNavigationController = [[UINavigationController alloc] initWithRootViewController:_logoController];
    
    self.viewControllers = @[_realmListNavigationController, _logoNavigationController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setDoneButtonLocationForSizeClass:self.traitCollection.horizontalSizeClass];
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [self setDoneButtonLocationForSizeClass:newCollection.horizontalSizeClass];
}

#pragma mark - Done Button Handling -
- (void)setDoneButtonLocationForSizeClass:(UIUserInterfaceSizeClass)sizeClass
{
    BOOL compactMode = sizeClass == UIUserInterfaceSizeClassCompact;
    UIViewController *masterViewController = [(UINavigationController *)self.viewControllers.firstObject visibleViewController];
    masterViewController.navigationItem.rightBarButtonItem = compactMode ? self.doneButton : nil;
}

- (void)doneButtonTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Delegate Callbacks - 
- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    return YES;
}

#pragma mark - Display -
- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootController = window.rootViewController;
    [rootController presentViewController:self animated:YES completion:nil];
}

@end
