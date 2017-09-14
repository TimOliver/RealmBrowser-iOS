//
//  RLMBrowserObjectSchemaViewController.m
//  RealmBrowserExample
//
//  Created by Tim Oliver on 9/14/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectSchemaViewController.h"
#import "UIImage+BrowserIcons.h"
#import "RLMBrowserPropertyTableViewCell.h"
#import "UIColor+BrowserRealmColors.h"

static NSString *kRLMBrowserObjectPropertyTableViewCellIdentifier = @"PropertyCell";

@interface RLMBrowserObjectSchemaViewController ()

@property (nonatomic, strong) RLMObjectSchema *objectSchema;
@property (nonatomic, strong) UIImage *circleImage;
@property (nonatomic, strong) NSArray *realmColors;

@end

@implementation RLMBrowserObjectSchemaViewController

- (instancetype)initWithObjectSchema:(RLMObjectSchema *)objectSchema
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _objectSchema = objectSchema;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.objectSchema.className;
    self.tableView.rowHeight = 54.0f;

    self.circleImage = [UIImage RLMBrowser_tintedCircleImageForRadius:15.0f];
    self.realmColors = self.realmColors = [[[UIColor RLMBrowser_realmColors] reverseObjectEnumerator] allObjects];

    UINib *tableNib = [UINib nibWithNibName:@"RLMBrowserPropertyTableViewCell" bundle:nil];
    [self.tableView registerNib:tableNib forCellReuseIdentifier:kRLMBrowserObjectPropertyTableViewCellIdentifier];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonTapped)];
}

- (CGSize)preferredContentSize
{
    CGSize preferredSize = CGSizeZero;
    preferredSize.width = 350.0;
    preferredSize.height = (self.tableView.rowHeight * self.objectSchema.properties.count) + 60.0f;
    return preferredSize;
}

- (void)doneButtonTapped
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objectSchema.properties.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RLMBrowserPropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectPropertyTableViewCellIdentifier
                                                                                                               forIndexPath:indexPath];
    cell.iconView.image = self.circleImage;
    cell.iconView.tintColor = self.realmColors[indexPath.row % self.realmColors.count];

    RLMProperty *property = self.objectSchema.properties[indexPath.row];
    [cell configureCellWithProperty:property];

    return cell;
}


@end
