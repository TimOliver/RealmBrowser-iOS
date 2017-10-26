//
//  RLMBrowserRealmsViewControllerTableViewController.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <TOSplitViewController/TOSplitViewController.h>

#import "RLMBrowserConstants.h"
#import "RLMBrowserObjectListViewController.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserTableHeaderView.h"
#import "RLMBrowserNavigationTitleView.h"
#import "RLMRealmMonochromeLogoView.h"
#import "RLMBrowserRealmTableViewCell.h"

#import "RLMBrowserObjectViewController.h"
#import "RLMBrowserObjectSchemaPickerViewController.h"

#import "RLMBrowserObjectListContentView.h"
#import "UIColor+BrowserRealmColors.h"
#import "UIImage+BrowserIcons.h"
#import "UILabel+RealmBrowser.h"
#import "RLMRealm+BrowserCaptureRealms.h"
#import "RLMBrowserLogoViewController.h"

#import <Realm/Realm.h>
#import <Realm/RLMRealm_Dynamic.h>

// ------------------------------------------------------------------

NSString * const kRLMBrowserObjectListTableViewCellIdentifier = @"ObjectListCell";
NSInteger const kRLMBrowserObjectListViewTag = 101;

// ------------------------------------------------------------------

@interface RLMBrowserObjectListViewController()

@property (nonatomic, strong) RLMBrowserTableHeaderView *tableHeaderView;

@property (nonatomic, strong) RLMBrowserRealm *browserRealm;
@property (nonatomic, strong) RLMBrowserSchema *browserSchema;

@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) RLMObjectSchema *schema;
@property (nonatomic, strong) RLMResults *objects;
@property (nonatomic, strong) RLMResults *filteredObjects;

@property (nonatomic, strong) NSString *preferredPropertyName;
@property (nonatomic, strong) RLMArray *preferredSecondaryPropertyNames;

@property (nonatomic, strong) NSArray *realmColors;
@property (nonatomic, strong) NSArray *lightRealmColors;

@end

// ------------------------------------------------------------------

@implementation RLMBrowserObjectListViewController

- (instancetype)initWithBrowserRealm:(RLMBrowserRealm *)realm browserSchema:(RLMBrowserSchema *)schema
{
    if (self = [super init]) {
        _browserRealm = realm;
        _browserSchema = schema;

        // Add a notification for when the split view controller will collapse or expand
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(splitViewControllerDetailStateChanged:)
                                                     name:TOSplitViewControllerShowTargetDidChangeNotification
                                                   object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    // Remove the split view controller notification observer
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TOSplitViewControllerShowTargetDidChangeNotification object:nil];
}

#pragma mark - View Creation -

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) weakSelf = self;

    RLM_RESET_NAVIGATION_CONTROLLER(self.navigationController);

    // Set default settings
    self.clearsSelectionOnViewWillAppear = YES;
    self.tableView.rowHeight = 64.0f;
    self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 35.0f, 0.0f, 0.0f);
    
    // Set the title as the schema name
    self.title = self.browserSchema.className;
    
    // Set up the header search bar
    self.tableHeaderView = [[RLMBrowserTableHeaderView alloc] init];
    self.tableHeaderView.searchBarTextChangedHandler = ^(UISearchBar *bar, NSString *text) { [weakSelf searchBarEnteredText:text]; };
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    // Load the Realm file
    self.realm = [RLMRealm RLMBrowser_realmWithConfiguration:self.browserRealm.realmConfiguration error:nil];
    self.schema = [self.realm.schema schemaForClassName:self.browserSchema.className];
    
    // Use the dynamic API to pull all objects from the Realm for this schema
    self.objects = [self.realm allObjects:self.browserSchema.className];
    
    // Calculate the most appropriate property to initially display
    self.preferredPropertyName = self.browserSchema.preferredPropertyName;
    self.preferredSecondaryPropertyNames = self.browserSchema.secondaryPropertyNames;

    // Get Realm colours to theme the numbers
    self.realmColors = [UIColor RLMBrowser_realmColorsInvertedRepeating];
    self.lightRealmColors = [UIColor RLMBrowser_realmColorsLightInvertedRepeating];

    // Set up the toolbar content
    UIImage *tweaksIcon = [UIImage RLMBrowser_tweaksIcon];
    UIBarButtonItem *tweaksButton = [[UIBarButtonItem alloc] initWithImage:tweaksIcon style:UIBarButtonItemStylePlain target:self action:@selector(tweaksButtonTapped:)];

    NSString *text = [NSString stringWithFormat:@"%ld Object%@", self.objects.count, self.objects.count == 1 ? @"" : @"s"];
    UILabel *objectsLabel = [UILabel RLMBrowser_toolbarLabelWithText:text];
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:objectsLabel];
    
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems = @[flexibleSpaceItem, labelItem, flexibleSpaceItem, tweaksButton];

    if (self.objects.count) {
        [self pushObjectViewControllerwithObject:self.objects.firstObject collapsed:NO];
    }
    else {
        RLMBrowserLogoViewController *logoController = [[RLMBrowserLogoViewController alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:logoController];
        RLM_RESET_NAVIGATION_CONTROLLER(navController);
        [self to_setDetailViewController:navController sender:self];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:animated];
}

#pragma mark - Search Bar Notifications -
- (void)searchBarEnteredText:(NSString *)searchText
{
    if (searchText.length == 0) {
        self.filteredObjects = nil;
        [self.tableView reloadData];
        return;
    }

    // Build up the search predicate
    NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:0];

    NSNumberFormatter *floatFormatter = [[NSNumberFormatter alloc] init];
    NSNumberFormatter *integerFormatter = [[NSNumberFormatter alloc] init];
    integerFormatter.allowsFloats = NO;

    for (RLMProperty *property in self.schema.properties) {
        NSExpression *propertyExpression = [NSExpression expressionForKeyPath:property.name];
        NSExpression *valueExpression;
        NSPredicateOperatorType comparisonOperator = NSEqualToPredicateOperatorType;
        NSComparisonPredicateOptions comparisonOptions = 0;

        switch (property.type) {
            case RLMPropertyTypeBool: {
                if ([searchText caseInsensitiveCompare:@"true"] == NSOrderedSame ||
                    [searchText caseInsensitiveCompare:@"YES"] == NSOrderedSame) {
                    valueExpression = [NSExpression expressionForConstantValue:@YES];
                }
                else if ([searchText caseInsensitiveCompare:@"false"] == NSOrderedSame ||
                         [searchText caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
                    valueExpression = [NSExpression expressionForConstantValue:@NO];
                }
                break;
            }
            case RLMPropertyTypeInt: {
                NSNumber *value = [integerFormatter numberFromString:searchText];
                if (value) {
                    valueExpression = [NSExpression expressionForConstantValue:value];
                }
                break;
            }
            case RLMPropertyTypeString: {
                valueExpression = [NSExpression expressionForConstantValue:searchText];
                comparisonOperator = NSContainsPredicateOperatorType;
                comparisonOptions = NSCaseInsensitivePredicateOption;

                break;
            }
            case RLMPropertyTypeFloat:
            case RLMPropertyTypeDouble: {
                NSNumber *value = [floatFormatter numberFromString:searchText];
                if (value) {
                    valueExpression = [NSExpression expressionForConstantValue:value];
                }
                break;
            }
            default:
                break;
        }

        if (!valueExpression) {
            // We were unable to convert the search text into a predicate for this property type.
            continue;
        }

        NSPredicate *predicate = [NSComparisonPredicate predicateWithLeftExpression:propertyExpression
                                                                    rightExpression:valueExpression
                                                                           modifier:NSDirectPredicateModifier
                                                                               type:comparisonOperator
                                                                            options:comparisonOptions];
        [predicates addObject:predicate];
    }

    NSPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
    self.filteredObjects = [self.objects objectsWithPredicate:predicate];
    [self.tableView reloadData];
}

#pragma mark - Notifications -
- (void)splitViewControllerDetailStateChanged:(NSNotification *)notification
{
    // Loop through each visible cell and update it for the current split controller state
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [self tableView:self.tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

- (void)tweaksButtonTapped:(id)sender
{
    RLMBrowserObjectSchemaPickerViewController *controller = [[RLMBrowserObjectSchemaPickerViewController alloc] initWithBrowserRealm:self.browserRealm
                                                                                                            browserSchema:self.browserSchema
                                                                                                               demoObject:self.objects.firstObject];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    navigationController.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popoverController = navigationController.popoverPresentationController;
    popoverController.barButtonItem = sender;
    [self presentViewController:navigationController animated:YES completion:nil];
    RLM_RESET_NAVIGATION_CONTROLLER(navigationController);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.filteredObjects) {
        return self.filteredObjects.count;
    }

    return self.objects.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If we're not in ultra-compact iPhone mode, hide the disclosure indidcator
    BOOL collapsed = (self.to_splitViewController.visibleViewControllers.count == 1);
    cell.accessoryType = !collapsed ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;

    RLMBrowserObjectListContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectListViewTag];
    if (cell.accessoryType != UITableViewCellAccessoryDisclosureIndicator) {
        CGRect frame = cell.contentView.bounds;
        frame.size.width -= 20.0f;
        contentView.frame = frame;
    }
    else {
        contentView.frame = cell.contentView.bounds;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RLMBrowserRealmTableViewCell *cell = (RLMBrowserRealmTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[RLMBrowserRealmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kRLMBrowserObjectListTableViewCellIdentifier];
        
        RLMBrowserObjectListContentView *contentView = [RLMBrowserObjectListContentView objectListContentView];
        contentView.tag = kRLMBrowserObjectListViewTag;
        contentView.frame = cell.contentView.bounds;
        [cell.contentView addSubview:contentView];
    }
    
    RLMBrowserObjectListContentView *contentView = [cell.contentView viewWithTag:kRLMBrowserObjectListViewTag];

    NSMutableArray *secondaryPropertyNames = [NSMutableArray array];
    for (RLMBrowserObjectProperty *propertyName in self.preferredSecondaryPropertyNames) {
        [secondaryPropertyNames addObject:propertyName.name];
    }

    // Get the object
    RLMObject *object = nil;
    if (self.filteredObjects) {
        object = self.filteredObjects[indexPath.row];
    }
    else {
        object = self.objects[indexPath.row];
    }

    [contentView configureCellWithRealmObject:object titleProperty:self.preferredPropertyName secondaryProperties:secondaryPropertyNames];
    
    contentView.indexLabel.text = [NSString stringWithFormat:@"%ld", [self.objects indexOfObject:object] + 1];
    contentView.indexLabel.textColor = self.realmColors[indexPath.row % self.realmColors.count];

    cell.selectedBackgroundColor = self.lightRealmColors[indexPath.row % self.realmColors.count];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RLMObject *object = nil;
    if (self.filteredObjects) {
        object = self.filteredObjects[indexPath.row];
    }
    else {
        object = self.objects[indexPath.row];
    }

    [self pushObjectViewControllerwithObject:object collapsed:YES];
}

- (void)pushObjectViewControllerwithObject:(RLMObject *)object collapsed:(BOOL)collapsed
{
    RLMBrowserObjectViewController *objectController = [[RLMBrowserObjectViewController alloc] initWithObject:object
                                                                                              forBrowserRealm:self.browserRealm
                                                                                                browserSchema:self.browserSchema];
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:objectController];
    RLM_RESET_NAVIGATION_CONTROLLER(controller);

    if (collapsed) {
        [self to_showDetailViewController:controller sender:self];
    }
    else {
        [self to_setDetailViewController:controller sender:self];
    }
}

@end
