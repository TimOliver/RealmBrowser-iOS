//
//  RLMBrowserObjectListContainerViewController.m
//  RealmBrowser
//
//  Created by Tim Oliver on 12/4/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectListContainerViewController.h"

// Realm Model Objects
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

// View Controller
#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserObjectSchemaViewController.h"

@interface RLMBrowserObjectListContainerViewController ()

// The Realm file, and schema that will be shown in this controller
@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) NSError *realmError;

// The segmented control in charge of toggling between 'list' and 'schema' mode
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

// The currently visible view controller
@property (nonatomic, weak) UIViewController *visibleViewController;

// The list and schema view controllers that this container manages
@property (nonatomic, strong) RLMBrowserObjectListViewController   *listViewController;
@property (nonatomic, strong) RLMBrowserObjectSchemaViewController *schemaViewController;

- (void)segmentedControlChanged:(id)sender;
- (void)setVisibleViewControllerForSegmentedIndex:(NSInteger)index;
- (void)showErrorWithTitle:(NSString *)title description:(NSString *)description;

@end

@implementation RLMBrowserObjectListContainerViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema
{
    if (self = [super init]) {
        _browserRealm = realm;
        _browserSchema = schema;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // View configuration
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Load the Realm
    NSError *error = nil;
    self.realm = [RLMRealm realmWithConfiguration:self.browserRealm.realmConfiguration error:&error];
    if (self.realm == nil) {
        self.realmError = error; // Save the error and we'll display it later
        return;
    }
    
    // Set up the two child controllers we'll toggle between
    self.listViewController = [[RLMBrowserObjectListViewController alloc] initWithBrowserRealm:self.browserRealm browserSchema:self.browserSchema];
    self.schemaViewController = [[RLMBrowserObjectSchemaViewController alloc] initWithBrowserRealm:self.browserRealm browserSchema:self.browserSchema];
    
    // Set up the toggle segmented control
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Objects", @"Schema"]];
    [self.segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.frame = (CGRect){0, 0, 240.0f, 30.0f};
    self.segmentedControl.selectedSegmentIndex = 0;
    UIBarButtonItem *segmentedControlbarItem = [[UIBarButtonItem alloc] initWithCustomView:self.segmentedControl];
    
    // Set up the tool bar
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems: @[spaceItem, segmentedControlbarItem, spaceItem] animated:YES];
    
    // Add the initial child view controller
    [self setVisibleViewControllerForSegmentedIndex:0];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Show an error if Realm couldn't be opened
    if (self.realmError) {
        [self showErrorWithTitle:@"Couldn't open Realm" description:self.realmError.localizedDescription];
        return;
    }
    
    [self.navigationController setToolbarHidden:NO animated:animated];
}

#pragma mark - Visible Controller Management -
- (void)segmentedControlChanged:(id)sender
{
    [self setVisibleViewControllerForSegmentedIndex:self.segmentedControl.selectedSegmentIndex];
    
    // Force the navigation bar to re-apply its translucent content insets
    self.navigationController.toolbarHidden = YES;
    self.navigationController.toolbarHidden = NO;
}

- (void)setVisibleViewControllerForSegmentedIndex:(NSInteger)index
{
    UIViewController *targetController = (index > 0) ? self.schemaViewController : self.listViewController;
    if (self.visibleViewController == targetController) {
        return;
    }
    
    // Clean out any children controllers
    for (UIViewController *childController in self.childViewControllers) {
        [childController willMoveToParentViewController:nil];
        [childController removeFromParentViewController];
        [childController.view removeFromSuperview];
    }
    
    // Add the view to our view
    targetController.view.frame = self.view.bounds;
    [self.view addSubview:targetController.view];
    
    // Add the new controller
    [self addChildViewController:targetController];
    [targetController didMoveToParentViewController:self];

    // Change our title to match the new controller's title
    self.title = targetController.title;
    
    // Forward along any custom title views
    self.navigationItem.titleView = targetController.navigationItem.titleView;
    
    // Hang on to a local reference of this controller
    self.visibleViewController = targetController;
}

#pragma mark - Error Handling -
- (void)showErrorWithTitle:(NSString *)title description:(NSString *)description
{
    UIAlertController *errorAlertController = [UIAlertController alertControllerWithTitle:title
                                                                                  message:description
                                                                           preferredStyle:UIAlertControllerStyleAlert];
    
    id closeHandler = ^(UIPreviewAction *action, UIViewController *previewViewController) {
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    [errorAlertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:closeHandler]];
    [self presentViewController:errorAlertController animated:YES completion:nil];
}

@end
