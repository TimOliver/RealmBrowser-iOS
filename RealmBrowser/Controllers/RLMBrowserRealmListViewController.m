//
//  RLMBrowserRealmsViewControllerTableViewController.m
//
//  Copyright 2016-2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <TOSplitViewController/TOSplitViewController.h>
#import <TODocumentPickerViewController/TODocumentPickerViewController.h>
#import <TODocumentPickerViewController/TODocumentPickerLocalDiskDataSource.h>

#import "RLMBrowserRealmListViewController.h"

#import "RLMBrowserConstants.h"
#import "RLMBrowserList.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserConfiguration.h"
#import "RLMBrowserTableHeaderView.h"
#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserObjectViewController.h"
#import "RLMBrowserRealmTableViewCell.h"
#import "RLMBrowserSchemaTableViewCell.h"
#import "RLMRealmLogoView.h"
#import "RLMRealmMonochromeLogoView.h"
#import "UIImage+BrowserIcons.h"
#import "UIColor+BrowserRealmColors.h"
#import "UILabel+RealmBrowser.h"
#import "RLMBrowserRealmTableCellHeaderView.h"
#import "RLMBrowserRealmTableViewController.h"

// -----------------------------------------------------------------------

NSString * const kRLMBrowserRealmTableViewCellIdentifier = @"RealmTableCell";
NSString * const kRLMBrowserSchemaTableViewCellIdentifier = @"SchemaTableCell";

@interface RLMBrowserRealmListViewController ()

/* The master Realm object that controls the groups of Realm objects */
@property (nonatomic, strong) RLMBrowserList *realmList;

@property (nonatomic, strong) RLMBrowserRealm *defaultRealm;
@property (nonatomic, strong) RLMArray<RLMBrowserRealm *> *starredRealms;
@property (nonatomic, strong) RLMResults<RLMBrowserRealm *> *filteredRealms;

@property (nonatomic, strong) UIImage *localRealmIcon;
@property (nonatomic, strong) UIImage *syncRealmIcon;
@property (nonatomic, strong) UIImage *inMemoryRealmIcon;
@property (nonatomic, strong) UIImage *encryptedIcon;

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *lightColors;
@property (nonatomic, strong) UIImage *circleIcon;

@property (nonatomic, strong) RLMNotificationToken *starredRealmsToken;
@property (nonatomic, strong) RLMNotificationToken *allRealmsToken;

@end

// -----------------------------------------------------------------------

@implementation RLMBrowserRealmListViewController

- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {

    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) weakSelf = self;

    // Configure the title view
    self.title = @"Realms";
    self.navigationItem.titleView = [[RLMRealmLogoView alloc] initWithFrame:(CGRect){0,0,30,30}];

    RLM_RESET_NAVIGATION_CONTROLLER(self.navigationController);

    // Set a monochrome logo to be the back button
    RLMRealmMonochromeLogoView *logoView = [[RLMRealmMonochromeLogoView alloc] initWithFrame:(CGRect){0,0,25,25}];
    logoView.strokeWidth = 1.0f;
    UIImage *image = [logoView imageInRect:(CGRect){0, 4, 20, 20}];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.navigationItem.backBarButtonItem = item;

    // Get the icons for the table view cells
    self.localRealmIcon = [UIImage RLMBrowser_localRealmIcon];
    self.inMemoryRealmIcon = [UIImage RLMBrowser_inMemoryRealmIcon];
    self.syncRealmIcon = [UIImage RLMBrowser_inMemoryRealmIcon];

    self.encryptedIcon = [UIImage RLMBrowser_encryptedIcon];

    // Set up the results objects we'll align with the table view
    RLMRealm *realm = [RLMRealm realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
    self.realmList = [RLMBrowserList defaultListInRealm:realm];
    
    self.defaultRealm = self.realmList.defaultRealm;
    self.starredRealms = self.realmList.starredRealms;
    self.filteredRealms = [self.realmList.allRealms objectsWhere:@"(self.uuid != %@)", self.defaultRealm.uuid];

    self.allRealmsToken = [self.filteredRealms addNotificationBlock:^(RLMResults<RLMBrowserRealm *> *results, RLMCollectionChange *changes, NSError *error) {
        if (error) { return; }

        UITableView *tableView = weakSelf.tableView;

        // Animate cross fade
        UIView *screenshot = [tableView snapshotViewAfterScreenUpdates:NO];
        screenshot.frame = tableView.frame;
        [tableView.superview addSubview:screenshot];

        [weakSelf.tableView reloadData];

        [UIView animateWithDuration:0.3f animations:^{
            screenshot.alpha = 0.0f;
        } completion:^(BOOL complete) {
            [screenshot removeFromSuperview];
        }];
    }];
    
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    // Register the table cells
    UINib *realmTableCellNib = [UINib nibWithNibName:@"RLMBrowserRealmTableViewCell" bundle:bundle];
    [self.tableView registerNib:realmTableCellNib forCellReuseIdentifier:kRLMBrowserRealmTableViewCellIdentifier];

    UINib *schemaTableCellNib = [UINib nibWithNibName:@"RLMBrowserSchemaTableViewCell" bundle:bundle];
    [self.tableView registerNib:schemaTableCellNib forCellReuseIdentifier:kRLMBrowserSchemaTableViewCellIdentifier];

    self.lightColors = [[[UIColor RLMBrowser_realmColorsLight] reverseObjectEnumerator] allObjects];
    self.colors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];
    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:12.0f];

    // Configure the tool bar
    NSInteger numberOfRealms = self.realmList.allRealms.count;

    NSString *text = [NSString stringWithFormat:@"%ld Realm Database%@", numberOfRealms, numberOfRealms == 1 ? @"" : @"s"];
    UILabel *objectsLabel = [UILabel RLMBrowser_toolbarLabelWithText:text];
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:objectsLabel];

    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //UIBarButtonItem *fileManagerButton = [[UIBarButtonItem alloc] initWithTitle:@"Files" style:UIBarButtonItemStylePlain target:self action:@selector(filesButtonTapped:)];
    self.toolbarItems = @[flexibleSpaceItem, labelItem, flexibleSpaceItem/*, fileManagerButton*/];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:animated];
}

#pragma mark - Button Callbacks -
- (void)filesButtonTapped:(id)sender
{
    TODocumentPickerLocalDiskDataSource *dataSource = [[TODocumentPickerLocalDiskDataSource alloc] init];
    dataSource.rootFolderName = @"Realm Browser"; //TODO: Change to parent app

    TODocumentPickerViewController *filesController = [[TODocumentPickerViewController alloc] initWithFilePath:nil];
    filesController.dataSource = dataSource;

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:filesController];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:navigationController animated:YES completion:nil];
    RLM_RESET_NAVIGATION_CONTROLLER(navigationController);
}

#pragma mark - Data Handling -

- (RLMBrowserRealm *)itemForSection:(NSInteger)index
{
    // Easiest is to return the default Realm
    if (self.defaultRealm && index == 0) {
        return self.defaultRealm;
    }
    
    // Account for the offset the default Realm produces
    NSInteger offset = self.defaultRealm ? 1 : 0;
    
    // If there are any starred Realms, check if the index is in that range
    if (self.starredRealms.count && index - offset < self.starredRealms.count) {
        return self.starredRealms[index - offset];
    }
    
    // Account for the starred Realms offset
    offset += self.starredRealms.count;
    
    // Ensure we don't try and access an empty array
    if (self.filteredRealms.count == 0) {
        return nil;
    }
    
    return self.filteredRealms[index - offset];
}

- (void)updateTableViewWithOffset:(NSInteger)offset changes:(RLMCollectionChange *)changes
{
    UITableView *tableView = self.tableView;
    [tableView beginUpdates];

    for (NSNumber *deletion in changes.deletions) {
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:deletion.integerValue + offset] withRowAnimation:UITableViewRowAnimationFade];
    }

    for (NSNumber *insertion in changes.insertions) {
        [tableView insertSections:[NSIndexSet indexSetWithIndex:insertion.integerValue + offset] withRowAnimation:UITableViewRowAnimationFade];
    }

    for (NSNumber *modification in changes.modifications) {
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:modification.integerValue + offset] withRowAnimation:UITableViewRowAnimationFade];
    }

    [tableView endUpdates];
}

#pragma mark - Toggle Visible Realms -
- (void)toggleRealmSectionProperty:(NSString *)propertyName
{
    BOOL propertyValue = [self.realmList[propertyName] boolValue];
    [self.realmList.realm transactionWithBlock:^{
        self.realmList[propertyName] = @(!propertyValue);
    }];
}

- (void)setDefaultRealmSectionHidden:(BOOL)hidden
{
    if (!self.defaultRealm) { return; }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)setStarredRealmSectionHidden:(BOOL)hidden
{
    // Compute which section is the first of the starred Realms
    NSInteger section = 0;
    if (self.defaultRealm) { section += 1; }

    NSInteger numberOfSections = self.starredRealms.count;
    [self.tableView beginUpdates];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    for (NSInteger i = 1; i < numberOfSections; i++) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section + i];
        if (hidden) {
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    [self.tableView endUpdates];
}

- (void)setAllRealmSectionHidden:(BOOL)hidden
{
    // Compute which section is the first of all of the Realms
    NSInteger section = 0;
    if (self.defaultRealm) { section += 1; }
    if (self.starredRealms.count) {
        section += self.realmList.starredRealmsCollapsed ? 1 : self.starredRealms.count;
    }

    NSInteger numberOfSections = self.filteredRealms.count;
    [self.tableView beginUpdates];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    for (NSInteger i = 1; i < numberOfSections; i++) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section + i];
        if (hidden) {
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    [self.tableView endUpdates];
}

#pragma mark - Table View Delegate -

- (BOOL)sectionHasTitleAtIndex:(NSInteger)section
{
    if (section == 0 && (self.defaultRealm || self.starredRealms.count > 0)) { return YES; }
    if (section == 1 && self.defaultRealm) { return YES; }

    NSInteger numberOfRealmSections = 0;
    numberOfRealmSections += self.defaultRealm ? 1 : 0;
    numberOfRealmSections += self.starredRealms.count;

    if (section == numberOfRealmSections) { return YES; }

    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self sectionHasTitleAtIndex:section]) {
        return 44.0f;
    }

    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *identifier = @"HeaderView";

    if (![self sectionHasTitleAtIndex:section]) {
        return nil;
    }

    __weak typeof(self) weakSelf = self;

    RLMBrowserRealmTableCellHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (headerView == nil) {
        headerView = [[RLMBrowserRealmTableCellHeaderView alloc] initWithReuseIdentifier:identifier];
    }

    if (self.defaultRealm && section == 0) {
        headerView.titleLabel.text = @"DEFAULT REALM";
        headerView.collapsed = self.realmList.defaultRealmCollapsed;
        headerView.collapseToggledHandler = ^{
            [weakSelf toggleRealmSectionProperty:@"defaultRealmCollapsed"];
            [weakSelf setDefaultRealmSectionHidden:self.realmList.defaultRealmCollapsed];
        };
    }
    else if (self.starredRealms.count > 0 && ((!self.defaultRealm && section == 0) || section == 1)) {
        headerView.titleLabel.text = @"FAVORITE REALMS";
        headerView.collapsed = self.realmList.starredRealmsCollapsed;
        headerView.collapseToggledHandler = ^{
            [weakSelf toggleRealmSectionProperty:@"starredRealmsCollapsed"];
            [weakSelf setStarredRealmSectionHidden:weakSelf.realmList.starredRealmsCollapsed];
        };
    }
    else {
        headerView.titleLabel.text = @"REALMS";
        headerView.collapsed = self.realmList.allRealmsCollapsed;
        headerView.collapseToggledHandler = ^{
            [weakSelf toggleRealmSectionProperty:@"allRealmsCollapsed"];
            [weakSelf setAllRealmSectionHidden:weakSelf.realmList.allRealmsCollapsed];
        };
    }

    return headerView;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numberOfSections = 0;
    
    if (self.defaultRealm) { numberOfSections += 1; }

    // Return 1 section if it's collapsed

    // Favorite Realms
    if (self.starredRealms.count) {
        numberOfSections += self.realmList.starredRealmsCollapsed ? 1 : self.starredRealms.count;
    }

    // All Realms (Sans the ones above)
    if (self.filteredRealms.count) {
        numberOfSections += self.realmList.allRealmsCollapsed ? 1 : self.filteredRealms.count;
    }
    
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RLMBrowserRealm *item = [self itemForSection:section];

    // If it's the first object in a collapsed section, return 0, so just the header is visible
    if ([item isEqual:self.defaultRealm] && self.realmList.defaultRealmCollapsed) { return 0; }
    if ([item isEqual:self.starredRealms.firstObject] && self.realmList.starredRealmsCollapsed) { return 0; }
    if ([item isEqual:self.filteredRealms.firstObject] && self.realmList.allRealmsCollapsed) { return 0; }

    // Return the Realm entry, and each schema
    return 1 + [self itemForSection:section].schema.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 0 ? 64.0f : 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = nil;
    RLMBrowserRealm *realm = [self itemForSection:indexPath.section];

    // The first section is the Realm itself
    if (indexPath.row == 0) {
        RLMBrowserRealmTableViewCell *realmCell = [self.tableView dequeueReusableCellWithIdentifier:kRLMBrowserRealmTableViewCellIdentifier forIndexPath:indexPath];
        realmCell.selectedBackgroundColor = self.lightColors[(NSInteger)(self.lightColors.count / 2.0f)];
        realmCell.titleLabel.text = realm.name;
        realmCell.imageView.image = self.localRealmIcon;
        realmCell.subtitleLabel.text = realm.formattedLocation;
        realmCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell = (UITableViewCell *)realmCell;
    }
    else { // Remaining rows are schema objects in the Realm
        NSInteger index = indexPath.row-1;
        RLMBrowserSchemaTableViewCell *schemaCell = [self.tableView dequeueReusableCellWithIdentifier:kRLMBrowserSchemaTableViewCellIdentifier forIndexPath:indexPath];
        RLMBrowserSchema *schema = realm.schema[index];
        schemaCell.titleLabel.text = schema.className;
        schemaCell.selectedBackgroundColor = self.lightColors[index % (self.colors.count-1)];
        schemaCell.imageView.image = self.circleIcon;
        schemaCell.imageView.tintColor = self.colors[index % (self.colors.count-1)];
        schemaCell.subtitleLabel.text = [NSString stringWithFormat:@"%ld", (long)schema.numberOfObjects];
        schemaCell.indentationWidth = 54.0f;
        schemaCell.indentationLevel = 1;
        schemaCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell = (UITableViewCell *)schemaCell;
    }

    cell.indentationWidth = 54.0f;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLMBrowserRealm *realm = [self itemForSection:indexPath.section];
    
    // The user tapped a schema row
    if (indexPath.row > 0) {
        RLMBrowserSchema *schema = realm.schema[indexPath.row - 1];
        RLMBrowserObjectListViewController *controller = [[RLMBrowserObjectListViewController alloc] initWithBrowserRealm:realm browserSchema:schema];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        [self to_showSecondaryViewController:navigationController sender:self];
        RLM_RESET_NAVIGATION_CONTROLLER(navigationController);
    }
    else {
        RLMBrowserRealmTableViewController *controller = [[RLMBrowserRealmTableViewController alloc] initWithBrowserRealm:realm browserList:self.realmList];
        controller.isDefaultRealm = [realm isEqual:self.defaultRealm];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        [self to_showSecondaryViewController:nil sender:self];
        [self to_showDetailViewController:navigationController sender:self];
        RLM_RESET_NAVIGATION_CONTROLLER(navigationController);
    }
}

@end
