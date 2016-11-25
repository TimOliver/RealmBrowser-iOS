//
//  Person.h
//  RealmBrowser
//
//  Created by Tim Oliver on 24/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>

@interface Person : RLMObject

@property NSInteger userID;
@property NSString *name;
@property NSString *email;
@property NSInteger age;
@property CGFloat height;
@property CGFloat weight;
@property NSString *gender;
@property NSString *website;

+ (NSArray<Person *> *)generateTestData;

@end
