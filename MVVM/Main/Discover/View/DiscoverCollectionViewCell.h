//
//  DiscoverCollectionViewCell.h
//  MVVM
//
//  Created by Arthur on 2017/10/24.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiscoverModel;
@interface DiscoverCollectionViewCell : UICollectionViewCell {
    
    __weak IBOutlet UIImageView *_imageView;
    __weak IBOutlet UILabel *_textLabel;
}

@property (nonatomic, assign) DiscoverModel *model;

@end
