//
//  RLMBrowserObjectSchemaViewController.m
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
    
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    UINib *tableNib = [UINib nibWithNibName:@"RLMBrowserPropertyTableViewCell" bundle:bundle];
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
