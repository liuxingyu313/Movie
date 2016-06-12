//
//  MovieCollectionView.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "MovieCollectionView.h"


@implementation MovieCollectionView

-(instancetype)init {
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, (KScreenWidth-_itemWidth)/2, 0, (KScreenWidth-_itemWidth)/2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(_itemWidth, self.height);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0) {
    //获取内容的偏移量
    CGFloat offsetxX = targetContentOffset->x;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    NSInteger pageWidth = _itemWidth + layout.minimumLineSpacing;
    
    //计算页数
    NSInteger pageNum = (offsetxX + pageWidth/2)/pageWidth;
    
    //细节的处理 加速效果下出现偏移的情况配置
    pageNum = velocity.x == 0 ? pageNum : (velocity.x > 0 ? pageNum + 1:pageNum - 1);
    pageNum = MIN(MAX(pageNum, 0), self.dataArray.count-1);
    targetContentOffset->x = pageNum * pageWidth;
    self.currentIndex = pageNum;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentIndex != indexPath.row) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:YES];
        self.currentIndex = indexPath.row;
    }
}

#pragma mark KVO 观察到currentIndex改变时调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSInteger index = [change[@"new"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally) animated:YES];
        self.currentIndex = index;
    }
}


@end
