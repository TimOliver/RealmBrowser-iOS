//
//  RLMBrowserObjectListTableViewCell.m
//  RealmBrowser
//
//  Created by Tim Oliver on 27/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMBrowserObjectListContentView.h"

@implementation RLMBrowserObjectListContentView

+ (instancetype)objectListContentView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RLMBrowserObjectListContentView" owner:nil options:nil] firstObject];
}

- (void)configureCellWithRealmObject:(RLMObject *)object
                       titleProperty:(NSString *)titleProperty
                 secondaryProperties:(NSArray<NSString *> *)secondaryProperties;
{
    self.object = object;
    self.titleProperty = titleProperty;
    self.secondaryProperties = secondaryProperties;

    id value = RLM_OBJECT_VALUE_DESCRIPTION(object, titleProperty);

    if ([value description].length) {
        self.titleLabel.hidden = NO;
        self.nilLabel.hidden = YES;
        self.titleLabel.text = [NSString stringWithFormat:@"%@", value];
    }
    else {
        self.titleLabel.hidden = YES;
        self.nilLabel.hidden = NO;
    }

    NSString *subtitle = @"";
    if (secondaryProperties.count) {
        for (NSString *propertyName in secondaryProperties) {
            NSString *propertyValue = RLM_OBJECT_VALUE_DESCRIPTION(object, propertyName);
            subtitle = [subtitle stringByAppendingFormat:@"%@: %@", propertyName, propertyValue];

            if (propertyName != secondaryProperties.lastObject) {
                subtitle = [subtitle stringByAppendingString:@" • "];
            }
        }
    }
    else {
        subtitle = @"Realm Object";
    }

    self.subtitleLabel.text = subtitle;
}

@end
