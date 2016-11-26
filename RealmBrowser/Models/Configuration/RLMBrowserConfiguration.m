//
//  RLMBrowserConfiguration.m
//  iComics
//
//  Created by Tim Oliver on 22/11/16.
//  Copyright © 2016 Timothy Oliver. All rights reserved.
//

#import "RLMBrowserConfiguration.h"
#import "RLMBrowserConstants.h"

#import "RLMBrowserList.h"
#import "RLMBrowserRealm.h"
#import "RLMBrowserSchema.h"

@implementation RLMBrowserConfiguration

+ (RLMRealmConfiguration *)configuration
{
    // Get Application Support directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    
    // Create a uniquely named folder to store the Browser Realm
    NSString *browserRealmDirectory = [applicationSupportDirectory stringByAppendingPathComponent:kRLMBrowserIdentifier];
    [[NSFileManager defaultManager] createDirectoryAtPath:browserRealmDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    
    // Build the final file path to the Realm file
    NSString *browserRealmPath = [browserRealmDirectory stringByAppendingPathComponent:@"browser.realm"];
    
    // Generate the Realm Configuration
    RLMRealmConfiguration *configuration = [[RLMRealmConfiguration alloc] init];
    configuration.fileURL = [NSURL fileURLWithPath:browserRealmPath];
    configuration.objectClasses = @[[RLMBrowserSchema class], [RLMBrowserRealm class], [RLMBrowserList class]];
    configuration.deleteRealmIfMigrationNeeded = YES;
    return configuration;
}

@end
