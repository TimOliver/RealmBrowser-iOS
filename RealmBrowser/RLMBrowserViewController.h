//
//  RLMBrowserViewController.h
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TOSplitViewController/TOSplitViewController.h>

@interface RLMBrowserViewController : TOSplitViewController

+ (void)registerAppGroupRealmAtRelativePath:(NSString *)path forGroupIdentifier:(NSString *)identifier;

- (void)show;
+ (void)show;

@end
