//
//  RLMRealmTableCellHeaderView.h
//  RealmBrowserExample
//
//  Created by Tim Oliver on 8/28/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMBrowserRealmTableCellHeaderView : UITableViewHeaderFooterView

/** When the view is indicating that the content below it is collapsed */
@property (nonatomic, assign) BOOL collapsed;

/** Indicating the view is highlighted, usually in response to a user interaction */
@property (nonatomic, assign) BOOL highlighted;

/** The title label shown on the left hand side */
@property (nonatomic, readonly) UILabel *titleLabel;

/** A label right-aligned that can be used to indicate the number of items in this section */
@property (nonatomic, readonly) UILabel *countLabel;

/** An arrow graphic used to denote if the view is collapsed or not */
@property (nonatomic, readonly) UIImageView *disclosureArrowView;

/** The horizontal inset of the content to line up with the table view content */
@property (nonatomic, assign) UIEdgeInsets contentInset;

/** Animate the view transitioning between collapsed and uncollapsed states */
- (void)setCollapsed:(BOOL)collapsed animated:(BOOL)animated;

/** Animate the view transitioning between highlight and non-highlighted */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

@end
