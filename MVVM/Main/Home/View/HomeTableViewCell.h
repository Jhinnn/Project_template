//
//  HomeTableViewCell.h
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

typedef void(^ClickBlock)(NSString *title);

@protocol ImageClickDelegate <NSObject>

- (void)imageClickAction:(NSString *)imagePath;

@end

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, assign) HomeModel *model;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, weak) __weak id <ImageClickDelegate> delegate;

@property (nonatomic, copy) ClickBlock  clickBlock;

@end
