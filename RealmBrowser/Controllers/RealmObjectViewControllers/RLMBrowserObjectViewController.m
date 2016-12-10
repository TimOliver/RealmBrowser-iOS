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
#import "RLMBrowserObjectTableViewCellContentView.h"

#import "UIImage+BrowserIcons.h"
#import "UIColor+BrowserRealmColors.h"

const NSInteger kRLMBrowserObjectViewTag = 101;

@interface RLMBrowserObjectViewController ()

@property (nonatomic, strong) RLMObject *realmObject;

@property (nonatomic, strong) UIImage *circleIcon;
@property (nonatomic, strong) NSArray *realmColors;

@end

@implementation RLMBrowserObjectViewController

- (instancetype)initWithObject:(RLMObject *)realmObject
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _realmObject = realmObject;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[TORoundedTableView alloc] init];
    self.title = self.realmObject.objectSchema.className;
    self.tableView.rowHeight = 64.0f;
    
    self.circleIcon = [UIImage RLMBrowser_tintedCircleImageForRadius:12.0f];
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
    
    // Set up the content view
    RLMBrowserObjectTableViewCellContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectViewTag];
    if (contentView == nil) {
        CGRect frame = cell.contentView.bounds;
        frame.origin.x = self.tableView.separatorInset.left;
        frame.size.width -= self.tableView.separatorInset.left;
        contentView = [[RLMBrowserObjectTableViewCellContentView alloc] initWithFrame:frame];
        contentView.tag = kRLMBrowserObjectViewTag;
        [cell.contentView addSubview:contentView];
    }
    
    RLMProperty *property = self.realmObject.objectSchema.properties[indexPath.row];
    
    // Configure the cell's label
    contentView.propertyName = property.name;
    contentView.propertyStats = @"String";
    contentView.objectValue = [self.realmObject[property.name] description];
    
    // Return the cell
    return cell;
}

@end
