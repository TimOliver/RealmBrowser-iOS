//
//  RLMBrowserRealmsViewControllerTableViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <TOSplitViewController/TOSplitViewController.h>

#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserTableHeaderView.h"
#import "RLMBrowserNavigationTitleView.h"
#import "RLMBrowserObjectViewController.h"
#import "RLMBrowserObjectSchemaViewController.h"

#import "RLMBrowserObjectListContentView.h"
#import "UIColor+BrowserRealmColors.h"
#import "UIImage+BrowserIcons.h"

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
 
    // Set default settings
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.rowHeight = 54.0f;
    self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 35.0f, 0.0f, 0.0f);
    
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
    self.preferredPropertyName = self.browserSchema.preferredPropertyName;
    self.preferredSecondaryPropertyNames = self.browserSchema.secondaryPropertyNames;

    // Get Realm colours to theme the numbers
    self.realmColors = [UIColor RLMBrowser_realmColorsInvertedRepeating];
    
    // Set up the toolbar content
    UIImage *tweaksIcon = [UIImage RLMBrowser_tweaksIcon];
    UIBarButtonItem *tweaksButton = [[UIBarButtonItem alloc] initWithImage:tweaksIcon style:UIBarButtonItemStylePlain target:self action:@selector(tweaksButtonTapped:)];

    UILabel *objectsLabel = [[UILabel alloc] init];
    objectsLabel.font = [UIFont systemFontOfSize:11.0f];
    objectsLabel.textAlignment = NSTextAlignmentCenter;
    objectsLabel.text = [NSString stringWithFormat:@"%ld Object%@", self.objects.count, self.objects.count == 1 ? @"" : @"s"];
    [objectsLabel sizeToFit];
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:objectsLabel];
    
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[tweaksButton, flexibleSpaceItem, labelItem, flexibleSpaceItem];
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
    BOOL collapsed = (self.splitViewController.isCollapsed);
    cell.accessoryType = !collapsed ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
        
        RLMBrowserObjectListContentView *contentView = [RLMBrowserObjectListContentView objectListContentView];
        contentView.tag = kRLMBrowserObjectListViewTag;
        contentView.frame = cell.contentView.bounds;
        [cell.contentView addSubview:contentView];
    }
    
    RLMBrowserObjectListContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectListViewTag];
    
    // Get the object
    RLMObject *object = self.objects[indexPath.row];
    id value = object[self.preferredPropertyName];
    
    if (value) {
        contentView.titleLabel.textColor = [UIColor blackColor];
        contentView.titleLabel.text = [NSString stringWithFormat:@"%@", value];
    }
    else {
        contentView.titleLabel.textColor = [UIColor grayColor];
        contentView.titleLabel.text = @"NULL";
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
    
    contentView.subtitleLabel.text = subtitle;
    
    contentView.indexLabel.text = [NSString stringWithFormat:@"%ld", [self.objects indexOfObject:object] + 1];
    contentView.indexLabel.textColor = self.realmColors[indexPath.row % self.realmColors.count];
    
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
