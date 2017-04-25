//
//  RLMRealm+RLMRealm_UpdateCapture.h
//  RealmBrowser
//
//  Created by Tim Oliver on 4/24/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMRealm (BrowserCaptureWrites)

+ (void)RLMBrowser_updateSchemaObjectCountForRealmWithConfiguration:(RLMRealmConfiguration *)configuration;

@end
