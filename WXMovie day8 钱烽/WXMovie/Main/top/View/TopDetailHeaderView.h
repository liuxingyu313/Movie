//
//  TopDetailHeaderView.h
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopDetailModel.h"

@interface TopDetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *movieImgView;
@property (weak, nonatomic) IBOutlet UITextView *movieContentView;

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *enTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (strong,nonatomic) TopDetailModel *model;

@end
