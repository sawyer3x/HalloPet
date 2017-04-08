//
//  UIColor+JGColor.h
//  PetMarginMerchant
//
//  Created by jingui on 15/5/20.
//  Copyright (c) 2015年 jingui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JGColor)
//比如：#FF3388、0X22FF11 等颜色字符串转换到RGB
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

// 默认字体颜色
+ (UIColor *)defalutFontColor;

// 默认橙色颜色
+ (UIColor *)defalutOrangeColor;

// 默认蓝色颜色
+ (UIColor *)defalutBlueColor;

// 默认红色颜色
+ (UIColor *)defalutRedColor;

//默认绿色
+ (UIColor *)defalutGreenColor;

// 默认line颜色
+ (UIColor *)defalutLineColor;

//默认系统色
+ (UIColor *)defalutTinColor;

@end
