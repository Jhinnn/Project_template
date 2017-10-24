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
    
    _imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
    [_imageView addGestureRecognizer:tap];
    
}

- (void)setModel:(HomeModel *)model {
    _model = model;
 
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.path]];
    _contentLabel.text = _model.title;
}

- (void)imageClick:(UITapGestureRecognizer *)gr {
    self.clickBlock(_model.title);
}


//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    if([self.delegate respondsToSelector:@selector(imageClickAction:)]) {
//        [self.delegate imageClickAction:_model.path];
//    }
//    
//    
//}

@end
