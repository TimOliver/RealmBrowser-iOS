//
//  RLMBrowserObjectListTableViewCell.h
//  RealmBrowser
//
//  Created by Tim Oliver on 27/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserObjectListContentView : UIView

@property (nonatomic, weak) IBOutlet UILabel *nilLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *indexLabel;

+ (instancetype)objectListContentView;

@end
