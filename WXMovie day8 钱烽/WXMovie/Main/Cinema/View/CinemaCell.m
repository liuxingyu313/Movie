//
//  CinemaCell.m
//  WXMovie
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)setModel:(CinemaModel *)model {
    _model = model;
    _CinemaNameLabel.text = _model.name;
    _AddressLabel.text = _model.address;
    _RatingLabel.text = _model.grade;
    _PriceLabel.text = [NSString stringWithFormat:@"￥%@",_model.lowPrice];
    if ([_model.lowPrice isKindOfClass:[NSNull class]]) {
        _PriceLabel.text = @"";
    }
    _DistanceLabel.text = @"1km";
    if ([_model.isSeatSupport integerValue] == 1) {
        _SeatImgView.hidden = NO;
    } else {
        _SeatImgView.hidden = YES;
    }
    
    if ([_model.isCouponSupport integerValue] == 1) {
        _CouponImgView.hidden = NO;
    } else {
        _CouponImgView.hidden = YES;
    }
    
}

@end
