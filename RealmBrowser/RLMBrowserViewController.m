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
#import "RLMBrowserRealm.h"
#import "RLMBrowserList.h"
#import "RLMRealm+BrowserCaptureRealms.h"
#import "RLMRealm+BrowserCaptureWrites.h"
#import "RLMBrowserConfiguration.h"
#import "RLMBrowserEmptyViewController.h"
#import "RLMBrowserRealmTableViewController.h"

@interface RLMBrowserViewController () <TOSplitViewControllerDelegate>

@property (nonatomic, strong) UISplitViewController *innerSplitController;

@property (nonatomic, strong) UINavigationController *realmListNavigationController;
@property (nonatomic, strong) RLMBrowserRealmListViewController *realmListController;

@property (nonatomic, strong) UIBarButtonItem *doneButton;

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

    // Check to see if we have any Realm entries present
    RLMRealm *browserRealm = [RLMRealm RLMBrowser_realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
    RLMBrowserList *browserList = [RLMBrowserList allObjectsInRealm:browserRealm].firstObject;

    // Try each list of Realms
    RLMBrowserRealm *realmToDisplay = browserList.defaultRealm;
    if (realmToDisplay == nil) {
        realmToDisplay = browserList.starredRealms.firstObject;
    }

    if (realmToDisplay == nil) {
        realmToDisplay = browserList.allRealms.firstObject;
    }

    if (realmToDisplay == nil) {
        RLMBrowserEmptyViewController *controller = [[RLMBrowserEmptyViewController alloc] init];
        controller.navigationItem.rightBarButtonItem = _doneButton;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        RLM_RESET_NAVIGATION_CONTROLLER(navigationController);
        self.viewControllers = @[navigationController];
    }
    else {
        _realmListController = [[RLMBrowserRealmListViewController alloc] init];
        _realmListNavigationController = [[UINavigationController alloc] initWithRootViewController:_realmListController];
        RLM_RESET_NAVIGATION_CONTROLLER(_realmListNavigationController);

        RLMBrowserRealmTableViewController *tableViewController = [[RLMBrowserRealmTableViewController alloc] initWithBrowserRealm:realmToDisplay browserList:browserList];
        tableViewController.navigationItem.rightBarButtonItem = self.doneButton;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
        RLM_RESET_NAVIGATION_CONTROLLER(navigationController);
        self.viewControllers = @[_realmListNavigationController, navigationController];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(splitViewControllerChangedNotification:) name:TOSplitViewControllerShowTargetDidChangeNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TOSplitViewControllerShowTargetDidChangeNotification object:nil];
}

#pragma mark - Done Button Handling -

- (void)updateDoneButtonLocation
{
    // Set the done button to whichever last view controller is visible
    UINavigationController *lastController = (UINavigationController *)self.visibleViewControllers.lastObject;
    if ([lastController isKindOfClass:[UINavigationController class]] == NO) { return; }
    lastController.visibleViewController.navigationItem.rightBarButtonItem = self.doneButton;
}

- (void)splitViewControllerChangedNotification:(NSNotification *)notification;
{
    [self updateDoneButtonLocation];
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
    if (controllerType == TOSplitViewControllerTypeDetail) {
        auxiliaryViewController.navigationItem.rightBarButtonItem = self.doneButton;
    }
    
    return YES;
}

- (BOOL)splitViewController:(TOSplitViewController *)splitViewController
showSecondaryViewController:(UIViewController *)viewController
                     sender:(id)sender
{
    if (splitViewController.detailViewController) { return NO; }
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *vc = [(UINavigationController *)viewController visibleViewController];
        vc.navigationItem.rightBarButtonItem = self.doneButton;
    }
    else {
        viewController.navigationItem.rightBarButtonItem = self.doneButton;
    }
    
    return NO;
}

- (BOOL)splitViewController:(TOSplitViewController *)splitViewController
   showDetailViewController:(UIViewController *)viewController
                     sender:(id)sender
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *vc = [(UINavigationController *)viewController visibleViewController];
        vc.navigationItem.rightBarButtonItem = self.doneButton;
    }
    else {
        viewController.navigationItem.rightBarButtonItem = self.doneButton;
    }
    
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
