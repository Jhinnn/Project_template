//
//  TabBarViewController.m
//  MVVM
//
//  Created by Arthur on 2017/10/24.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "AddressBookViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
@interface TabBarViewController () <UITabBarControllerDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.tintColor = kGlobalColor;
    [self setupTabbarController];
}

#pragma mark ---设置tabbarController属性
- (void)setupTabbarController {
    self.tabBarItemsAttributes = [self setupTabbarItemsAttributes];
    self.viewControllers = [self setupViewControllers];
    self.delegate = self;
}

#pragma mark ---创建控制器数组
- (NSArray *)setupViewControllers {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    NavigationController *firstNavigationController = [[NavigationController alloc] initWithRootViewController:homeVC];
    
    AddressBookViewController *categoryVC = [[AddressBookViewController alloc] init];
    NavigationController *secondNavigationController = [[NavigationController alloc] initWithRootViewController:categoryVC];
    
    DiscoverViewController *mineVC = [[DiscoverViewController alloc] init];
    NavigationController *thirdNavigationController = [[NavigationController alloc] initWithRootViewController:mineVC];
    

    MineViewController *scVC = [[MineViewController alloc] init];
    NavigationController *sixNavigationController = [[NavigationController alloc] initWithRootViewController:scVC];
    
    
    NSArray *arrays = @[
                        firstNavigationController,
                        secondNavigationController,
                        thirdNavigationController,
                        sixNavigationController
                        ];
    return arrays;
}

#pragma mark ---设置Tabbar属性
- (NSArray *)setupTabbarItemsAttributes {
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"首页_灰",
                                                 CYLTabBarItemSelectedImage : @"首页",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"通讯录",
                                                  CYLTabBarItemImage : @"通讯录_灰",
                                                  CYLTabBarItemSelectedImage : @"通讯录",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"发现",
                                                 CYLTabBarItemImage : @"发现_灰",
                                                 CYLTabBarItemSelectedImage : @"发现",
                                                 };
    
    NSDictionary *fourTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"我的",
                                                CYLTabBarItemImage : @"我的_灰",
                                                CYLTabBarItemSelectedImage : @"我的",
                                                };

    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourTabBarItemsAttributes,
                                       ];
    
    return tabBarItemsAttributes;
    
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
