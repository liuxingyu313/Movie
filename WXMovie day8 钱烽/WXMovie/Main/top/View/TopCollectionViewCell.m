//
//  TopCollectionViewCell.m
//  WXMovie
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopCollectionViewCell.h"

#define KStartHeight 13.0


@implementation TopCollectionViewCell

- (void)awakeFromNib {
    //设置边框
    //self.contentView.layer.borderWidth = 1.0f;
    //self.contentView.layer.borderColor = [UIColor colorWithWhite:0.264 alpha:1.000].CGColor;
    
    //设置title背景的透明度
    _TitleLabel.alpha = 0.7;
    
    //设置星星视图的尺寸
    float y = kItemHeight - _TitleLabel.height + (_TitleLabel.height - KStartHeight)/2;
    starView = [[StarViewCode alloc] initWithFrame:CGRectMake(0, y, 5*KStartHeight, KStartHeight)];
    [self.contentView addSubview:starView];
}


- (void)setModel:(TopModel *)model {
    
    _model = model;
    
    //加载图片
    NSString *imgStr = [_model.images objectForKey:@"medium"];
    [_ImgView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    
    //加载标题
    _TitleLabel.text = _model.title;
    
    
    
    //显示评分视图
    NSNumber *ratingNum = [_model.rating objectForKey:@"average"];
    _ScoreLabel.text = [NSString stringWithFormat:@"%.1f",[ratingNum floatValue]];
    [starView changeStarViewWidthWithRating:[ratingNum floatValue]];
}

@end
