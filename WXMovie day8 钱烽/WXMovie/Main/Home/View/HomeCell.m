//
//  HomeCell.m
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(HomeModel *)model {
    _model = model;
    
    self.titleLabel.text = model.title;
    self.titleLabel.textColor = [UIColor colorWithRed:122.0/255 green:59.0/255 blue:19.0/255 alpha:1];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",[model.rating[@"average"] floatValue]];
    self.yearLabel.text = [NSString stringWithFormat:@"年份:%@",_model.year];
    NSString *imageUrl = _model.images[@"medium"];
//    self.imageView.image = [UIImage imageNamed:@"pig"];
//    if ([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]]) {
//        self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    
//    }
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
    [_startView changeStarViewWidthWithRating:[self.ratingLabel.text floatValue]];
}

@end
