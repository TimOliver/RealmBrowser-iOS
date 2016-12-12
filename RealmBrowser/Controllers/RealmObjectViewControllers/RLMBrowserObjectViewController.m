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

#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

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
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[TORoundedTableView alloc] init];
    self.title = self.realmObject[self.browserSchema.preferredPropertyName];
    self.tableView.rowHeight = 64.0f;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 30.0f, 0, 0);

    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:10.0f];
    self.realmColors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
   // frame.origin.x = self.tableView.separatorInset.left;
    //frame.size.width -= (self.tableView.separatorInset.left + 20.0f);
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

@end
