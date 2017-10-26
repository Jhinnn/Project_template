//
//  TestBaseViewController.m
//  MVVM
//
//  Created by Arthur on 2017/10/26.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "TestBaseViewController.h"
#import "MVAlertView.h"
@interface TestBaseViewController () <MVAlertViewDelegate>

@property (nonatomic, strong) MVAlertView *mvAlertView;

@end

@implementation TestBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
//    self.title = @"BaseViewController测试";
//    self.view.backgroundColor = [UIColor whiteColor];

    [self setupView];
    
}

- (void)setupView {
    
}

#pragma mark ---BaseViewController dataSource
//- (UIImage *)navBackgroundImage {
//    return IMG_NAME(@"navbg");
//}

- (NSMutableAttributedString *)setTitle {
    return [[NSMutableAttributedString alloc] initWithString:@"导航栏标题数据源"];
}

- (UIImage *)set_leftBarButtonItemWithImage {
     return IMG_NAME(@"返回");
}

- (UIImage *)set_rightBarButtonItemWithImage {
    return IMG_NAME(@"定位");
}

#pragma mark ---BaseViewController delegate

- (void)left_button_event:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)right_button_event:(UIButton *)sender {
    [self.mvAlertView showView];
}

#pragma mark ---MVAlertView delegate
- (void)requestEventAction:(UIButton *)button {
    [self.mvAlertView closeView];
    
    NSLog(@"%@",self.mvAlertView.remarkField.text);
}

- (MVAlertView *)mvAlertView {
    if (!_mvAlertView) {
        _mvAlertView = [[MVAlertView alloc] initWithFrame:CGRectMake(30, 200, kScreenWidth - 60, 220)];
        _mvAlertView.backgroundColor = [UIColor whiteColor];
        _mvAlertView.delegate = self;
    }
    return _mvAlertView;
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
