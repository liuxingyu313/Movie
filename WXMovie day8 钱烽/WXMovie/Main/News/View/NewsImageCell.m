//
//  NewsImageCell.m
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewsImageCell.h"

@implementation NewsImageCell

- (void)awakeFromNib {
//    [super awakeFromNib];
//    _imgView = [[UIImageView alloc] initWithFrame:self.frame];
//    [self addSubview:_imgView];
    _imgView.layer.cornerRadius = 10;
    _imgView.layer.masksToBounds = YES;
}

- (void)setModel:(ImageModel *)model {
    _model = model;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
}

@end
