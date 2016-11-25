//
//  RLMBrowserSchema.h
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface RLMBrowserSchema : RLMObject

@property (nonatomic, copy) NSString *name;

@end

RLM_ARRAY_TYPE(RLMBrowserSchema)

NS_ASSUME_NONNULL_END
