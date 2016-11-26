//
//  RLMRealmConfiguration+BrowserCompare.h
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMRealmConfiguration (BrowserCompare)

- (BOOL)RLMBrowser_isEqualToConfiguration:(RLMRealmConfiguration *)configuration;

@end
