//
//  NSObject+SwizzleUtil.h
//  LiveMaster
//
//  Created by LI JINXIN on 2018/6/17.
//  Copyright © 2018年 LI JINXIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzleUtil)
+ (void)doSwizzleOneClassMethodWithClass:(Class)clz Sel:(SEL)originalSelector new:(SEL)swizzledSelector;
+ (void)doSwizzleOneInstanceMethodWithSel:(SEL)originalSelector new:(SEL)swizzledSelector;
@end
