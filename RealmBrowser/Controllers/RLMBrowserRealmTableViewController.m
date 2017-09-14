//
//  RLMBrowserRealmTableViewController.m
//  RealmBrowser
//
//  Created by Tim Oliver on 5/10/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserRealmTableViewController.h"
#import "TORoundedTableView.h"
#import "TORoundedTableViewCell.h"
#import "TORoundedTableViewCapCell.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserRealmHeaderView.h"
#import "UIImage+BrowserIcons.h"
#import "UIColor+BrowserRealmColors.h"
#import "RLMBrowserObjectContentView.h"
#import "UILabel+RealmBrowser.h"
#import "RLMBrowserList.h"
#import "RLMBrowserConfiguration.h"
#import "RLMRealm+BrowserCaptureRealms.h"
#import "RLMBrowserObjectSchemaViewController.h"

const NSInteger kRLMBrowserRealmViewTag = 101;

@interface RLMBrowserRealmTableViewController ()

@property (nonatomic, strong, readwrite) RLMBrowserList *browserList;
@property (nonatomic, strong, readwrite) RLMBrowserRealm *browserRealm;

@property (nonatomic, strong) UIImage *circleIcon;
@property (nonatomic, strong) NSArray *realmColors;

/* Calculated values for local Realms */
@property (nonatomic, strong) NSString *localFileSize;
@property (nonatomic, strong) NSString *localCreationDate;
@property (nonatomic, strong) NSString *localModificationDate;

/* Calculated Sync Values */
@property (nonatomic, strong) NSString *syncURL;
@property (nonatomic, strong) NSString *syncUserIdentifier;

/* Favorites Button Images */
@property (nonatomic, strong) UIImage *favoriteButtonImage;
@property (nonatomic, strong) UIImage *favoriteButtonFilledImage;
@property (nonatomic, strong) UIBarButtonItem *favoritesButton;

@end

@implementation RLMBrowserRealmTableViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserList:(RLMBrowserList *)list
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _browserRealm = realm;
        _browserList = list;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Generate Images
    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:15.0f];
    self.realmColors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];

    // Set up view controller default values
    self.title = self.browserRealm.name;
    self.tableView = [[TORoundedTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.rowHeight = 54.0f;

    RLMBrowserRealmHeaderView *headerView = [RLMBrowserRealmHeaderView headerView];
    headerView.titleLabel.text = self.browserRealm.name;
    headerView.subtitleLabel.text = self.browserRealm.localizedType;
    headerView.iconView.image = [self imageForType:self.browserRealm.type];
    self.tableView.tableHeaderView = headerView;

    [self precomputeRealmProperties];

    self.navigationController.toolbarHidden = NO;

    NSInteger numberOfObjectClasses = self.browserRealm.schema.count;
    NSString *text = [NSString stringWithFormat:@"%ld Object Class%@", numberOfObjectClasses, numberOfObjectClasses == 1 ? @"" : @"es"];
    UILabel *objectsLabel = [UILabel RLMBrowser_toolbarLabelWithText:text];
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:objectsLabel];

    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *fileManagerButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Export", @"") style:UIBarButtonItemStylePlain target:self action:@selector(actionButtonTapped:)];

    if (!self.isDefaultRealm) {
        self.favoriteButtonImage = [UIImage RLMBrowser_favoriteIconFilled:NO];
        self.favoriteButtonFilledImage = [UIImage RLMBrowser_favoriteIconFilled:YES];
        self.favoritesButton = [[UIBarButtonItem alloc] initWithImage:self.favoriteButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(favoriteButtonTapped:)];
        self.toolbarItems = @[self.favoritesButton, flexibleSpaceItem, labelItem, flexibleSpaceItem, fileManagerButton];

        if ([self.browserList.starredRealms indexOfObject:self.browserRealm] != NSNotFound) {
            self.favoritesButton.image = self.favoriteButtonFilledImage;
        }
    }
    else {
        self.toolbarItems = @[flexibleSpaceItem, labelItem, flexibleSpaceItem, fileManagerButton];
    }
}

- (void)precomputeRealmProperties
{
    if (self.browserRealm.type != RLMBrowserRealmTypeLocal) {
        return;
    }

    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:self.browserRealm.absoluteFilePath error:nil];
    self.localFileSize = [NSByteCountFormatter stringFromByteCount:attributes.fileSize countStyle:NSByteCountFormatterCountStyleFile];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    self.localCreationDate = [dateFormatter stringFromDate:attributes.fileCreationDate];
    self.localModificationDate = [dateFormatter stringFromDate:attributes.fileModificationDate];
}

- (UIImage *)imageForType:(RLMBrowserRealmType)type
{
    switch (type) {
        case RLMBrowserRealmTypeSync: return [UIImage RLMBrowser_syncRealmLargeIcon];
        case RLMBrowserRealmTypeInMemory: return [UIImage RLMBrowser_inMemoryRealmLargeIcon];
        default:
        case RLMBrowserRealmTypeLocal: return [UIImage RLMBrowser_localRealmLargeIcon];
    }

    return nil;
}

#pragma mark - Interaction -

- (void)actionButtonTapped:(id)sender
{

}

- (void)favoriteButtonTapped:(id)sender
{
    NSInteger listIndex = [self.browserList.starredRealms indexOfObject:self.browserRealm];
    [self.browserList.realm transactionWithBlock:^{
        if (listIndex != NSNotFound) {
            [self.browserList.starredRealms removeObjectAtIndex:listIndex];
            [self.browserList.allRealms insertObject:self.browserRealm atIndex:0];
        }
        else {
            NSInteger allRealmIndex = [self.browserList.allRealms indexOfObject:self.browserRealm];
            if (allRealmIndex != NSNotFound) {
                [self.browserList.allRealms removeObjectAtIndex:allRealmIndex];
            }
            [self.browserList.starredRealms insertObject:self.browserRealm atIndex:0];
        }
    }];

    self.favoritesButton.image = (listIndex == NSNotFound) ? self.favoriteButtonFilledImage : self.favoriteButtonImage;
}

#pragma mark - Table View Data Source -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 2; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return self.browserRealm.schema.count;
    }

    switch (self.browserRealm.type) {
        case RLMBrowserRealmTypeInMemory: return 0;
        case RLMBrowserRealmTypeSync: return 4;
        default:
        case RLMBrowserRealmTypeLocal: return 6;
    }

    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1) { return NSLocalizedString(@"Schema", @""); }
    return nil;
}

- (UITableViewCell *)tableView:(TORoundedTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create identifiers for standard cells and the cells that will show the rounded corners
    static NSString *cellIdentifier     = @"Cell";
    static NSString *capCellIdentifier  = @"CapCell";

    // Work out if this cell needs the top or bottom corners rounded (Or if the section only has 1 row, both!)
    BOOL isTop = (indexPath.row == 0);
    BOOL isBottom = indexPath.row == ([tableView numberOfRowsInSection:indexPath.section] - 1);

    // Create a common table cell instance we can configure
    UITableViewCell *cell = nil;

    // If it's a non-cap cell, dequeue one with the regular identifier
    if (!isTop && !isBottom) {
        TORoundedTableViewCell *normalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (normalCell == nil) {
            normalCell = [[TORoundedTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            normalCell.textLabel.font = [UIFont systemFontOfSize:18.0f];
            normalCell.detailTextLabel.font = [UIFont systemFontOfSize:18.0f];
        }

        cell = normalCell;
    }
    else {
        // If the cell is indeed one that needs rounded corners, dequeue from the pool of cap cells
        TORoundedTableViewCapCell *capCell = [tableView dequeueReusableCellWithIdentifier:capCellIdentifier];
        if (capCell == nil) {
            capCell = [[TORoundedTableViewCapCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:capCellIdentifier];
            capCell.textLabel.font = [UIFont systemFontOfSize:18.0f];
            capCell.detailTextLabel.font = [UIFont systemFontOfSize:18.0f];
        }

        // Configure the cell to set the appropriate corners as rounded
        capCell.topCornersRounded = isTop;
        capCell.bottomCornersRounded = isBottom;
        cell = capCell;
    }

    cell.imageView.image = self.circleIcon;
    cell.imageView.tintColor = self.realmColors[indexPath.row % self.realmColors.count];

    if (indexPath.section == 1) {
        cell.textLabel.text = self.browserRealm.schema[indexPath.row].className;
        cell.detailTextLabel.text = nil;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    else {
        if (self.browserRealm.type == RLMBrowserRealmTypeLocal) {
            [self configureCell:cell forLocalRealmPropertyAtRow:indexPath.row];
        }
        else if (self.browserRealm.type == RLMBrowserRealmTypeSync) {
            [self configureCell:cell forSyncRealmPropertyAtRow:indexPath.row];
        }

        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    // Return the cell
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forLocalRealmPropertyAtRow:(NSInteger)row
{
    NSString *name, *value;

    switch(row) {
        case 0:
            name = NSLocalizedString(@"Size", @"");
            value = self.localFileSize;
            break;
        case 1:
            name = NSLocalizedString(@"File Path", @"");
            value = self.browserRealm.formattedLocation;
            break;
        case 2:
            name = NSLocalizedString(@"Creation Date", @"");
            value = self.localCreationDate;
            break;
        case 3:
            name = NSLocalizedString(@"Modification Date", @"");
            value = self.localModificationDate;
            break;
        case 4:
            name = NSLocalizedString(@"Encryption Key", @"");
            value = @"nil";
            break;
        case 5:
            name = NSLocalizedString(@"Schema Version", @"");
            value = [NSString stringWithFormat:@"%lld", self.browserRealm.schemaVersion];
            break;
    }

    cell.textLabel.text = name;
    cell.detailTextLabel.text = value;
}

- (void)configureCell:(UITableViewCell *)cell forSyncRealmPropertyAtRow:(NSInteger)row
{
    NSString *name, *value;

    switch(row) {
        case 0:
            name = NSLocalizedString(@"Sync URL", @"");
            value = self.browserRealm.syncURL;
            break;
        case 1:
            name = NSLocalizedString(@"User Identifier", @"");
            value = self.browserRealm.syncUserIdentifier;
            break;
        case 2:
            name = NSLocalizedString(@"Encryption Key", @"");
            value = @"nil";
            break;
        case 3:
            name = NSLocalizedString(@"Schema Version", @"");
            value = [NSString stringWithFormat:@"%lld", self.browserRealm.schemaVersion];
            break;
    }

    cell.textLabel.text = name;
    cell.detailTextLabel.text = value;
}

#pragma mark - Cell Interaction -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        return;
    }

    NSString *className = self.browserRealm.schema[indexPath.row].className;
    RLMRealmConfiguration *configuration = self.browserRealm.realmConfiguration;
    RLMRealm *realm = [RLMRealm RLMBrowser_realmWithConfiguration:configuration error:nil];
    RLMObjectSchema *schema = realm.schema[className];

    RLMBrowserObjectSchemaViewController *controller = [[RLMBrowserObjectSchemaViewController alloc] initWithObjectSchema:schema];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    navController.modalPresentationStyle = UIModalPresentationPopover;
    navController.popoverPresentationController.sourceView = tableView;
    navController.popoverPresentationController.sourceRect = [tableView rectForRowAtIndexPath:indexPath];
    [self presentViewController:navController animated:YES completion:nil];
}

@end
