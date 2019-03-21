//
//  UIImage+Color.h
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/21.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ImageColorGradientDirection)
{
    ImageColorGradientDirectionHorizontal,    // 水平方向
    ImageColorGradientDirectionVertical,      // 竖直方向
};
@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageColors:(NSArray*)colors size:(CGSize)size gradientDirection:(ImageColorGradientDirection)gradientDirection;

@end

NS_ASSUME_NONNULL_END
