//
//  HomeViewModel.h
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject

- (void)handleDataWithSuccess:(void (^)(NSArray *arr))success failure:(void (^)(NSError *error))failure;

@end
