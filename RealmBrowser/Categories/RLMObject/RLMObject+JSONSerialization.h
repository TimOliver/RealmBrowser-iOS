//
//  RLMObject+JSONSerialization.h
//  RealmBrowser
//
//  Created by Tim Oliver on 5/9/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>
#import <Foundation/Foundation.h>

@interface RLMObject (JSONSerialization)

- (NSDictionary *)RLMBrowser_toJSONDictionary;
- (NSString *)RLMBrowser_toJSONStringWithError:(NSError **)error;

@end
