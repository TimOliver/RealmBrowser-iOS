//
//  RLMTableHeaderView.h
//  RealmBrowser
//
//  Created by Tim Oliver on 27/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RLMTableHeaderViewStyle) {
    RLMTableHeaderViewStyleDefault, // The header view scrolls as normal with the rest of the content
    RLMTableHeaderViewStyleFixed,   // The header is locked to the top of the table view
};

NS_ASSUME_NONNULL_BEGIN

/** A header view that manages the presentation of the search bar at the top of table views */
@interface RLMBrowserTableHeaderView : UIView

/** The visual style of this header view (for fixed / fluid table view scrolling) */
@property (nonatomic, assign) RLMTableHeaderViewStyle style;

/** The search bar managed by this view */
@property (nonatomic, strong, readonly) UISearchBar *searchBar;

/** A block that is called each time the search bar text changes */
@property (nonatomic, copy, nullable) void (^searchBarTextChangedHandler)(UISearchBar *searchBar, NSString *searchText);

/** Init a new instance with either the default or fixed style */
- (instancetype)initWithStyle:(RLMTableHeaderViewStyle)style;

/** Make the search bar resign the first responder */
- (void)dismissKeyboardForSearchBar;

/** When needed to be fixed, call this method on each instance of `scrollViewDidScroll` */
- (void)adjustFrameForScrollView:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
