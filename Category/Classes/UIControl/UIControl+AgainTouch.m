//
//  UIControl+AgainTouch.m
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/20.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

#import "UIControl+AgainTouch.h"
#import <objc/runtime.h>

const void *kEventIntervalKey = &kEventIntervalKey;
const void *kIgnoreEventKey = &kIgnoreEventKey;

@implementation UIControl (AgainTouch)

+ (void)load
{
    SEL originSelector = @selector(sendAction:to:forEvent:);
    Method originMethod = class_getInstanceMethod(self, originSelector);
    
    SEL swizzleSelector = @selector(mz_sendAction:to:forEvent:);
    Method swizzleMethod = class_getInstanceMethod(self, swizzleSelector);
    
    if (class_addMethod(self, originSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod)))
    {
        class_replaceMethod(self, swizzleSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else
    {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
}

- (void)mz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.isIgnore) return;
    
    if (self.touchInterval > 0)
    {
        self.isIgnore = YES; // 改变为YES，这样下次点击就会直接return
        [self performSelector:@selector(setIsIgnore:) withObject:@(NO) afterDelay:self.touchInterval]; // 执行完毕后重新设置为NO
    }
    
    [self mz_sendAction:action to:target forEvent:event];
}

#pragma makrk - Association

- (NSTimeInterval)touchInterval
{
    return [objc_getAssociatedObject(self, kEventIntervalKey) doubleValue];
}

- (void)setTouchInterval:(NSTimeInterval)touchInterval
{
    objc_setAssociatedObject(self, kEventIntervalKey, @(touchInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnore
{
    return [objc_getAssociatedObject(self, kIgnoreEventKey) boolValue];
}

- (void)setIsIgnore:(BOOL)isIgnore
{
    objc_setAssociatedObject(self, kIgnoreEventKey, @(isIgnore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
