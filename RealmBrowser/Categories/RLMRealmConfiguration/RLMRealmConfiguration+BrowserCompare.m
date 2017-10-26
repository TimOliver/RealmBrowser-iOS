//
//  RLMRealmConfiguration+BrowserCompare.m
//  RealmBrowser
//
//  Created by Tim Oliver on 25/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "RLMRealmConfiguration+BrowserCompare.h"

@implementation RLMRealmConfiguration (BrowserCompare)

- (BOOL)RLMBrowser_isEqualToConfiguration:(RLMRealmConfiguration *)configuration
{
    if ([configuration.fileURL isEqual:self.fileURL]) {
        return YES;
    }
    else if ([configuration.inMemoryIdentifier isEqualToString:self.inMemoryIdentifier]) {
        return YES;
    }
    
    else if ([configuration.syncConfiguration isEqual:self.syncConfiguration]) {
        return YES;
    }

    return NO;
}

@end
