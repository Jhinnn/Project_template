//
//  DiscoverCollectionViewCell.m
//  MVVM
//
//  Created by Arthur on 2017/10/24.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "DiscoverCollectionViewCell.h"
#import "DiscoverModel.h"
@implementation DiscoverCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)setModel:(DiscoverModel *)model {
    _model = model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.path]];

    _textLabel.text = _model.content;
}

@end
