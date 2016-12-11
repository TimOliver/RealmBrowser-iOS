//
//  RLMBrowserRealmsViewControllerTableViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserTableHeaderView.h"
#import "RLMBrowserNavigationTitleView.h"
#import "RLMBrowserObjectViewController.h"

#import "RLMBrowserObjectListTableViewCell.h"
#import "UIColor+BrowserRealmColors.h"

#import <Realm/Realm.h>
#import <Realm/RLMRealm_Dynamic.h>

// ------------------------------------------------------------------

NSString * const kRLMBrowserObjectListTableViewCellIdentifier = @"ObjectListCell";

// ------------------------------------------------------------------

@interface RLMBrowserObjectListViewController()

@property (nonatomic, strong) RLMBrowserTableHeaderView *tableHeaderView;
@property (nonatomic, strong) RLMBrowserNavigationTitleView *titleView;

@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;
@property (nonatomic, strong) RLMResults *objects;

@property (nonatomic, strong) RLMProperty *preferredProperty;

@property (nonatomic, strong) NSArray *realmColors;

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
 
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Set up the header for this view controller
    self.titleView = [[RLMBrowserNavigationTitleView alloc] init];
    self.titleView.titleLabel.text = self.browserSchema.className;
    
    // Set the custom NIB as the default table view cell
    UINib *nib = [UINib nibWithNibName:@"RLMBrowserObjectListTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
    
    // Set the title as the schema name
    self.title = self.browserSchema.className;
    
    // Set up the header search bar
    self.tableHeaderView = [[RLMBrowserTableHeaderView alloc] init];
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    // Load the Realm file
    self.realm = [RLMRealm realmWithConfiguration:self.browserRealm.realmConfiguration error:nil];
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    
    // Use the dynamic API to pull all objects from the Realm for this schema
    self.objects = [self.realm allObjects:self.browserSchema.className];
    
    // Calculate the most appropriate property to initially display
    self.preferredProperty = [self determineBestDisplayedPropertyWithSchema:self.schema
                                                              preferredName:self.browserSchema.preferredPropertyName];
    
    self.titleView.subtitleLabel.text = [NSString stringWithFormat:@"%ld Object%@", self.objects.count, self.objects.count == 1 ? @"" : @"s"];
    [self.titleView sizeToFit];

    self.navigationItem.titleView = self.titleView;
    
    self.realmColors = [UIColor RLMBrowser_realmColorsInvertedRepeating];
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

- (RLMProperty *)determineBestDisplayedPropertyWithSchema:(RLMObjectSchema *)schema preferredName:(NSString *)preferredName
{
    // If the user has specifically specified a valid property, use that
    if (schema[preferredName]) {
        return schema[preferredName];
    }
    
    // If a property hasn't been picked yet, search for the first string that doesn't include 'ID' in it
    for (RLMProperty *property in schema.properties) {
        // Skip if not a string
        if (property.type != RLMPropertyTypeString) {
            continue;
        }
        // Skip if it contains 'ID'
        if ([property.name rangeOfString:@"ID" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            continue;
        }
        
        return property;
    }
    
    // If all else fails, default to the first property
    return schema.properties.firstObject;
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
    BOOL collapsed = (self.splitViewController.isCollapsed);
    cell.accessoryType = !collapsed ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RLMBrowserObjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];

    // Get the object
    RLMObject *object = self.objects[indexPath.row];
    id value = object[self.preferredProperty.name];
    
    if (value) {
        cell.titleLabel.textColor = [UIColor blackColor];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@", value];
    }
    else {
        cell.titleLabel.textColor = [UIColor grayColor];
        cell.titleLabel.text = @"NULL";
    }
    
    cell.subtitleLabel.text = @"UserId: 1 • Email: info@realm.io • Address: 148 Townsend";
    
    cell.indexLabel.text = [NSString stringWithFormat:@"%ld", [self.objects indexOfObject:object] + 1];
    cell.indexLabel.textColor = self.realmColors[indexPath.row % self.realmColors.count];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLMObject *object = self.objects[indexPath.row];
    RLMBrowserObjectViewController *objectController = [[RLMBrowserObjectViewController alloc] initWithObject:object];
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:objectController];
    [self.splitViewController showDetailViewController:controller sender:self];
}

@end
