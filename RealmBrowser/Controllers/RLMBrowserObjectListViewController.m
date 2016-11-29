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

#import "RLMBrowserObjectListTableViewCell.h"

#import <Realm/Realm.h>
#import <Realm/RLMRealm_Dynamic.h>

 NSString * const kRLMBrowserTableViewCellIdentifier = @"ObjectListCell";

@interface RLMBrowserObjectListViewController()

@property (nonatomic, strong) RLMBrowserTableHeaderView *tableHeaderView;
@property (nonatomic, strong) RLMBrowserNavigationTitleView *titleView;

@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;
@property (nonatomic, strong) RLMResults *objects;

@property (nonatomic, strong) RLMProperty *preferredProperty;

/* Realm */
- (BOOL)setUpRealm;
- (RLMRealm *)openRealmForBrowserRealm:(RLMBrowserRealm *)browserRealm error:(NSError **)error;
- (RLMProperty *)determineBestDisplayedPropertyWithSchema:(RLMObjectSchema *)schema preferredName:(NSString *)preferredName;

/* Error Handling */
- (void)showErrorWithTitle:(NSString *)title description:(NSString *)description;

/* Callback Handling */
- (void)splitViewControllerDetailStateChanged:(NSNotification *)notification;

@end

@implementation RLMBrowserObjectListViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)browserRealm schema:(RLMBrowserSchema *)browserSchema
{
    if (self = [super init]) {
        _browserRealm = browserRealm;
        _browserSchema = browserSchema;
    }
    
    return self;
}

#pragma mark - View Creation -

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Set up the header for this view controller
    self.titleView = [[RLMBrowserNavigationTitleView alloc] init];
    self.titleView.titleLabel.text = self.browserSchema.className;
    
    // Set the custom NIB as the default table view cell
    UINib *nib = [UINib nibWithNibName:@"RLMBrowserObjectListTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:kRLMBrowserTableViewCellIdentifier];
    
    // Set the title as the schema name
    self.title = self.browserSchema.className;
    
    // Set up the header search bar
    self.tableHeaderView = [[RLMBrowserTableHeaderView alloc] init];
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    // Attempt to open the Realm file
    if ([self setUpRealm] == NO) {
        return;
    }
    
    // Use the dynamic API to pull all objects from the Realm for this schema
    self.objects = [self.realm allObjects:self.browserSchema.className];
    
    // Calculate the most appropriate property to initially display
    self.preferredProperty = [self determineBestDisplayedPropertyWithSchema:self.schema
                                                              preferredName:self.browserSchema.preferredPropertyName];
    
    self.titleView.subtitleLabel.text = [NSString stringWithFormat:@"%ld Object%@", self.objects.count, self.objects.count == 1 ? @"" : @"s"];
    [self.titleView sizeToFit];

    self.navigationItem.titleView = self.titleView;
    
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

#pragma mark - Realm Set-up -
- (BOOL)setUpRealm
{
    // Try to open the Realm file
    NSError *error = nil;
    self.realm = [self openRealmForBrowserRealm:self.browserRealm error:&error];
    if (error) {
        [self showErrorWithTitle:@"Unable to Open Realm" description:error.localizedDescription];
        return NO;
    }
    
    // Fetch the schema from the Realm file
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    if (self.schema == nil) {
        NSString *errorMessage = [NSString stringWithFormat:@"The schema '%@' wasn't in this Realm file.",
                                                                        self.browserSchema.className];
        [self showErrorWithTitle:@"Unable to Find Schema" description:errorMessage];
        return NO;
    }
    
    return YES;
}

- (RLMRealm *)openRealmForBrowserRealm:(RLMBrowserRealm *)browserRealm error:(NSError **)error
{
    RLMRealmConfiguration *configuration = [[RLMRealmConfiguration alloc] init];
    
    // Set the appropriate source for this Realm
    if (browserRealm.filePath.length) { // Standard on disk
        configuration.fileURL = [NSURL fileURLWithPath:browserRealm.absoluteFilePath];
    }
    else if (browserRealm.inMemoryIdentifier) { // In-Memory Realm
        configuration.inMemoryIdentifier = browserRealm.inMemoryIdentifier;
    }
    else if (browserRealm.syncURL) { // Remote sync Realm
        RLMSyncConfiguration *syncConfig = [[RLMSyncConfiguration alloc] initWithUser:[RLMSyncUser currentUser]
                                                            realmURL:[NSURL URLWithString:browserRealm.syncURL]];
        configuration.syncConfiguration = syncConfig;
    }
    
    configuration.encryptionKey = browserRealm.encryptionKey;
    configuration.readOnly = browserRealm.readOnly;
    [configuration setValue:@(YES) forKey:@"dynamic"];
    
    return [RLMRealm realmWithConfiguration:configuration error:error];
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
    
    RLMBrowserObjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserTableViewCellIdentifier];

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
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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
    [self showViewController:errorAlertController sender:self];
}

@end
