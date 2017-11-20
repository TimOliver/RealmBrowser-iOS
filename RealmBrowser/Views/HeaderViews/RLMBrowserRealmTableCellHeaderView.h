//
//  RLMRealmTableCellHeaderView.h
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

/** The handler block that is called when the user taps it */
@property (nonatomic, copy) void (^collapseToggledHandler)(void);

/** Animate the view transitioning between collapsed and uncollapsed states */
- (void)setCollapsed:(BOOL)collapsed animated:(BOOL)animated;

/** Animate the view transitioning between highlight and non-highlighted */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

@end
