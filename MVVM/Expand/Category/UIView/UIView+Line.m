//
//  UIView+Line.m
//  YiyiAPP
//
//  Created by Visitor on 2016/12/9.
//  Copyright © 2016年 yiyi. All rights reserved.
//

#import "UIView+Line.h"
#import <objc/runtime.h>

static CGFloat const irrelevant = 8989.0f;

@implementation UIView (Line)

@dynamic topBorder, leftBorder, rightBorder, bottomBorder;

- (void)setTopBorder:(UIView *)topBorder {
    objc_setAssociatedObject(self, @selector(topBorder), topBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)topBorder {
    return objc_getAssociatedObject(self, @selector(topBorder));
}

- (void)setLeftBorder:(UIView *)leftBorder {
    objc_setAssociatedObject(self, @selector(leftBorder), leftBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)leftBorder {
    return objc_getAssociatedObject(self, @selector(leftBorder));
}

- (void)setRightBorder:(UIView *)rightBorder {
    objc_setAssociatedObject(self, @selector(rightBorder), rightBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)rightBorder {
    return objc_getAssociatedObject(self, @selector(rightBorder));
}

- (UIView *)bottomBorder {
    return objc_getAssociatedObject(self, @selector(rightBorder));
}

- (void)setBottomBorder:(UIView *)bottomBorder {
    objc_setAssociatedObject(self, @selector(bottomBorder), bottomBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    self.topBorder = [self addTopLineWithColor:color width:borderWidth offset:CGPointMake(0, 0)];
}

- (void)addLeftBorderWithColor: (UIColor *)color width:(CGFloat)borderWidth {
    self.leftBorder = [self addLeftLineWithColor:color width:borderWidth offset:CGPointMake(0, 0)];
}

- (void)addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    self.bottomBorder = [self addBottomLineWithColor:color width:borderWidth offset:CGPointMake(0, 0)];
}

- (void)addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    self.rightBorder = [self addRightLineWithColor:color width:borderWidth offset:CGPointMake(0, 0)];
}

- (UIView *)addBottomLineWithColor:(UIColor *)color width:(CGFloat)borderWidth offset:(CGPoint)offset {
    return [self addHorizontalLineWithColor:color width:borderWidth offset:offset bottomOffset:0];
}

- (UIView *)addTopLineWithColor:(UIColor *)color width:(CGFloat)borderWidth offset:(CGPoint)offset {
    return [self addHorizontalLineWithColor:color width:borderWidth offset:offset topOffset:0];
}

- (UIView *)addLeftLineWithColor:(UIColor *)color width:(CGFloat)borderWidth offset:(CGPoint)offset {
    return [self addVerticalLineWithColor:color width:borderWidth offset:offset leftOffset:0];
}

- (UIView *)addRightLineWithColor:(UIColor *)color width:(CGFloat)borderWidth offset:(CGPoint)offset {
    return [self addVerticalLineWithColor:color width:borderWidth offset:offset rightOffset:0];
}

- (UIView *)addHorizontalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset topOffset:(CGFloat)topOffet {
    return [self addLineWithColor:color width:width leftOffset:offset.x rightOffset:offset.y topOffset:topOffet bottomOffset:irrelevant];
}

- (UIView *)addHorizontalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset bottomOffset:(CGFloat)bottomOffet {
    return [self addLineWithColor:color width:width leftOffset:offset.x rightOffset:offset.y topOffset:irrelevant bottomOffset:bottomOffet];}

- (UIView *)addVerticalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset leftOffset:(CGFloat)leftOffet {
    return [self addLineWithColor:color width:width leftOffset:leftOffet rightOffset:irrelevant topOffset:offset.x bottomOffset:offset.y];
}

- (UIView *)addVerticalLineWithColor:(UIColor *)color width:(CGFloat)width offset:(CGPoint)offset rightOffset:(CGFloat)rightOffet {
    return [self addLineWithColor:color width:width leftOffset:irrelevant rightOffset:rightOffet topOffset:offset.x bottomOffset:offset.y];
}

- (UIView *)addLineWithColor:(UIColor *)color width:(CGFloat)width leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset bottomOffset:(CGFloat)bottomOffset {
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        if (leftOffset == irrelevant) {
            make.width.equalTo(@(width));
            make.right.equalTo(@(rightOffset));
            make.top.equalTo(@(topOffset));
            make.bottom.equalTo(@(bottomOffset));
        }
        if (rightOffset == irrelevant) {
            make.width.equalTo(@(width));
            make.left.equalTo(@(leftOffset));
            make.top.equalTo(@(topOffset));
            make.bottom.equalTo(@(bottomOffset));
        }
        if (topOffset == irrelevant) {
            make.height.equalTo(@(width));
            make.left.equalTo(@(leftOffset));
            make.right.equalTo(@(rightOffset));
            make.bottom.equalTo(@(bottomOffset));
        }
        if (bottomOffset == irrelevant) {
            make.height.equalTo(@(width));
            make.left.equalTo(@(leftOffset));
            make.right.equalTo(@(rightOffset));
            make.top.equalTo(@(topOffset));
        }
    }];
    return line;
}

@end
