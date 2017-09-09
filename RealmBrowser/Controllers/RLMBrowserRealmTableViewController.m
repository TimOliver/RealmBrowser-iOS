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

const NSInteger kRLMBrowserRealmViewTag = 101;

@interface RLMBrowserRealmTableViewController ()

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

@end

@implementation RLMBrowserRealmTableViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _browserRealm = realm;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Generate Images
    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:10.0f];
    self.realmColors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];

    // Set up view controller default values
    self.title = self.browserRealm.name;
    self.tableView = [[TORoundedTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.rowHeight = 74.0f;

    RLMBrowserRealmHeaderView *headerView = [RLMBrowserRealmHeaderView headerView];
    headerView.titleLabel.text = self.browserRealm.name;
    headerView.subtitleLabel.text = self.browserRealm.localizedType;
    headerView.iconView.image = [self imageForType:self.browserRealm.type];
    self.tableView.tableHeaderView = headerView;
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
            normalCell = [[TORoundedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }

        cell = normalCell;
    }
    else {
        // If the cell is indeed one that needs rounded corners, dequeue from the pool of cap cells
        TORoundedTableViewCapCell *capCell = [tableView dequeueReusableCellWithIdentifier:capCellIdentifier];
        if (capCell == nil) {
            capCell = [[TORoundedTableViewCapCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:capCellIdentifier];
        }

        // Configure the cell to set the appropriate corners as rounded
        capCell.topCornersRounded = isTop;
        capCell.bottomCornersRounded = isBottom;
        cell = capCell;
    }

    // Make sure the cell has a width greater than 0 to ensure proper content layout
    cell.frame = CGRectMake(0, 0, 320.0f, 44.0f);

    // Set up the content view
    RLMBrowserObjectContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserRealmViewTag];
    if (contentView == nil) {
        cell.contentView.frame = cell.bounds;
        contentView = [RLMBrowserObjectContentView objectContentView];
        contentView.tag = kRLMBrowserRealmViewTag;
        contentView.iconImage = self.circleIcon;
        [cell.contentView addSubview:contentView];
    }

    // Reset the content view frame each time
    CGRect frame = cell.contentView.bounds;
    contentView.frame = frame;
    
    // Configure the cell's label
    contentView.iconColor = self.realmColors[indexPath.row % self.realmColors.count];
    contentView.propertyName = @"Property";
    contentView.objectValue = @"Value";
    contentView.nilValue = (contentView.objectValue == nil);

    // Return the cell
    return cell;
}

@end
