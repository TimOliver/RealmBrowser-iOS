//
//  RLMBrowserRealm.m
//  iComics
//
//  Created by Tim Oliver on 21/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserRealm.h"

@implementation RLMBrowserRealm

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

@end
