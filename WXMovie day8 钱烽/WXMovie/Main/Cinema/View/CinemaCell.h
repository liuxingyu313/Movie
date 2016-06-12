//
//  CinemaCell.h
//  WXMovie
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *CinemaNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *AddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *DistanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *CouponImgView;
@property (weak, nonatomic) IBOutlet UIImageView *SeatImgView;
@property (weak, nonatomic) IBOutlet UILabel *RatingLabel;

@property (strong,nonatomic) CinemaModel *model;

@end
