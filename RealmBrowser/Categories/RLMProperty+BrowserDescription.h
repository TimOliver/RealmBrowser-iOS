//
//  RLMProperty+RLMBrowser_formattedDescription.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>
#import <Foundation/Foundation.h>

@interface RLMProperty (BrowserDescription)

- (NSString *)RLMBrowser_typeDescription;
- (NSString *)RLMBrowser_configurationDescription;

@end
