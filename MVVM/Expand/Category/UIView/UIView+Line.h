//
//  UIView+Line.h
//  YiyiAPP
//
//  Created by Visitor on 2016/12/9.
//  Copyright © 2016年 yiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Line)

@property (nonatomic, strong) UIView * topBorder;

@property (nonatomic, strong) UIView * leftBorder;

@property (nonatomic, strong) UIView * bottomBorder;

@property (nonatomic, strong) UIView * rightBorder;

- (void)addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)addLeftBorderWithColor: (UIColor *)color width:(CGFloat)borderWidth;

- (void)addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (UIView *)addBottomLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset;

- (UIView *)addTopLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset;

- (UIView *)addLeftLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset;

- (UIView *)addRightLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset;

- (UIView *)addHorizontalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset topOffset:(CGFloat)topOffet;

- (UIView *)addHorizontalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset bottomOffset:(CGFloat)bottomOffet;

- (UIView *)addVerticalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset leftOffset:(CGFloat)leftOffet;

- (UIView *)addVerticalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset rightOffset:(CGFloat)rightOffet;

@end
