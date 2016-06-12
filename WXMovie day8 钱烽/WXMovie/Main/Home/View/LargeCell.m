//
//  LargeCell.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "LargeCell.h"

@implementation LargeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(HomeModel *)model {
    
    _model = model;
    
    NSURL *url = [NSURL URLWithString:_model.images[@"large"]] ;
    
    [_imgView sd_setImageWithURL:url];
}

@end
