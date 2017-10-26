//
//  HomeViewController.m
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"
#import "HomeTableViewCell.h"
#import "WriteMsgViewController.h"
#import "TestBaseViewController.h"
@interface HomeViewController () <ImageClickDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation HomeViewController {
    NSString *_indetity;
    NSArray *_titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleArray = @[@"BaseViewController数据源，代理，自定义视图",@"",@"",@"",@"",@"",@"",@""];
    
    [self observeNotification:[NotificationName network_succ]];
    [self observeNotification:[NotificationName network_fail]];

    [self setupView];
    [self dataAccess];
}


ON_NOTIFICATION(notification) {
    if ([notification.name isEqualToString:[NotificationName network_succ]]) {
        NSLog(@"网络连接成功");
    }else if ([notification.name isEqualToString:[NotificationName network_fail]]) {
        NSLog(@"网络连接失败");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_indetity forIndexPath:indexPath];
    cell.delegate = self;
    cell.clickBlock = ^(NSString *title) {
        
    };
    cell.title = _titleArray[indexPath.row];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TestBaseViewController *tbVC = [[TestBaseViewController alloc] init];
        [self.navigationController pushViewController:tbVC animated:YES];
    }else if (indexPath.row == 1) {
        WriteMsgViewController *wmVC = [[WriteMsgViewController alloc] init];
        [self.navigationController pushViewController:wmVC animated:YES];
    }
}

- (void)imageClickAction:(NSString *)imagePath {
    NSLog(@"%@",imagePath);
    
}

- (void)setupView {
    self.tableView.frame = self.view.bounds;
    self.tableView.rowHeight = 140;
    [self.view addSubview:self.tableView];
    
    //添加刷新控件
    self.needRefresh = YES;
    [self.tableView.mj_header beginRefreshing];
}

- (void)headerRefreshAction {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)dataAccess {
    WS(weakself);
    self.dataArr = @[].mutableCopy;
    HomeViewModel *homeViewModel = [[HomeViewModel alloc] init];
    [homeViewModel handleDataWithSuccess:^(NSArray *arr) {
        [weakself.dataArr addObjectsFromArray:arr];
        [weakself.dataArr addObjectsFromArray:arr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.tableView reloadData];
        });
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)tableViewRegisterClass {
    _indetity = @"home_cell";
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:_indetity];
}


@end
