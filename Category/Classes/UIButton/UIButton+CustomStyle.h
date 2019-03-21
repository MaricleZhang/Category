//
//  UIButton+CustomStyle.h
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/20.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CustomStyle)

typedef NS_ENUM(NSUInteger, CustomButtonStyle) {
    
    CustomButtonStyleTop,       // image在上，label在下
    CustomButtonStyleLeft,      // image在左，label在右
    CustomButtonStyleleBottom,  // image在下，label在上
    CustomButtonStyleRight      // image在右，label在左
};

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 *  tips : 需先确定lable和image显示内容
 */
- (void)layoutButtonWithEdgeInsetsStyle:(CustomButtonStyle)style
                        imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
