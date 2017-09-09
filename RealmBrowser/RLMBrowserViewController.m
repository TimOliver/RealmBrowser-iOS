//
//  RLMBrowserViewController.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserConstants.h"
#import "RLMBrowserViewController.h"
#import "RLMBrowserRealmListViewController.h"
#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserObjectViewController.h"
#import "RLMBrowserLogoViewController.h"

#import "RLMBrowserAppGroupRealm.h"
#import "RLMRealm+BrowserCaptureRealms.h"
#import "RLMRealm+BrowserCaptureWrites.h"
#import "RLMBrowserConfiguration.h"

@interface RLMBrowserViewController () <TOSplitViewControllerDelegate>

@property (nonatomic, strong) UISplitViewController *innerSplitController;

@property (nonatomic, strong) UINavigationController *realmListNavigationController;
@property (nonatomic, strong) RLMBrowserRealmListViewController *realmListController;

@property (nonatomic, strong) UINavigationController *logoNavigationController;
@property (nonatomic, strong) RLMBrowserLogoViewController *logoController;

@property (nonatomic, strong) UIBarButtonItem *doneButton;

- (void)setUp;
- (void)doneButtonTapped:(id)sender;
- (void)removeDoneButtonFromStackInNavigationController:(UINavigationController *)navController;

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

    _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonTapped:)];
    
    _realmListController = [[RLMBrowserRealmListViewController alloc] init];
    _realmListNavigationController = [[UINavigationController alloc] initWithRootViewController:_realmListController];
    RLM_RESET_NAVIGATION_CONTROLLER(_realmListNavigationController);

    _logoController = [[RLMBrowserLogoViewController alloc] init];
    _logoController.navigationItem.rightBarButtonItem = _doneButton;
    _logoNavigationController = [[UINavigationController alloc] initWithRootViewController:_logoController];
    RLM_RESET_NAVIGATION_CONTROLLER(_logoNavigationController);

    self.viewControllers = @[_realmListNavigationController, _logoNavigationController];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(splitViewControllerChangedNotification:) name:TOSplitViewControllerShowTargetDidChangeNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TOSplitViewControllerShowTargetDidChangeNotification object:nil];
}

#pragma mark - Done Button Handling -

- (void)splitViewControllerChangedNotification:(NSNotification *)notification;
{
    // Set the done button to whichever last view controller is visible
    UINavigationController *lastController = (UINavigationController *)self.visibleViewControllers.lastObject;
    if ([lastController isKindOfClass:[UINavigationController class]] == NO) { return; }
    lastController.visibleViewController.navigationItem.rightBarButtonItem = self.doneButton;
}

- (void)doneButtonTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)splitViewController:(TOSplitViewController *)splitViewController
     collapseViewController:(UIViewController *)auxiliaryViewController
                     ofType:(TOSplitViewControllerType)controllerType
  ontoPrimaryViewController:(UIViewController *)primaryViewController
              shouldAnimate:(BOOL)animate
{
    return NO;
}

#pragma mark - Registering App Group Realms -
+ (void)registerAppGroupRealmAtRelativePath:(NSString *)path forGroupIdentifier:(NSString *)identifier
{
    // Add a leading '/'
    if ([path characterAtIndex:0] != '/') {
        path = [NSString stringWithFormat:@"/%@", path];
    }

    RLMRealm *browserRealm = [RLMRealm RLMBrowser_realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];

    // Check if we already registered this Realm file
    RLMResults *appGroupRealms = [RLMBrowserAppGroupRealm objectsInRealm:browserRealm
                                                                   where:@"groupIdentifier == %@ && realmFilePath == %@",
                                                                      identifier, path];

    if (appGroupRealms.count > 0) { return; }

    // Add this entry to the browser realm
    RLMBrowserAppGroupRealm *appGroupRealm = [[RLMBrowserAppGroupRealm alloc] init];
    appGroupRealm.realmFilePath = path;
    appGroupRealm.groupIdentifier = identifier;

    [browserRealm beginWriteTransaction];
    [browserRealm addObject:appGroupRealm];
    [browserRealm RLMBrowser_commitWriteTransaction:nil];
}

#pragma mark - Display -
+ (void)show
{
    @autoreleasepool {
        RLMBrowserViewController *controller = [[RLMBrowserViewController alloc] init];
        [controller show];
    }
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootController = window.rootViewController;
    if ([rootController.presentedViewController isKindOfClass:[RLMBrowserViewController class]]) {
        return;
    }

    [rootController presentViewController:self animated:YES completion:nil];
}

+ (void)reset
{
    RLMRealmConfiguration *configuration = [RLMBrowserConfiguration configuration];
    [[NSFileManager defaultManager] removeItemAtURL:configuration.fileURL.URLByDeletingLastPathComponent error:nil];
}

@end
