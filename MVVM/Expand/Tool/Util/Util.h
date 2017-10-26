//
//  Util.h
//  AddCartDemo
//
//  Created by YYKJ on 2017/10/19.
//  Copyright © 2017年 YYKJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Util : NSObject

// 创建控件的工厂 ，将特殊的元素传入 生产相对应的元素

#pragma mark --------- UILabel ---------

/** Label 颜色 字号*/
+ (UILabel *)createLabelWithTextColor:(UIColor *)textColor
                             fontSize:(CGFloat )size;

/** Label 文字 字号*/
+ (UILabel *)createLabelWithText:(NSString *)text
                        fontSize:(CGFloat )size;

/** Label 字色 文字 字号*/
+ (UILabel *)createLabelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                        fontSize:(CGFloat )size;

/** Label 字色 文字 字号 对其*/
+ (UILabel *)createLabelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                        fontSize:(CGFloat )size
                   textAlignment:(NSTextAlignment)textAlignment;

#pragma mark --------- UIImageView ---------

/** UIImageView  iamge*/
+(UIImageView *)createImageViewWithImage:(UIImage *)image;

#pragma mark --------- UIView ---------

/** UIView  颜色*/
+ (UIView *)createViewWithBackgroundColor:(UIColor *)backgroundColor;


/**
 *  给某个控件设圆角
 *
 *  @param corner  圆角度
 *  @param view    要切圆角的控件
 */
+ (void)makeCorner:(CGFloat)corner
              view:(UIView *)view;

/**
 *  添加单击手势
 *
 *  @param target  target
 *  @param action  SEL
 *  @param view    控件名
 */
+ (void)addClickEvent:(id)target
               action:(SEL)action
                owner:(UIView *)view;

/**
 *  给控件添加边框
 *
 *  @param width  边框宽度
 *  @param view    控件名
 *  @param color   边框颜色
 */
+ (void)makeWidth:(CGFloat)width
             view:(UIView *)view
            color:(UIColor *)color;

/**
 *  控件边缘灰色线条
 *
 *  @param view      控件名
 *  @param dirction  线条位置
 *  @param sizew     控件宽度
 */
+ (void)setFoursides:(UIView *)view
           Direction:(NSString *)dirction
               sizeW:(CGFloat)sizew;

/** 设置UILabel的不同颜色与大小*/
+ (void)setUILabel:(UILabel *)label
              Data:(NSString *)string
           SetData:(NSString *)setstring
             Color:(UIColor *)color
              Font:(CGFloat)font
         Underline:(BOOL)isbool;



@end
