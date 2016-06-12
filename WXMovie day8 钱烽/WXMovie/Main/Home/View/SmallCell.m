//
//  SmallCell.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "SmallCell.h"

@implementation SmallCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(HomeModel *)model {
    
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.images[@"small"]]];
}
@end
