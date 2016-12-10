//
//  RLMBrowserObjectView.h
//  RealmBrowser
//
//  Created by Tim Oliver on 12/9/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserObjectTableViewCellContentView : UIView

@property (nonatomic, copy) NSString *propertyName;
@property (nonatomic, copy) NSString *propertyStats;

@property (nonatomic, copy) NSString *objectValue;

@end
