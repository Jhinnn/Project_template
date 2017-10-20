//
//  HomeTableViewCell.m
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell {
    
    __weak IBOutlet UIImageView *_imageView;
    __weak IBOutlet UILabel *_contentLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(HomeModel *)model {
    _model = model;
 
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.path]];
    _contentLabel.text = _model.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
