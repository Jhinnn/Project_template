//
//  HomeModel.h
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : JSONModel
@property (nonatomic ,copy) NSString *state;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *path;

@end
