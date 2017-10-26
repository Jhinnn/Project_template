//
//  BaseTableViewController.m
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseTableViewCell.h"
@interface BaseTableViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

- (void)tableViewRegisterClass {
    
}

- (void)addRefreshHeader {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshAction)];
    self.tableView.mj_header = header;
}

- (void)setNeedRefresh:(BOOL)needRefresh {
    _needRefresh = needRefresh;
    if (_needRefresh) {
        [self addRefreshHeader];
    }
}

- (void)headerRefreshAction {
    //子类实现
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellName = @"cell";
    BaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.contentInset = UIEdgeInsetsMake(NAVIGATION_BAR_HEIGHT, 0, TAB_BAR_HEIGHT, 0);
            _tableView.scrollIndicatorInsets = _tableView.contentInset;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.alwaysBounceVertical = YES;
        [_tableView registerClass:[BaseTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self tableViewRegisterClass];
    }
    return _tableView;
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
