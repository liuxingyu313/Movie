//
//  MovieCollectionView.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MovieKVOValue @"currentIndex"
//1.加载model数据  创建对象 基础的样式配置 cell的长宽比

@interface MovieCollectionView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property (strong,nonatomic) NSArray *dataArray;

@property (assign,nonatomic) NSInteger currentIndex;

@property (assign,nonatomic) NSInteger itemWidth;


@end
