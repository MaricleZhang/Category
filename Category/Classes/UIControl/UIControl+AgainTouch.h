//
//  UIControl+AgainTouch.h
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/20.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

/** 防止按钮重复点击  */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (AgainTouch)

@property (nonatomic, assign) NSTimeInterval touchInterval;

@end

NS_ASSUME_NONNULL_END
