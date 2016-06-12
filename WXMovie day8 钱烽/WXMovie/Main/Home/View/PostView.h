//
//  PostView.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LargeCollectionView.h"
#import "SmallCollectionView.h"

#define KHeaderHeight 130
#define KFooterHeight 30
#define KMovieSmallViewHeight 100


@interface PostView : UIView

/*
 1.需要上面的headerView 中间largeView 下面的titleLabel  灯视图
 2.就是呈现基本视图
 
 */
{
    UIImageView *headView;
    UILabel *titleLabel;
    UIControl *_maskView;
    
    
    MovieCollectionView *largeView;
    MovieCollectionView *smallView;
}
@property (strong,nonatomic) NSArray *dataArray;
@end
