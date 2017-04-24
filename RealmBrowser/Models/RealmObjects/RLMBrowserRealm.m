//
//  RLMBrowserRealm.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserRealm.h"

@implementation RLMBrowserRealm

#pragma mark - Realm Configuration -
- (RLMRealmConfiguration *)realmConfiguration
{
    RLMRealmConfiguration *configuration = [[RLMRealmConfiguration alloc] init];
    
    // Set the appropriate source for the Realm
    if (self.filePath.length) { // Standard on disk
        configuration.fileURL = [NSURL fileURLWithPath:self.absoluteFilePath];
    }
    else if (self.inMemoryIdentifier) { // In-Memory Realm
        configuration.inMemoryIdentifier = self.inMemoryIdentifier;
    }
    else if (self.syncURL) { // Remote sync Realm
        RLMSyncConfiguration *syncConfig = [[RLMSyncConfiguration alloc] initWithUser:[RLMSyncUser currentUser]
                                                                             realmURL:[NSURL URLWithString:self.syncURL]];
        configuration.syncConfiguration = syncConfig;
    }
    
    // Set additional state that may be needed to open this Realm
    configuration.encryptionKey = self.encryptionKey;
    configuration.readOnly = self.readOnly;
    
    // Set the internal dynamic flag that lets us open it without a schema
    [configuration setValue:@(YES) forKey:@"dynamic"];
    
    return configuration;
}

#pragma mark - Queries -
+ (RLMResults *)allBrowserRealmObjectsInRealm:(RLMRealm *)realm forConfiguration:(RLMRealmConfiguration *)configuration
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"filePath == %@ AND inMemoryIdentifier == %@ AND syncURL == %@",
                              [RLMBrowserRealm relativeFilePathFromAbsolutePath:configuration.fileURL.path],
                              configuration.inMemoryIdentifier,
                              configuration.syncConfiguration.realmURL.absoluteString];

    return [[RLMBrowserRealm allObjectsInRealm:realm] objectsWithPredicate:predicate];
}

#pragma mark - File Path Formatting -

+ (NSString *)contentDirectoryPath
{
    static NSString *contentDirectoryPath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *documentsDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                               inDomains:NSUserDomainMask] lastObject] path];
        contentDirectoryPath = [documentsDirectory stringByDeletingLastPathComponent];
    });
    
    return contentDirectoryPath;
}

+ (NSString *)relativeFilePathFromAbsolutePath:(NSString *)path
{
    return [path stringByReplacingOccurrencesOfString:[RLMBrowserRealm contentDirectoryPath] withString:@""];
}

- (NSString *)absoluteFilePath
{
    return [[RLMBrowserRealm contentDirectoryPath] stringByAppendingPathComponent:self.filePath];
}

#pragma mark - Realm Overrides -

+ (NSArray<NSString *> *)indexedProperties
{
    return @[@"filePath", @"inMemoryIdentifier", @"syncURL"];
}

+ (BOOL)shouldIncludeInDefaultSchema
{
    return NO;
}

+ (NSString *)primaryKey
{
    return @"uuid";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{
                @"uuid": [NSUUID UUID].UUIDString,
                @"readOnly": @0,
                @"schemaVersion": @-1
            };
}

#pragma mark - External Accessors -
- (RLMBrowserRealmType)type
{
    if (self.syncURL.length > 0) {
        return RLMBrowserRealmTypeSync;
    }
    else if (self.inMemoryIdentifier.length > 0) {
        return RLMBrowserRealmTypeInMemory;
    }

    return RLMBrowserRealmTypeLocal;
}

@end
