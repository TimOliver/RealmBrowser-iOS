//
//  RLMBrowserRealmsViewControllerTableViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <TOSplitViewController/TOSplitViewController.h>

#import "RLMBrowserConstants.h"
#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserTableHeaderView.h"
#import "RLMBrowserNavigationTitleView.h"
#import "RLMRealmMonochromeLogoView.h"
#import "RLMBrowserRealmTableViewCell.h"

#import "RLMBrowserObjectViewController.h"
#import "RLMBrowserObjectSchemaViewController.h"

#import "RLMBrowserObjectListContentView.h"
#import "UIColor+BrowserRealmColors.h"
#import "UIImage+BrowserIcons.h"
#import "UILabel+RealmBrowser.h"
#import "RLMRealm+BrowserCaptureRealms.h"

#import <Realm/Realm.h>
#import <Realm/RLMRealm_Dynamic.h>

// ------------------------------------------------------------------

NSString * const kRLMBrowserObjectListTableViewCellIdentifier = @"ObjectListCell";
NSInteger const kRLMBrowserObjectListViewTag = 101;

// ------------------------------------------------------------------

@interface RLMBrowserObjectListViewController()

@property (nonatomic, strong) RLMBrowserTableHeaderView *tableHeaderView;

@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;
@property (nonatomic, strong) RLMResults *objects;

@property (nonatomic, strong) NSString *preferredPropertyName;
@property (nonatomic, strong) RLMArray *preferredSecondaryPropertyNames;

@property (nonatomic, strong) NSArray *realmColors;
@property (nonatomic, strong) NSArray *lightRealmColors;

@end

// ------------------------------------------------------------------

@implementation RLMBrowserObjectListViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema
{
    if (self = [super init]) {
        _browserRealm = realm;
        _browserSchema = schema;
    }
    
    return self;
}

#pragma mark - View Creation -

- (void)viewDidLoad {
    [super viewDidLoad];

    RLM_RESET_NAVIGATION_CONTROLLER(self.navigationController);

    // Set default settings
    self.clearsSelectionOnViewWillAppear = YES;
    self.tableView.rowHeight = 64.0f;
    self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 35.0f, 0.0f, 0.0f);
    
    // Set the title as the schema name
    self.title = self.browserSchema.className;
    
    // Set up the header search bar
    self.tableHeaderView = [[RLMBrowserTableHeaderView alloc] init];
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    // Load the Realm file
    self.realm = [RLMRealm RLMBrowser_realmWithConfiguration:self.browserRealm.realmConfiguration error:nil];
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    
    // Use the dynamic API to pull all objects from the Realm for this schema
    self.objects = [self.realm allObjects:self.browserSchema.className];
    
    // Calculate the most appropriate property to initially display
    self.preferredPropertyName = self.browserSchema.preferredPropertyName;
    self.preferredSecondaryPropertyNames = self.browserSchema.secondaryPropertyNames;

    // Get Realm colours to theme the numbers
    self.realmColors = [UIColor RLMBrowser_realmColorsInvertedRepeating];
    self.lightRealmColors = [UIColor RLMBrowser_realmColorsLightInvertedRepeating];

    // Set up the toolbar content
    UIImage *tweaksIcon = [UIImage RLMBrowser_tweaksIcon];
    UIBarButtonItem *tweaksButton = [[UIBarButtonItem alloc] initWithImage:tweaksIcon style:UIBarButtonItemStylePlain target:self action:@selector(tweaksButtonTapped:)];

    NSString *text = [NSString stringWithFormat:@"%ld Object%@", self.objects.count, self.objects.count == 1 ? @"" : @"s"];
    UILabel *objectsLabel = [UILabel RLMBrowser_toolbarLabelWithText:text];
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:objectsLabel];
    
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems = @[flexibleSpaceItem, labelItem, flexibleSpaceItem, tweaksButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Add a notification for when the split view controller will collapse or expand
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(splitViewControllerDetailStateChanged:)
                                                 name:UIViewControllerShowDetailTargetDidChangeNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Remove the split view controller notification observer
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIViewControllerShowDetailTargetDidChangeNotification object:nil];
}

#pragma mark - Notifications -
- (void)splitViewControllerDetailStateChanged:(NSNotification *)notification
{
    // Loop through each visible cell and update it for the current split controller state
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [self tableView:self.tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

- (void)tweaksButtonTapped:(id)sender
{
    RLMBrowserObjectSchemaViewController *controller = [[RLMBrowserObjectSchemaViewController alloc] initWithBrowserRealm:self.browserRealm browserSchema:self.browserSchema];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    navigationController.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popoverController = navigationController.popoverPresentationController;
    popoverController.barButtonItem = sender;
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If we're not in ultra-compact iPhone mode, hide the disclosure indidcator
    BOOL collapsed = (self.to_splitViewController.visibleViewControllers.count == 1);
    cell.accessoryType = !collapsed ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;

    RLMBrowserObjectListContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectListViewTag];
    if (cell.accessoryType != UITableViewCellAccessoryDisclosureIndicator) {
        CGRect frame = cell.contentView.bounds;
        frame.size.width -= 20.0f;
        contentView.frame = frame;
    }
    else {
        contentView.frame = cell.contentView.bounds;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RLMBrowserRealmTableViewCell *cell = (RLMBrowserRealmTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[RLMBrowserRealmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
        
        RLMBrowserObjectListContentView *contentView = [RLMBrowserObjectListContentView objectListContentView];
        contentView.tag = kRLMBrowserObjectListViewTag;
        contentView.frame = cell.contentView.bounds;
        [cell.contentView addSubview:contentView];
    }
    
    RLMBrowserObjectListContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectListViewTag];
    
    // Get the object
    RLMObject *object = self.objects[indexPath.row];
    id value = object[self.preferredPropertyName];
    
    if ([value description].length) {
        contentView.titleLabel.hidden = NO;
        contentView.nilLabel.hidden = YES;
        contentView.titleLabel.text = [NSString stringWithFormat:@"%@", value];
    }
    else {
        contentView.titleLabel.hidden = YES;
        contentView.nilLabel.hidden = NO;
    }
    
    NSString *subtitle = @"";
    if (self.preferredSecondaryPropertyNames.count) {
        for (RLMBrowserObjectProperty *propertyName in self.preferredSecondaryPropertyNames) {
            NSString *propertyValue = [object[propertyName.name] description];
            subtitle = [subtitle stringByAppendingFormat:@"%@: %@", propertyName.name, propertyValue];
            
            if (propertyName != self.preferredSecondaryPropertyNames.lastObject) {
                subtitle = [subtitle stringByAppendingString:@" • "];
            }
        }
    }
    else {
        subtitle = @"Realm Object";
    }
    
    contentView.subtitleLabel.text = subtitle;
    
    contentView.indexLabel.text = [NSString stringWithFormat:@"%ld", [self.objects indexOfObject:object] + 1];
    contentView.indexLabel.textColor = self.realmColors[indexPath.row % self.realmColors.count];

    cell.selectedBackgroundColor = self.lightRealmColors[indexPath.row % self.realmColors.count];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLMObject *object = self.objects[indexPath.row];
    RLMBrowserObjectViewController *objectController = [[RLMBrowserObjectViewController alloc] initWithObject:object
                                                                                              forBrowserRealm:self.browserRealm
                                                                                                browserSchema:self.browserSchema];
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:objectController];
    [self to_showDetailViewController:controller sender:self];
}

@end
