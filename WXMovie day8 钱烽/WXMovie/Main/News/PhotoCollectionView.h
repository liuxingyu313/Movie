//
//  PhotoCollectionView.h
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) NSArray *dataArray;


@end
