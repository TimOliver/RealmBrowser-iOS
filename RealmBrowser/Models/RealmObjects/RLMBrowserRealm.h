//
//  RLMBrowserRealm.h
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
#import "RLMBrowserSchema.h"
#import "RLMBrowserAppGroupRealm.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RLMBrowserRealmType) {
    RLMBrowserRealmTypeLocal,
    RLMBrowserRealmTypeInMemory,
    RLMBrowserRealmTypeSync
};

/* Snapshot data from the `RLMRealmConfiguration` of a Realm opened at runtime */
@interface RLMBrowserRealm : RLMObject

/* The objet primary key */
@property (nonatomic, copy) NSString *uuid;

/* A displayable string identifying this Realm */
@property (nonatomic, copy) NSString *name;

/* File/Memory/Web Location of the Realm */
@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, copy) NSString *inMemoryIdentifier;
@property (nonatomic, copy) NSString *syncURL;
@property (nonatomic, copy) NSString *syncUserIdentifier;

/* Encryption key of this Realm */
@property (nonatomic, copy) NSData *encryptionKey;

/* Read-Write state of Realm file */
@property (nonatomic, assign) BOOL readOnly;

/* A copy of the schema version */
@property (nonatomic, assign) long long schemaVersion;

/* The schema in this Realm file */
@property (nonatomic, strong) RLMArray<RLMBrowserSchema *><RLMBrowserSchema> *schema;

/* The absolute file path to this Realm */
@property (nonatomic, readonly) NSString *absoluteFilePath;

/* A formatted description of its location */
@property (nonatomic, readonly) NSString *formattedLocation;

/* An appropriately formatted configuration file to open this Realm. */
@property (nonatomic, readonly) RLMRealmConfiguration *realmConfiguration;

/* The type of Realm container this instance reporesents */
@property (nonatomic, readonly) RLMBrowserRealmType type;

/* If an app group, this is linked to give us context to derive the file path */
@property (nonatomic, strong) RLMBrowserAppGroupRealm *appGroup;

/* A displayable string identifying the type of this Realm */
@property (nonatomic, readonly) NSString *localizedType;

/* Convert any absolute file paths to relative before saving */
+ (NSString *)relativeFilePathFromAbsolutePath:(NSString *)path;

/* Query for any browser realm objects matching a configuration object */
+ (RLMResults *)allBrowserRealmObjectsInRealm:(RLMRealm *)realm forConfiguration:(RLMRealmConfiguration *)configuration;

@end

RLM_ARRAY_TYPE(RLMBrowserRealm)

NS_ASSUME_NONNULL_END
