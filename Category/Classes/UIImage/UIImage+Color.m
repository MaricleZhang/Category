//
//  UIImage+Color.m
//  CategoryDemo
//
//  Created by MaricleZhang on 2019/3/21.
//  Copyright © 2019 MaricleZhang. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [[self class] p_imageWithColor:color size:CGSizeMake(1.f, 1.f)];
}

+ (UIImage *)p_imageWithColor:(UIColor *)color size:(CGSize)targetSize {
    CGRect rect = CGRectMake(0.0f, 0.0f, targetSize.width, targetSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageColors:(NSArray*)colors size:(CGSize)size gradientDirection:(ImageColorGradientDirection)gradientDirection
{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 1.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, 0.0);

    if (gradientDirection == ImageColorGradientDirectionHorizontal)
    {
        end = CGPointMake(size.width, 0.0);
    }
    else
    {
        end = CGPointMake(0, size.width);
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return image;
}
@end
