//
//  SectionHeaderView.h
//  WXMovie
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSectionHeaderHeight 35

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic,weak,readonly) UIControl *ctrlView;
@property (nonatomic,weak,readonly) UILabel *titleLabel;

@end
