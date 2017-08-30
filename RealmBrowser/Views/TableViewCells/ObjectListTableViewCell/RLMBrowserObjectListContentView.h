//
//  RLMBrowserObjectListTableViewCell.h
//  RealmBrowser
//
//  Created by Tim Oliver on 27/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLMBrowserConstants.h"
#import <Realm/Realm.h>

@interface RLMBrowserObjectListContentView : UIView

@property (nonatomic, weak) IBOutlet UILabel *nilLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *indexLabel;

@property (nonatomic, strong) RLMObject *object;
@property (nonatomic, strong) NSString *titleProperty;
@property (nonatomic, strong) NSArray<NSString *> *secondaryProperties;

+ (instancetype)objectListContentView;

- (void)configureCellWithRealmObject:(RLMObject *)object
                       titleProperty:(NSString *)titleProperty
                 secondaryProperties:(NSArray<NSString *> *)secondaryProperties;

@end
