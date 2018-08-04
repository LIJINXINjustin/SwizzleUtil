//
//  NSObject+SwizzleUtil.m
//  LiveMaster
//
//  Created by LI JINXIN on 2018/6/17.
//  Copyright © 2018年 LI JINXIN. All rights reserved.
//

#import "NSObject+SwizzleUtil.h"
#import <objc/runtime.h>

@implementation NSObject (SwizzleUtil)
+ (void)doSwizzleOneClassMethodWithClass:(Class)clz Sel:(SEL)originalSelector new:(SEL)swizzledSelector
{
    Class class = clz;
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
+ (void)doSwizzleOneInstanceMethodWithSel:(SEL)originalSelector new:(SEL)swizzledSelector
{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
