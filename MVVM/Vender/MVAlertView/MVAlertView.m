//
//  TCAlertView.m
//  TCAlertView
//
//  Created by Arthur on 2017/3/23.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "MVAlertView.h"
#import "UIViewExt.h"
@interface MVAlertView()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation MVAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {

    ViewBorderRadius(self, 8, 0, [UIColor clearColor]);

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, 45)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = kGlobalColor;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.text = @"添加好友";
    [self addSubview:titleLabel];
    
    UILabel *remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, titleLabel.bottom + 20, 80, 36)];
    remarkLabel.textAlignment = NSTextAlignmentLeft;
    remarkLabel.font = [UIFont systemFontOfSize:16];
    remarkLabel.text = @"备注";
    [self addSubview:remarkLabel];
    
    self.remarkField = [[UITextField alloc] initWithFrame:CGRectMake(remarkLabel.right + 10, remarkLabel.top, self.width - 30 - remarkLabel.width, 34)];
    self.remarkField.font = [UIFont systemFontOfSize:16];
    self.remarkField.layer.masksToBounds = YES;
    self.remarkField.layer.cornerRadius = 4;
    self.remarkField.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.remarkField.layer.borderWidth = 0.8;
    [self addSubview:self.remarkField];
    
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, remarkLabel.bottom + 20, 80, 36)];
    msgLabel.text = @"附加信息";
    msgLabel.font = [UIFont systemFontOfSize:16];
    msgLabel.textAlignment  = NSTextAlignmentLeft;
    [self addSubview:msgLabel];
    
    
    self.msgField = [[UITextField alloc] initWithFrame:CGRectMake(msgLabel.right + 10, msgLabel.top, self.width-msgLabel.width-30, 34)];
    self.msgField.font = [UIFont systemFontOfSize:16];
    self.msgField.layer.masksToBounds = YES;
    self.msgField.layer.cornerRadius = 4;
    self.msgField.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.msgField.layer.borderWidth = 0.8;
    [self addSubview:self.msgField];

    UIButton *pButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pButton.frame = CGRectMake(0, self.height - 50, self.width / 2, 50);
    [pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pButton setTitle:@"确定" forState:UIControlStateNormal];
    pButton.titleLabel.font = SYSTEMFONT(17);
    [pButton addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:pButton];
    
    
    UIButton *qButton = [UIButton buttonWithType:UIButtonTypeSystem];
    qButton.frame = CGRectMake(self.width/ 2, self.height - 50, self.width / 2, 50);
    [qButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [qButton setTitle:@"取消" forState:UIControlStateNormal];
    qButton.titleLabel.font = SYSTEMFONT(17);
    [qButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:qButton];
    
    [self.backgroundView addSubview:self];

}

- (UIView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:kScreenBounds];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        _backgroundView.layer.masksToBounds = YES;
    }
    return _backgroundView;
}

#pragma mark --展示view
- (void)showView {
    
    _remarkField.text = @"";
    _msgField.text = @"";
    
    [[UIApplication sharedApplication].delegate.window addSubview:self.backgroundView];
    [UIView animateWithDuration:0.1 animations:^{
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    } completion:nil];
}



#pragma mark --关闭view
- (void)closeView {
    [UIView animateWithDuration:0.1 animations:^{
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    } completion:^(BOOL finished) {
        [self.backgroundView removeFromSuperview];
    }];
}


- (void)cancelAction:(UIButton *)button {
    [self closeView];
}

- (void)sendAction:(UIButton *)button {
    [self closeView];
    if ([self.delegate respondsToSelector:@selector(requestEventAction:addStr:)]) {
        [self.delegate requestEventAction:self.remarkField.text addStr:self.msgField.text];
    }
}




@end
