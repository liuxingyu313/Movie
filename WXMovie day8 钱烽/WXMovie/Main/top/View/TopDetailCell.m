//
//  TopDetailCell.m
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopDetailCell.h"

@implementation TopDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setCommentModel:(CommentModel *)commentModel {
    _commentModel = commentModel;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_commentModel.userImage]];
    _nickLabel.text = _commentModel.nickname;
    _scoreLabel.text = _commentModel.rating;
    _cmmtLabel.text = _commentModel.content;
    
}

@end
