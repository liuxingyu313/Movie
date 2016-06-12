//
//  NewsImageViewController.m
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewsImageViewController.h"
#import "ImageModel.h"
#import "NewsImageCell.h"
#import "PhotoViewController.h"

#define KItemWidth 66
#define KItemHeight 50
#define KItemCount 4
#define KItemSpace (KScreenWidth-4*KItemWidth)/(KItemCount+1)

@interface NewsImageViewController ()
{
    NSMutableArray *_dataArr;
}

@end

@implementation NewsImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图片新闻";
    //数据加载
    [self _loadData];
    //界面创建
    [self _configUI];
}

- (void)_loadData {
    _dataArr = [NSMutableArray array];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_list" ofType:@"json"]] options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dic in arr) {
        ImageModel *model = [[ImageModel alloc] init];
        model.imageId = [dic[@"id"] integerValue];
        model.image = dic[@"image"];
        model.type = [dic[@"type"] integerValue];
        [_dataArr addObject:model];

    }

    
    
}

- (void)_configUI {
    self.collectionFlowLayout.itemSize = CGSizeMake(KItemWidth, KItemHeight);
    self.collectionFlowLayout.minimumLineSpacing = KItemSpace;
    self.collectionFlowLayout.minimumInteritemSpacing = KItemSpace;
    self.collectionFlowLayout.sectionInset = UIEdgeInsetsMake(KItemSpace, KItemSpace, 0, KItemSpace);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewsImageCell" forIndexPath:indexPath];
    cell.model = _dataArr[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(KItemWidth, KItemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建vc
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    //传入indexpath
    photoVC.selectIndexPath = indexPath;
    NSMutableArray *array = [NSMutableArray array];
    for (ImageModel *model in _dataArr) {
        [array addObject:model.image];
    }
    photoVC.imageUrlArr = array;
    //弹出视图控制器
    [self.navigationController pushViewController:photoVC animated:YES];
    
}

@end
