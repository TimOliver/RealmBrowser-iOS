//
//  RLMBrowserObjectViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserObjectViewController.h"
#import "TORoundedTableView.h"
#import "TORoundedTableViewCell.h"
#import "TORoundedTableViewCapCell.h"
#import "RLMBrowserObjectContentView.h"

#import "UIImage+BrowserIcons.h"
#import "UIColor+BrowserRealmColors.h"
#import "RLMProperty+BrowserDescription.h"
#import "UILabel+RealmBrowser.h"

#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

#import "RLMObject+JSONSerialization.h"

const NSInteger kRLMBrowserObjectViewTag = 101;

@interface RLMBrowserObjectViewController ()

@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;
@property (nonatomic, strong) RLMObject *realmObject;

@property (nonatomic, strong) UIImage *circleIcon;
@property (nonatomic, strong) NSArray *realmColors;

@end

@implementation RLMBrowserObjectViewController

- (instancetype)initWithObject:(RLMObject *)realmObject
               forBrowserRealm:(RLMBrowserRealm *)realm
                 browserSchema:(RLMBrowserSchema *)schema
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _browserRealm = realm;
        _browserSchema = schema;
        _realmObject = realmObject;
        self.title = _realmObject[_browserSchema.preferredPropertyName];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[TORoundedTableView alloc] init];
    self.tableView.rowHeight = 64.0f;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 30.0f, 0, 0);
    
    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:10.0f];
    self.realmColors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];

    NSInteger numberOfProperties = self.realmObject.objectSchema.properties.count;

    NSString *labelText = [NSString stringWithFormat:@"%ld %@", numberOfProperties, numberOfProperties == 1 ? @"Property" : @"Properties"];
    UILabel *objectsLabel = [UILabel RLMBrowser_toolbarLabelWithText:labelText];
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:objectsLabel];

    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *exportButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(exportButtonTapped:)];

    self.toolbarItems = @[flexibleSpace, labelItem, flexibleSpace, exportButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Properties";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.realmObject.objectSchema.properties.count;
}

- (UITableViewCell *)tableView:(TORoundedTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create identifiers for standard cells and the cells that will show the rounded corners
    static NSString *cellIdentifier     = @"Cell";
    static NSString *capCellIdentifier  = @"CapCell";
    
    // Work out if this cell needs the top or bottom corners rounded (Or if the section only has 1 row, both!)
    BOOL isTop = (indexPath.row == 0);
    BOOL isBottom = indexPath.row == (self.realmObject.objectSchema.properties.count - 1);
    
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
    RLMBrowserObjectContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectViewTag];
    if (contentView == nil) {
        cell.contentView.frame = cell.bounds;
        contentView = [RLMBrowserObjectContentView objectContentView];
        contentView.tag = kRLMBrowserObjectViewTag;
        contentView.iconImage = self.circleIcon;
        [cell.contentView addSubview:contentView];
    }
    
    // Reset the content view frame each time
    CGRect frame = cell.contentView.bounds;
    contentView.frame = frame;
    
    RLMProperty *property = self.realmObject.objectSchema.properties[indexPath.row];
    
    // Configure the cell's label
    contentView.iconColor = self.realmColors[indexPath.row % self.realmColors.count];
    contentView.propertyName = property.name;
    contentView.propertyStats = [property RLMBrowser_typeAndConfigurationDescription];
    contentView.objectValue = [self.realmObject[property.name] description];
    
    // Return the cell
    return cell;
}

#pragma mark - Button Callbacks -
- (void)exportButtonTapped:(id)sender
{
    // Convert the Realm object to a JSON serializable dictionary
    NSError *error = nil;
    NSString *JSONString = [self.realmObject RLMBrowser_toJSONStringWithError:&error];

    if (error) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Unable to Generate JSON" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:controller animated:YES completion:nil];
        return;
    }

    // Show the activity controller
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[JSONString] applicationActivities:nil];
    activityController.modalPresentationStyle = UIModalPresentationPopover;
    activityController.popoverPresentationController.barButtonItem = sender;
    [self presentViewController:activityController animated:YES completion:nil];
}

@end
