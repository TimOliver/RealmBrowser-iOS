//
//  RLMBrowserAppGroupRealm.h
//  DZNEmptyDataSet
//
//  Created by Tim Oliver on 8/29/17.
//

#import <Realm/Realm.h>

@interface RLMBrowserAppGroupRealm : RLMObject

@property (nonatomic, copy) NSString *groupIdentifier;
@property (nonatomic, copy) NSString *realmFilePath;

@end

