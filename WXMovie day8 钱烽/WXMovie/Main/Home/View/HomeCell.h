//
//  HomeCell.h
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "StarViewCode.h"

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet StarViewCode *startView;

@property (strong,nonatomic) HomeModel *model;
@end
