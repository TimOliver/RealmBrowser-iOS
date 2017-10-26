//
//  RLMBrowserObjectProperty.h
//  RealmBrowser
//
//  Created by Tim Oliver on 12/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface RLMBrowserObjectProperty : RLMObject

@property (nonatomic, copy) NSString *name;

@end

RLM_ARRAY_TYPE(RLMBrowserObjectProperty)

NS_ASSUME_NONNULL_END
