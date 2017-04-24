//
//  RLMRealm+RLMRealm_UpdateCapture.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/24/17.
//  Copyright © 2017 Tim Oliver. All rights reserved.
//

#import "RLMRealm+UpdateCapture.h"
#import <objc/runtime.h>

@implementation RLMRealm (UpdateCapture)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = object_getClass((id)self);
//
//        SEL originalSelector = @selector(realmWithConfiguration:error:);
//        SEL swizzledSelector = @selector(RLMBrowser_realmWithConfiguration:error:);
//
//        Method originalMethod = class_getClassMethod(class, originalSelector);
//        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
//
//        BOOL didAddMethod =  class_addMethod(class, originalSelector,
//                                             method_getImplementation(swizzledMethod),
//                                             method_getTypeEncoding(swizzledMethod));
//
//        if (didAddMethod) {
//            class_replaceMethod(class, swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//}
//
//+ (void)RLMBrowser_commitWriteTransaction
//{
//
//}

@end
