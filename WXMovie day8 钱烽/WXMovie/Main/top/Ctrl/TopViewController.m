//
//  TopViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopViewController.h"
#import "TopCollectionViewCell.h"
#import "TopDetailViewController.h"

//根据上面的信息自动计算上下左右的间隙
#define kSpaceSize (KScreenWidth - kItemWidth * kItemCount )/(kItemCount+1)


@interface TopViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *TopFlowLayout;
@property (strong,nonatomic) NSMutableArray *dataArr;
@end


@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TOP250";
    //加载数据
    [self loadData];
    //创建界面
    [self configLayout];
}

- (void)configLayout {
    
    self.TopFlowLayout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    self.TopFlowLayout.minimumLineSpacing = kSpaceSize;
    self.TopFlowLayout.minimumInteritemSpacing = kSpaceSize;
    self.TopFlowLayout.sectionInset = UIEdgeInsetsMake(kSpaceSize, kSpaceSize, kSpaceSize, kSpaceSize);
}

- (void)loadData {
    
    _dataArr = [NSMutableArray array];
    NSDictionary *jsonDic = [WXDataService requestDataWithJsonFile:@"top250.json"];
    NSArray *jsonArray = [jsonDic objectForKey:@"subjects"];
    for (NSDictionary *dic in jsonArray) {
        TopModel *model = [[TopModel alloc] init];
        model.rating = dic[@"rating"];
        model.images = dic[@"images"];
        model.title = dic[@"title"];
        model.year = dic[@"year"];
        [_dataArr addObject:model];
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kTopCollectionViewCellID" forIndexPath:indexPath];
    cell.model = _dataArr[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    TopDetailViewController *viewCtrl = [[TopDetailViewController alloc] init];
//    [self.navigationController pushViewController:viewCtrl animated:YES];
    
//    [self presentViewController:viewCtrl animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
