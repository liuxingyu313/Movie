//
//  TopDetailHeaderView.m
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopDetailHeaderView.h"

@implementation TopDetailHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setModel:(TopDetailModel *)model {
    
    _model = model;
    [_movieImgView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    _movieContentView.text = _model.content;
    _movieTitleLabel.text = _model.titleCn;
    _enTitleLabel.text = _model.titleEn;
    
    NSDictionary *dic1 = _model.videos[0];
    NSString *imgUrl1 = dic1[@"image"];
    UIImage *image1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl1]]];
    [_button1 setBackgroundImage:image1 forState:UIControlStateNormal];
    
    NSDictionary *dic2 = _model.videos[1];
    NSString *imgUrl2 = dic2[@"image"];
    UIImage *image2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl2]]];
    [_button2 setBackgroundImage:image2 forState:UIControlStateNormal];
    
    NSDictionary *dic3 = _model.videos[2];
    NSString *imgUrl3 = dic3[@"image"];
    UIImage *image3 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl3]]];
    [_button3 setBackgroundImage:image3 forState:UIControlStateNormal];
    
    NSDictionary *dic4 = _model.videos[3];
    NSString *imgUrl4 = dic4[@"image"];
    UIImage *image4 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl4]]];
    [_button4 setImage:image4 forState:UIControlStateNormal];
    [self layoutIfNeeded];
    
}
- (IBAction)showMoviePlayer:(UIButton *)sender {
    NSInteger index = sender.tag-100;
    NSDictionary *dic = _model.videos[index];
    NSString *url = dic[@"url"];
    
    AVPlayerViewController *moviePlayer = [[AVPlayerViewController alloc] init];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
    moviePlayer.player = player;
    [player play];
    [self.viewController presentViewController:moviePlayer animated:YES completion:NULL];
    
}

@end
