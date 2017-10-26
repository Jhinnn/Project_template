//
//  Util.m
//  AddCartDemo
//
//  Created by YYKJ on 2017/10/19.
//  Copyright © 2017年 YYKJ. All rights reserved.
//

#import "Util.h"

@implementation Util

/** Label 颜色 字号*/
+ (UILabel *)createLabelWithTextColor:(UIColor *)textColor
                             fontSize:(CGFloat )size{
    UILabel *label = [[UILabel alloc] init];
    [label setTextColor:textColor];
    [label setFont:[UIFont systemFontOfSize:size]];
    return label;
    
}

/** Label 文字 字号*/
+ (UILabel *)createLabelWithText:(NSString *)text
                        fontSize:(CGFloat )size{
    
    UILabel *label = [[UILabel alloc]init];
    [label setText:text];
    [label setFont:[UIFont systemFontOfSize:size]];
    return label;
}

/** Label 字色 文字 字号*/
+ (UILabel *)createLabelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                        fontSize:(CGFloat )size{
    
    UILabel *label = [[UILabel alloc]init];
    [label setText:text];
    [label setTextColor:textColor];
    [label setFont:[UIFont systemFontOfSize:size]];
    return label;
}

/** Label 字色 文字 字号 对其*/
+ (UILabel *)createLabelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                        fontSize:(CGFloat )size
                   textAlignment:(NSTextAlignment)textAlignment{
    
    UILabel *label = [[UILabel alloc]init];
    [label setText:text];
    [label setTextColor:textColor];
    [label setFont:[UIFont systemFontOfSize:size]];
    [label setTextAlignment:textAlignment];
    return label;
}

+(UILabel *)createLabelWithBackgroundColor:(UIColor *)backgroundColor
                                 textColor:(UIColor *)textColor
                             textAlignment:(NSTextAlignment)textAlignment
                             numberOfLines:(NSInteger )numberOfLines
                                      text:(NSString *)text
                                  fontSize:(CGFloat)size
{
    UILabel *label = [[UILabel alloc]init];
    return label;
    
}


/** UIImageView  iamge*/
+(UIImageView *)createImageViewWithImage:(UIImage *)image{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:image];
    return imageView;
}

/** UIView  颜色*/
+ (UIView *)createViewWithBackgroundColor:(UIColor *)backgroundColor{
    
    UIView *view = [[UIView alloc]init];
    [view setBackgroundColor:backgroundColor];
    return view;
}

#pragma mark - 设置控件圆角
+ (void )makeCorner:(CGFloat)corner
               view:(UIView *)view{
    
    CALayer *layer = view.layer;
    layer.cornerRadius = corner;
    layer.masksToBounds = YES;
    layer.shouldRasterize = YES;
    layer.rasterizationScale = [UIScreen mainScreen].scale;
}

#pragma mark - 给控件添加单击手势
+ (void)addClickEvent:(id)target
               action:(SEL)action
                owner:(UIView *)view{
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    gesture.numberOfTouchesRequired = 1;
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:gesture];
    
}

#pragma mark - 给控件设置边框的宽度和颜色
+ (void)makeWidth:(CGFloat)width
             view:(UIView *)view
            color:(UIColor *)color{
    
    CALayer * fileslayer = [view layer];
    fileslayer.borderColor = [color CGColor];
    fileslayer.borderWidth = width;
    
}

#pragma mark 底部灰色线条
+(void)setFoursides:(UIView *)view
          Direction:(NSString *)dirction
              sizeW:(CGFloat)sizew{
    
    if ([dirction  isEqual: @"left"]) {
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, sizew)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"right"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width - 0.5, 0, 0.5, sizew)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"top"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizew, 0.5)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"bottom"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - 0.5, sizew, 0.5)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
    }
}

+ (void)setUILabel:(UILabel *)label
              Data:(NSString *)string
           SetData:(NSString *)setstring
             Color:(UIColor *)color
              Font:(CGFloat)font
         Underline:(BOOL)isbool{
    
    NSRange str = [label.text rangeOfString:setstring];
    if (str.location != NSNotFound) {
        
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:label.text];
        [str1 addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(string.length,setstring.length)]; //设置字体颜色
        [str1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(string.length,setstring.length)];
        if (isbool) {
            
            [str1 addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(string.length,setstring.length)];
        }
        label.attributedText = str1;
    }
}


@end
