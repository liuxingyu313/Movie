//
//  NewsImageCell.h
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"

@interface NewsImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (strong,nonatomic) ImageModel *model;

@end
