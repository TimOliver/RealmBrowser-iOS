//
//  RLMBrowserConfiguration.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserConfiguration.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

@implementation RLMBrowserConfiguration

+ (RLMRealmConfiguration *)configuration
{
    // Get Application Support directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    
    NSString *browserRealmDirectory = [applicationSupportDirectory stringByAppendingPathComponent:@"io.realm.browser"];
    [[NSFileManager defaultManager] createDirectoryAtPath:browserRealmDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString *browserRealmPath = [browserRealmDirectory stringByAppendingPathComponent:@"browser.realm"];
    
    RLMRealmConfiguration *configuration = [[RLMRealmConfiguration alloc] init];
    configuration.fileURL = [NSURL fileURLWithPath:browserRealmPath];
    configuration.objectClasses = @[[RLMBrowserRealm class], [RLMBrowserSchema class]];
    configuration.deleteRealmIfMigrationNeeded = YES;
    return configuration;
}

@end
