//
//  SmallCell.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface SmallCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (strong,nonatomic) HomeModel *model;



@end
