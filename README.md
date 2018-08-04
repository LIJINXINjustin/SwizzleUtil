# SwizzleUtil
A Simplest swizzle implementation. You can implement your swizzle code just by copy paste, or you can directly import this category to your APP.

Usage looks like this:

```objective-c
#import "NSObject+SwizzleUtil.h"

#pragma mark - Original Class
@interface DemoObject : NSObject
- (void)func:(id)obj;
@end

#pragma mark - Swizzled Class
@interface DemoObject (BugFix)
- (void)swizzledFunc:(id)obj;
@end

@implementation DemoObject (BugFix)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] doSwizzleOneInstanceMethodWithSel:NSSelectorFromString(@"func:") new:@selector(swizzledFunc:)];
    });
}

- (void)swizzledFunc:(id)obj
{
    // Do what you want
    // ....
    // Call original method
    [self swizzledFunc:obj];
}

@end
```
## Important tips about swizzle
1. Do swizzle in **-load** method of Class Category is recommended.
2. Do not swizzle non-existed method, it will cause recursively self call of this method, then your APP will get crashed.

## LICENSE
MIT License

#### Hope it helpful for you.
Any questions and suggestions please let me know. Thank you. I am **LI JINXIN**, email: 438210981@qq.com