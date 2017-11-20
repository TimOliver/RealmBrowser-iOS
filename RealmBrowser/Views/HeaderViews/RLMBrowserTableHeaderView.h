//
//  RLMTableHeaderView.h
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
