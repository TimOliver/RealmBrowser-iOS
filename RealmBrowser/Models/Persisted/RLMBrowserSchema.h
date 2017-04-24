//
//  RLMBrowserSchema.h
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import <Realm/Realm.h>

#import "RLMBrowserObjectProperty.h"

NS_ASSUME_NONNULL_BEGIN

/** A basic representation of each object schema backed by the parent Realm */
@interface RLMBrowserSchema : RLMObject

/** The name of the class that's being backed by this object schema. */
@property (nonatomic, copy) NSString *className;

/** The number of objects persisted in this object */
@property (nonatomic, assign) NSInteger numberOfObjects;

/** The preferred property to represent objects from this schema. (e.g. 'name' over 'uuid') */
@property (nonatomic, copy) NSString *preferredPropertyName;

/** The preferred secondary names to be displayed alongside the primary one */
@property (nonatomic, strong) RLMArray<RLMBrowserObjectProperty *><RLMBrowserObjectProperty> *secondaryPropertyNames;

/** Given a list of properties, work out the most appropriate for display as the main property */
+ (NSString *)preferredPropertyClassNameFromProperties:(NSArray *)properties;

/** Given a list of properties, work out the best ones for display under the main property. */
+ (NSArray *)preferredSecondaryPropertyClassNamesFromProperties:(NSArray *)properties maximumCount:(NSInteger)maximumCount excludingPropertyClassName:(NSString *)excludedName;

@end

RLM_ARRAY_TYPE(RLMBrowserSchema)

NS_ASSUME_NONNULL_END
