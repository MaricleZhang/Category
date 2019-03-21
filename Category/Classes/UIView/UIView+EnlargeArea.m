//
//  UIView+EnlargeArea.m
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/21.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

#import "UIView+EnlargeArea.h"
#import <objc/runtime.h>

@implementation UIView (EnlargeArea)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;
static char defaultEnlargeAreaKey;

- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden||!self.isUserInteractionEnabled) {
        return NO;
    }
    
    if (self.isDefaultEnlargeArea)
    {
        CGRect bounds = self.bounds;
        // 若原热区小于44x44，则放大热区，否则保持原大小不变
        CGFloat deltaW = MAX(44 - bounds.size.width, 0);
        CGFloat deltaH = MAX(44 - bounds.size.height, 0);
        bounds = CGRectInset(bounds, -deltaW * 0.5, -deltaH * 0.5);
        return CGRectContainsPoint(bounds, point);
    }

    CGRect responseArea = [self enlargedRect];
    return CGRectContainsPoint(responseArea, point);
}

#pragma mark - Setter/Getter

- (BOOL)isDefaultEnlargeArea
{
    return [objc_getAssociatedObject(self, &defaultEnlargeAreaKey) boolValue];
}

- (void)setIsDefaultEnlargeArea:(BOOL)isDefaultEnlargeArea
{
    objc_setAssociatedObject(self, &defaultEnlargeAreaKey, @(isDefaultEnlargeArea), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
