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
@interface HomeViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation HomeViewController {
    
    NSString *_indetity;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MVVM";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
    [self dataAccess];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_indetity forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (void)setupView {
    self.tableView.frame = self.view.bounds;
    self.tableView.rowHeight = 140;
    [self.view addSubview:self.tableView];
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
