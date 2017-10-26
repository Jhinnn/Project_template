//
//  BaseViewController.h
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  BBBaseViewControllerDataSource<NSObject>

@optional
- (NSMutableAttributedString *)setTitle;
- (UIButton *)set_leftButton;
- (UIButton *)set_rightButton;
- (UIColor *)set_colorBackground;
- (CGFloat)set_navigationHeight;
- (UIView *)set_bottomView;
- (UIImage *)navBackgroundImage;
- (UIImage *)set_leftBarButtonItemWithImage;
- (UIImage *)set_rightBarButtonItemWithImage;
@end


@protocol BBBaseViewControllerDelegate <NSObject>

@optional
- (void)left_button_event:(UIButton *)sender;
- (void)right_button_event:(UIButton *)sender;
- (void)title_click_event:(UIView *)sender;
@end

@interface BaseViewController : UIViewController<BBBaseViewControllerDataSource , BBBaseViewControllerDelegate>

- (void)setContentAlpha:(CGFloat)alpha;
- (void)changeNavigationBarHeight:(CGFloat)offset;
- (void)changeNavigationBarTranslationY:(CGFloat)translationY;
- (void)set_Title:(NSMutableAttributedString *)title;

- (void)reloadSelectedItemView;

@end
