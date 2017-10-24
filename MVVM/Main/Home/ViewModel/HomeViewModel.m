//
//  HomeViewModel.m
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeNetApi.h"
#import "HomeModel.h"
@implementation HomeViewModel

- (void)handleDataWithSuccess:(void (^)(NSArray *arr))success failure:(void (^)(NSError *error))failure {
    HomeNetApi *api = [[HomeNetApi alloc] initWithVid:@""];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (request.response.statusCode == WB_SUCCESSCODE) {
            NSMutableArray *arr = [NSMutableArray array];
            
            for (NSDictionary *dic in request.responseObject[@"result"]) {
                HomeModel *model = [[HomeModel alloc] initWithDictionary:dic error:nil];
                [arr addObject:model];
            }
            success(arr);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        failure(request.error);
    }];
}


@end
