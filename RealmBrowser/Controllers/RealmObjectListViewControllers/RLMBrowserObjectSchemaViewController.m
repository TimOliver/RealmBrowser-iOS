//
//  RLMBrowserObjectSchemaViewController.m
//  RealmBrowser
//
//  Created by Tim Oliver on 12/4/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectSchemaViewController.h"

#import <Realm/Realm.h>

// Realm Model Objects
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

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
    
    self.tableView.rowHeight = 64.0f;
    
    // Load Realm and the schema
    self.realm = [RLMRealm realmWithConfiguration:self.browserRealm.realmConfiguration error:nil];
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    
    // Set up the header for this view controller
    self.titleView = [[RLMBrowserNavigationTitleView alloc] init];
    self.titleView.titleLabel.text = self.browserSchema.className;
    
    NSInteger count = self.schema.properties.count;
    self.titleView.subtitleLabel.text = [NSString stringWithFormat:@"%ld Schema %@", count, count != 1 ? @"Properties" : @"Property"];
    [self.titleView sizeToFit];
    self.navigationItem.titleView = self.titleView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.schema.properties.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectSchemaTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kRLMBrowserObjectSchemaTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:22.0f weight:UIFontWeightRegular];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
        cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.4f alpha:1.0f];
    }
    
    RLMProperty *property = self.schema.properties[indexPath.row];

    cell.textLabel.text = property.name;
    cell.detailTextLabel.text = @"String";
    
    return cell;
}

@end
