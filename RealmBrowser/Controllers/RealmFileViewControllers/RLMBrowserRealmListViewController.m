//
//  RLMBrowserRealmsViewControllerTableViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <TOSplitViewController/TOSplitViewController.h>

#import "RLMBrowserRealmListViewController.h"

#import "RLMBrowserList.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserConfiguration.h"
#import "RLMBrowserTableHeaderView.h"
#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserObjectViewController.h"
#import "UIImage+BrowserIcons.h"

// -----------------------------------------------------------------------

@interface RLMBrowserRealmListViewController ()

/* The master Realm object that controls the groups of Realm objects */
@property (nonatomic, strong) RLMBrowserList *realmList;

@property (nonatomic, strong) RLMBrowserRealm *defaultRealm;
@property (nonatomic, strong) RLMArray<RLMBrowserRealm *> *starredRealms;
@property (nonatomic, strong) RLMResults<RLMBrowserRealm *> *filteredRealms;

- (RLMBrowserRealm *)itemForSection:(NSInteger)index;

@property (nonatomic, strong) UIImage *localRealmIcon;
@property (nonatomic, strong) UIImage *syncRealmIcon;
@property (nonatomic, strong) UIImage *inMemoryRealmIcon;

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
    self.title = @"Realms";

    self.localRealmIcon = [UIImage RLMBrowser_localRealmIcon];
    self.inMemoryRealmIcon = [UIImage RLMBrowser_inMemoryRealmIcon];
    self.syncRealmIcon = [UIImage RLMBrowser_inMemoryRealmIcon];

    RLMRealm *realm = [RLMRealm realmWithConfiguration:[RLMBrowserConfiguration configuration] error:nil];
    self.realmList = [RLMBrowserList defaultListInRealm:realm];
    
    self.defaultRealm = self.realmList.defaultRealm;
    self.starredRealms = self.realmList.starredRealms;
    self.filteredRealms = [self.realmList.allRealms objectsWhere:@"(self.uuid != %@) AND NOT (self.uuid in %@)",
                                                                    self.defaultRealm.uuid, self.starredRealms];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:animated];
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
    if (self.starredRealms.count && index < self.starredRealms.count - offset) {
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

#pragma mark - Table View Delegate -
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Default Realm (if it is visible )
    if (self.defaultRealm && section == 0) {
        return @"DEFAULT REALM";
    }

    // Starred Realms
    if (self.starredRealms.count > 0) {
        if ((!self.defaultRealm && section == 0) || section == 1) {
            return @"FAVORITE REALMS";
        }
    }

    return @"REALMS";
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numberOfSections = 0;
    
    if (self.defaultRealm) { numberOfSections += 1; }
    numberOfSections += self.starredRealms.count;
    numberOfSections += self.filteredRealms.count;
    
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1 + [self itemForSection:section].schema.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.indentationWidth = 48.0f;
    }
    
    RLMBrowserRealm *realm = [self itemForSection:indexPath.section];

    // The first section is the Realm itself
    if (indexPath.row == 0) {
        cell.textLabel.text = realm.name;
        cell.imageView.image = self.localRealmIcon;
        cell.indentationLevel = 0;
    }
    else { // Remaining rows are schema objects in the Realm
        cell.textLabel.text = realm.schema[indexPath.row-1].className;
        cell.imageView.image = nil;
        cell.indentationLevel = 1;
    }



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
    }
}


@end
