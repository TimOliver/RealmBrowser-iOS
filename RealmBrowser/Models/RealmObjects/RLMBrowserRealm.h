//
//  RLMBrowserRealm.h
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import <Realm/Realm.h>
#import "RLMBrowserSchema.h"

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
@property (nonatomic, copy) NSString *syncUserURL;

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

/* An appropriately formatted configuration file to open this Realm. */
@property (nonatomic, readonly) RLMRealmConfiguration *realmConfiguration;

/* The type of Realm container this instance reporesents */
@property (nonatomic, readonly) RLMBrowserRealmType type;

/* Convert any absolute file paths to relative before saving */
+ (NSString *)relativeFilePathFromAbsolutePath:(NSString *)path;

/* Query for any browser realm objects matching a configuration object */
+ (RLMResults *)allBrowserRealmObjectsInRealm:(RLMRealm *)realm forConfiguration:(RLMRealmConfiguration *)configuration;

@end

RLM_ARRAY_TYPE(RLMBrowserRealm)

NS_ASSUME_NONNULL_END
