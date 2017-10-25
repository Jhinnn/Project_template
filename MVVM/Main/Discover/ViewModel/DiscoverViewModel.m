//
//  DiscoverViewModel.m
//  MVVM
//
//  Created by Arthur on 2017/10/24.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "DiscoverViewModel.h"
#import "DiscoverNetApi.h"
#import "DiscoverModel.h"
@implementation DiscoverViewModel

- (void)handleDataWithSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure {
    DiscoverNetApi *api = [[DiscoverNetApi alloc] init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (request.response.statusCode == WB_SUCCESSCODE) {
            NSMutableArray *arr = [NSMutableArray array];
            
            for (NSDictionary *dic in request.responseObject[@"result"]) {
                DiscoverModel *model = [[DiscoverModel alloc] initWithDictionary:dic error:nil];
                [arr addObject:model];
            }
            success(arr);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        failure(request.error);
    }];
}

@end
