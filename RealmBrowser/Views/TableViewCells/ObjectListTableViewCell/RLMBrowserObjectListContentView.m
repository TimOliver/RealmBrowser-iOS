//
//  RLMBrowserObjectListTableViewCell.m
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

#import "RLMBrowserObjectListContentView.h"

@implementation RLMBrowserObjectListContentView

+ (instancetype)objectListContentView
{
    return [[[NSBundle bundleForClass:self.class] loadNibNamed:@"RLMBrowserObjectListContentView" owner:nil options:nil] firstObject];
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
