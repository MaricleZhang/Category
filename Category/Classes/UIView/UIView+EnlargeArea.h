//
//  UIView+EnlargeArea.h
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/21.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

/** 扩大UIView或者UIButton的点击区域  */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EnlargeArea)

@property (nonatomic, assign) BOOL isDefaultEnlargeArea;

- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end

NS_ASSUME_NONNULL_END
