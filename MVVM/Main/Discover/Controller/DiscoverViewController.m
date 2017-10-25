//
//  DiscoverViewController.m
//  MVVM
//
//  Created by Arthur on 2017/10/24.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCollectionViewCell.h"
#import "DiscoverViewModel.h"
#import "DiscoverCollectionViewCell.h"
static NSString *collectionIdentifier = @"diccellIfier";

@interface DiscoverViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发现";
    [self setupView];
    [self dataAccess];
    // Do any additional setup after loading the view.
}

- (void)setupView {
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DiscoverCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionIdentifier];
}

- (void)dataAccess {
    WS(weakself);
    self.dataArr = @[].mutableCopy;
    DiscoverViewModel *disViewModel = [[DiscoverViewModel alloc] init];
    [disViewModel handleDataWithSuccess:^(NSArray *arr) {
        [weakself.dataArr addObjectsFromArray:arr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.collectionView reloadData];
        });
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UICollectionViewDelegate, DataSource


#pragma mark ---collectionView 一共有多少section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark ---collectionView 每个section有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionIdentifier forIndexPath:indexPath];
    [self configureCell:cell forItemAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(DiscoverCollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath {
    cell.model = self.dataArr[indexPath.row];
}

// 设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenWidth - 20) / 3, (kScreenWidth - 20) / 3 + 50);
}

// 设置每个cell上下左右相距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 10, 5);
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
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
