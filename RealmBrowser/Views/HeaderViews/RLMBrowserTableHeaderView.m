//
//  RLMTableHeaderView.m
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

#import "RLMBrowserTableHeaderView.h"
#import "RLMRealmMonochromeLogoView.h"

#define RLMBROWSER_BACKGROUND_COLOR [UIColor colorWithRed:238.0f/255.0f green:239.0f/255.0f blue:244.0f/255.0f alpha:1.0f]

CGFloat const kRLMRealmLogoSize = 60.0f;

@interface RLMBrowserTableHeaderView () <UISearchBarDelegate>

@property (nonatomic, strong, readwrite) UISearchBar *searchBar;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) RLMRealmMonochromeLogoView *logoView;

- (void)setUpViews;

@end

@implementation RLMBrowserTableHeaderView

- (instancetype)init
{
    if (self = [self initWithStyle:RLMTableHeaderViewStyleDefault]) {
        
    }
    
    return self;
}

- (instancetype)initWithStyle:(RLMTableHeaderViewStyle)style
{
    CGFloat height = 44.0f;
    if (@available(iOS 11.0, *)) {
        height = 54.0f;
    }

    if (self = [super initWithFrame:CGRectMake(0,0,320.0f,height)]) {
        _style = style;
    }
    
    return self;
}

#pragma mark - View Management -

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    if (self.superview != nil) {
        [self setUpViews];
        self.clipsToBounds = NO;
    }
}

- (void)setUpViews
{
    if (self.style == RLMTableHeaderViewStyleDefault && !self.backgroundView) {
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, -1024.0f, self.bounds.size.width, 1024.0f)];
        self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundView.backgroundColor = RLMBROWSER_BACKGROUND_COLOR;
        [self addSubview:self.backgroundView];
    }
    
    if (self.style == RLMTableHeaderViewStyleDefault && !self.logoView) {
        CGFloat xOffset = floorf((self.bounds.size.width - kRLMRealmLogoSize) * 0.5f);
        self.logoView = [[RLMRealmMonochromeLogoView alloc] initWithFrame:CGRectMake(xOffset, -80.0f, kRLMRealmLogoSize, kRLMRealmLogoSize)];
        self.logoView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        self.logoView.strokeWidth = 2.0f;
        [self addSubview:self.logoView];
    }
    
    if (self.searchBar == nil) {
        self.searchBar = [[UISearchBar alloc] initWithFrame:self.bounds];
    }
    
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search";
    [self addSubview:self.searchBar];
}

- (void)adjustFrameForScrollView:(UIScrollView *)scrollView
{
    // Lock the search bar to the top if we try and overscroll
    CGRect frame = self.searchBar.bounds;
    if (scrollView.contentOffset.y < -scrollView.contentInset.top) {
        frame.origin.y = scrollView.contentOffset.y + scrollView.contentInset.top;
    }
    self.searchBar.frame = frame;
}

#pragma mark - UISearchbar Delegate -
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (self.searchBarTextChangedHandler) {
        self.searchBarTextChangedHandler(searchBar, searchText);
    }
}

#pragma mark - Search Bar Handling -
- (void)dismissKeyboardForSearchBar
{
    if (self.searchBar.isFirstResponder) {
        [self.searchBar resignFirstResponder];
    }
}

@end
