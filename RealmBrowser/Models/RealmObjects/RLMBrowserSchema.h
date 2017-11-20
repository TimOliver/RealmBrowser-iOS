//
//  RLMBrowserSchema.h
//
//  Copyright 2016-2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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

/** Export a copy of the secondary proeprty names as strings */
@property (nonatomic, readonly) NSArray<NSString *> *secondaryPropertyNameStrings;

/** Given a list of properties, work out the most appropriate for display as the main property */
+ (NSString *)preferredPropertyClassNameFromProperties:(NSArray *)properties;

/** Given a list of properties, work out the best ones for display under the main property. */
+ (NSArray *)preferredSecondaryPropertyClassNamesFromProperties:(NSArray *)properties maximumCount:(NSInteger)maximumCount excludingPropertyClassName:(NSString *)excludedName;

@end

RLM_ARRAY_TYPE(RLMBrowserSchema)

NS_ASSUME_NONNULL_END
