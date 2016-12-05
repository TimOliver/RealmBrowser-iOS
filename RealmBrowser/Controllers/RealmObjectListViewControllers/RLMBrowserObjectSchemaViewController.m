//
//  RLMBrowserObjectSchemaViewController.m
//  RealmBrowser
//
//  Created by Tim Oliver on 12/4/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

#import "RLMBrowserObjectSchemaViewController.h"

// Categories
#import "RLMProperty+BrowserDescription.h"
#import "UIImage+BrowserTagIcons.h"

// Realm Model Objects
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

// Views
#import "RLMBrowserPropertyTableViewCell.h"
#import "RLMBrowserNavigationTitleView.h"

// ------------------------------------------------------------------

NSString * const kRLMBrowserObjectSchemaTableViewCellIdentifier = @"ObjectListCell";

// ------------------------------------------------------------------

@interface RLMBrowserObjectSchemaViewController ()

@property (nonatomic, strong) RLMBrowserNavigationTitleView *titleView;

@property (nonatomic, strong) RLMBrowserRealm  *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;

@property (nonatomic, strong) UIImage *optionalTagIcon;
@property (nonatomic, strong) UIImage *indexedTagIcon;

@end

// ------------------------------------------------------------------

@implementation RLMBrowserObjectSchemaViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _browserRealm = realm;
        _browserSchema = schema;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 50.0f;
    
    // Configure table cell
    UINib *tableNib = [UINib nibWithNibName:@"RLMBrowserPropertyTableViewCell" bundle:nil];
    [self.tableView registerNib:tableNib forCellReuseIdentifier:kRLMBrowserObjectSchemaTableViewCellIdentifier];
    
    // Load Realm and the schema
    self.realm = [RLMRealm realmWithConfiguration:self.browserRealm.realmConfiguration error:nil];
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    
    // Set up the header for this view controller
    self.titleView = [[RLMBrowserNavigationTitleView alloc] init];
    self.titleView.titleLabel.text = self.browserSchema.className;
    
    // Configure header view
    NSInteger count = self.schema.properties.count;
    self.titleView.subtitleLabel.text = [NSString stringWithFormat:@"%ld Schema %@", count, count != 1 ? @"Properties" : @"Property"];
    [self.titleView sizeToFit];
    self.navigationItem.titleView = self.titleView;
    
    // Load tag icons
    self.indexedTagIcon = [UIImage RLMBrowser_indexedTagIcon];
    self.optionalTagIcon = [UIImage RLMBrowser_optionalTagIcon];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.schema.properties.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(RLMBrowserPropertyTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set the commonly shared icons if they haven't already
    if (cell.indexedTagView.image == nil) {
        cell.indexedTagView.image = self.indexedTagIcon;
    }
    
    if (cell.optionalTagView.image == nil) {
        cell.optionalTagView.image = self.optionalTagIcon;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLMBrowserPropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectSchemaTableViewCellIdentifier];

    RLMProperty *property = self.schema.properties[indexPath.row];
    cell.titleLabel.text = property.name;
    cell.subtitleLabel.text = property.RLMBrowser_formattedDescription;
    cell.indexedTagView.hidden = !property.indexed;
    cell.optionalTagView.hidden = !property.optional;
    
    return cell;
}

@end
