//
//  RLMBrowserRealmsViewControllerTableViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserRealm.h"

#import <Realm/Realm.h>
#import <Realm/RLMRealm_Dynamic.h>

@interface RLMBrowserObjectListViewController()

@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;
@property (nonatomic, strong) RLMResults *objects;

- (RLMRealm *)openRealmForBrowserRealm:(RLMBrowserRealm *)browserRealm error:(NSError **)error;
- (RLMObjectSchema *)schemaInRealm:(RLMRealm *)realm forBrowserSchema:(RLMBrowserSchema *)browserSchema error:(NSError **)error;
- (void)showErrorWithTitle:(NSString *)title description:(NSString *)description;
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
 
    NSError *error = nil;
    
    // Try to open the Relam file
    self.realm = [self openRealmForBrowserRealm:self.browserRealm error:&error];
    if (error) {
        [self showErrorWithTitle:@"Unable to Open Realm" description:error.localizedDescription];
        return;
    }
    
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    self.objects = [self.realm allObjects:self.browserSchema.className];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(splitViewControllerDetailStateChanged:)
                                                 name:UIViewControllerShowDetailTargetDidChangeNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIViewControllerShowDetailTargetDidChangeNotification object:nil];
}

#pragma mark - Notifications -
- (void)splitViewControllerDetailStateChanged:(NSNotification *)notification
{
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [self tableView:self.tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

#pragma mark - Realm Set-up -
- (RLMRealm *)openRealmForBrowserRealm:(RLMBrowserRealm *)browserRealm error:(NSError **)error
{
    RLMRealmConfiguration *configuration = [[RLMRealmConfiguration alloc] init];
    
    // Set the appropriate target for this Realm
    if (browserRealm.filePath.length) {
        configuration.fileURL = [NSURL fileURLWithPath:browserRealm.absoluteFilePath];
    }
    else if (browserRealm.inMemoryIdentifier) {
        configuration.inMemoryIdentifier = browserRealm.inMemoryIdentifier;
    }
    else if (browserRealm.syncURL) {
        RLMSyncConfiguration *syncConfig = [[RLMSyncConfiguration alloc] initWithUser:[RLMSyncUser currentUser]
                                                            realmURL:[NSURL URLWithString:browserRealm.syncURL]];
        configuration.syncConfiguration = syncConfig;
    }
    
    configuration.encryptionKey = browserRealm.encryptionKey;
    configuration.readOnly = browserRealm.readOnly;
    [configuration setValue:@(YES) forKey:@"dynamic"];
    
    return [RLMRealm realmWithConfiguration:configuration error:error];
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
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    // Get the object
    RLMObject *object = self.objects[indexPath.row];
    RLMProperty *preferredProperty = nil;
    
    // Work out the proerty of the object we'll show
    // If we have a preferred property, defer to that
    if (self.browserSchema.preferredPropertyName.length) {
        preferredProperty = self.schema[self.browserSchema.preferredPropertyName];
    }
    
    // If a preferred property isn't set (or it was invalid), default to the first property
    if (!preferredProperty) {
        preferredProperty = self.schema.properties[0];
    }

    id value = object[preferredProperty.name];
    
    if (value) {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", value];
    }
    else {
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.text = @"NULL";
    }
    
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
    [errorAlertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    [self showViewController:errorAlertController sender:self];
}

@end
