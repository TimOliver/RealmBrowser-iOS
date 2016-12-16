//
//  RLMBrowserObjectSchemaViewController.m
//  RealmBrowser
//
//  Created by Tim Oliver on 12/4/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

#import "RLMBrowserObjectSchemaViewController.h"

// Categories
#import "RLMProperty+BrowserDescription.h"
#import "UIImage+BrowserIcons.h"
#import "UIColor+BrowserRealmColors.h"

// Realm Model Objects
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

// Views
#import "RLMBrowserPropertyTableViewCell.h"
#import "RLMBrowserNavigationTitleView.h"
#import "RLMBrowserSchemaPreviewView.h"

// ------------------------------------------------------------------

NSString * const kRLMBrowserObjectSchemaTableViewCellIdentifier = @"ObjectListCell";

// ------------------------------------------------------------------

@interface RLMBrowserObjectSchemaViewController () <UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) RLMBrowserNavigationTitleView *titleView;
@property (nonatomic, strong) UINavigationBar *segmentedControlBar;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) RLMBrowserRealm  *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;

@property (nonatomic, strong) UIImage *circleIcon;
@property (nonatomic, strong) NSArray *realmColors;

@property (nonatomic, strong) RLMBrowserSchemaPreviewView *previewView;

@end

// ------------------------------------------------------------------

@implementation RLMBrowserObjectSchemaViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _browserRealm = realm;
        _browserSchema = schema;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.presentationController.delegate = self;
    self.tableView.rowHeight = 50.0f;
    
    // Configure table cell
    UINib *tableNib = [UINib nibWithNibName:@"RLMBrowserPropertyTableViewCell" bundle:nil];
    [self.tableView registerNib:tableNib forCellReuseIdentifier:kRLMBrowserObjectSchemaTableViewCellIdentifier];
    
    // Load Realm and the schema
    self.realm = [RLMRealm realmWithConfiguration:self.browserRealm.realmConfiguration error:nil];
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    
    // Set up the header for this view controller
    self.titleView = [[RLMBrowserNavigationTitleView alloc] init];
    self.titleView.titleLabel.text = self.browserSchema.className;
    
    // Configure header view
    self.titleView.subtitleLabel.text = @"Choose Visible Properties";
    [self.titleView sizeToFit];
    self.navigationItem.titleView = self.titleView;
    
    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:12.0f];
    self.realmColors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];
    
    // Add Done button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonTapped:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    //Set up secondary bar
    UIView *container = [[UIView alloc] initWithFrame:(CGRect){0,0,320,44}];
    self.segmentedControlBar = [[UINavigationBar alloc] initWithFrame:container.bounds];
    self.segmentedControlBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [container addSubview:self.segmentedControlBar];
    self.tableView.tableHeaderView = container;
    
    // Add segment control to bar
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Primary", @"Secondary"]];
    self.segmentedControl.frame = (CGRect){0,0, 290.0f, self.segmentedControl.frame.size.height};
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
                                                | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.segmentedControl.center = self.segmentedControlBar.center;
    [self.segmentedControlBar addSubview:self.segmentedControl];
    
    // Create preview view
    self.previewView = [RLMBrowserSchemaPreviewView contentView];
    container = [[UIView alloc] initWithFrame:self.previewView.bounds];
    [container addSubview:self.previewView];
    self.tableView.tableFooterView = container;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.segmentedControl.selectedSegmentIndex = 0;
}

#pragma mark - Presentation Management -
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationFullScreen;
}

#pragma mark - Button Callback -
- (void)doneButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Content View Handling -

- (void)layoutAccessoryViews
{
    UIScrollView *scrollView = self.tableView;
    
    CGRect frame = self.segmentedControlBar.frame;
    frame.origin.y = scrollView.contentOffset.y + scrollView.contentInset.top;
    self.segmentedControlBar.frame = frame;
    [scrollView bringSubviewToFront:self.segmentedControlBar.superview];
    
    CGFloat yOffset = self.previewView.superview.frame.origin.y;
    frame = self.previewView.frame;
    frame.origin.y = scrollView.contentOffset.y + (scrollView.frame.size.height - frame.size.height);
    frame.origin.y -= yOffset;
    self.previewView.frame = frame;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self layoutAccessoryViews];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self layoutAccessoryViews];
}

#pragma mark - Table View Data Source -

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.schema.properties.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLMBrowserPropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectSchemaTableViewCellIdentifier];

    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    RLMProperty *property = self.schema.properties[indexPath.row];
    cell.iconView.image = self.circleIcon;
    cell.iconView.tintColor = self.realmColors[indexPath.row % self.realmColors.count];
    cell.titleLabel.text = property.name;
    cell.subtitleLabel.text = property.RLMBrowser_configurationDescription;
    cell.typeLabel.text = property.RLMBrowser_typeDescription;
    return cell;
}

@end
