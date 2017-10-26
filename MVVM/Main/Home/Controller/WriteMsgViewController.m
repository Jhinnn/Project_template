//
//  WriteMsgViewController.m
//  MVVM
//
//  Created by Arthur on 2017/10/25.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "WriteMsgViewController.h"

@interface WriteMsgViewController ()

@property (nonatomic, strong) UITextField *bottomTextField;
@end

@implementation WriteMsgViewController {
    UILabel *_timeLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"scrollView展示";
    

    _timeLabel = [Util createLabelWithText:@"2017年10月25日17:20:56" textColor:kGlobalColor fontSize:20 textAlignment:NSTextAlignmentCenter];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    _timeLabel.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.scrollView).with.offset(10);
        make.centerX.equalTo(self.scrollView);
        make.height.equalTo(@60);
    }];
    

    [self.scrollView addSubview:self.bottomTextField];
    [_bottomTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_timeLabel.mas_bottom).with.offset(800);
        make.size.mas_equalTo(CGSizeMake(300, 40));
        make.centerX.equalTo(self.scrollView);
    }];
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, 1000);
    
    // Do any additional setup after loading the view from its nib.
}

- (UITextField *)bottomTextField {
    if(!_bottomTextField) {
        _bottomTextField = [[UITextField alloc] init];
        _bottomTextField.placeholder = @"输出框";
        _bottomTextField.backgroundColor = [UIColor grayColor];
    }
    return _bottomTextField;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
