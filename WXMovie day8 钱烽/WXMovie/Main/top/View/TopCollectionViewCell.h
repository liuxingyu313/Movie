//
//  TopCollectionViewCell.h
//  WXMovie
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"
#import "StarViewCode.h"

#define kItemCount  3
#define kItemWidth  100     //item的宽度
#define kItemHeight 166     //item的高度

@interface TopCollectionViewCell : UICollectionViewCell
{
    StarViewCode *starView;
}

@property (weak, nonatomic) IBOutlet UIImageView *ImgView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (strong,nonatomic) TopModel *model;
    
    
    



@end
