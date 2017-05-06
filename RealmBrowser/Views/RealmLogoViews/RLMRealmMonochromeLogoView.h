//
//  RLMRealmMonochromeLogoView.h
//  RealmBrowser
//
//  Created by Tim Oliver on 24/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLMRealmMonochromeLogoView : UIView

@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, strong) UIColor *strokeColor;

@property (nonatomic, readonly) UIImage *image;

- (UIImage *)imageInRect:(CGRect)rect;

@end
