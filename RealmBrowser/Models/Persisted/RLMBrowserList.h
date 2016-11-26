//
//  RLMBrowserList.h
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>
#import "RLMBrowserRealm.h"

NS_ASSUME_NONNULL_BEGIN

@interface RLMBrowserList : RLMObject

/** The default Realm for this app */
@property (nonatomic, strong) RLMBrowserRealm *defaultRealm;

/** Any Realms the user explicitly favorited */
@property (nonatomic, strong) RLMArray<RLMBrowserRealm *><RLMBrowserRealm> *starredRealms;

/** The remaining list of Realms, ordered by most recently touched */
@property (nonatomic, strong) RLMArray<RLMBrowserRealm *><RLMBrowserRealm> *orderedRealms;

@end

NS_ASSUME_NONNULL_END
