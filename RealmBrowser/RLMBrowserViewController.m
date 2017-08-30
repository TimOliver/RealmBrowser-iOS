//
//  RLMBrowserViewController.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

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
    
    _logoController = [[RLMBrowserLogoViewController alloc] init];
    _logoController.navigationItem.rightBarButtonItem = _doneButton;
    _logoNavigationController = [[UINavigationController alloc] initWithRootViewController:_logoController];
    
    self.viewControllers = @[_realmListNavigationController, _logoNavigationController];
}

#pragma mark - Done Button Handling -
- (void)removeDoneButtonFromStackInNavigationController:(UINavigationController *)navController
{
    // Loop through all the controllers and remove the 'Done' button from them
    for (UIViewController *controller in navController.viewControllers) {
        controller.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)doneButtonTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISplitViewController Delegate -
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController
//    collapseSecondaryViewController:(UIViewController *)secondaryViewController
//          ontoPrimaryViewController:(UIViewController *)primaryViewController
//{
//    UINavigationController *primaryNavigationController = (UINavigationController *)primaryViewController;
//    primaryViewController = primaryNavigationController.visibleViewController;
//    
//    UINavigationController *secondaryNavigationController = (UINavigationController *)secondaryViewController;
//    secondaryViewController = secondaryNavigationController.visibleViewController;
//    
//    // We only care about changing the collapse if there is an object view controller visible,
//    // otherwise the default functionality is fine
//    if (secondaryNavigationController != self.logoNavigationController) {
//        [primaryNavigationController pushViewController:secondaryViewController animated:NO];
//    }
//    
//    // Strip out and then add back in the done button
//    [self removeDoneButtonFromStackInNavigationController:primaryNavigationController];
//    primaryNavigationController.visibleViewController.navigationItem.rightBarButtonItem = self.doneButton;
//    
//    return YES;
//}
//
//- (UIViewController *)splitViewController:(UISplitViewController *)splitViewController
//                separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController
//{
//    UINavigationController *primaryNavigationController = (UINavigationController *)primaryViewController;
//    
//    // Remove the done button from all of the primary controller childen
//    [self removeDoneButtonFromStackInNavigationController:(UINavigationController *)primaryNavigationController];
//    
//    UINavigationController *newSecondaryController = nil;
//    
//    // If a legit content view controller is at the end of this stack, defer to that
//    if ([primaryNavigationController.viewControllers.lastObject isKindOfClass:[RLMBrowserObjectViewController class]]) {
//        UIViewController *lastController = [primaryNavigationController popViewControllerAnimated:NO];
//        newSecondaryController = [[UINavigationController alloc] initWithRootViewController:lastController];
//    }
//    else { // otherwise, defer back to the empty view controller
//        newSecondaryController = self.logoNavigationController;
//    }
//    
//    // Add it to the new secondary controller
//    newSecondaryController.visibleViewController.navigationItem.rightBarButtonItem = self.doneButton;
//    
//    return newSecondaryController;
//}

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
