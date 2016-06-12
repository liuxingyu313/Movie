//
//  TopDetailViewController.m
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "TopDetailViewController.h"
#import "TopDetailCell.h"
#import "TopDetailHeaderView.h"

#define KTableViewRowHeight 80

@interface TopDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tbView;

@property (strong,nonatomic) NSMutableArray *commentArr;
@property (strong,nonatomic) NSIndexPath *selectIndexPath;

@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建界面
    [self configUI];
    
    

    //解析数据
    [self loadData];
}

//解析数据

- (void)loadData {
    
    //解析header数据
    NSDictionary *detailDic = [WXDataService requestDataWithJsonFile:@"movie_detail.json"];
    TopDetailModel *detailModel = [[TopDetailModel alloc] initWithDic:detailDic];
    headView.model = detailModel;
    
    //解析comment数据
    _commentArr = [NSMutableArray array];

    NSDictionary *commentDic = [WXDataService requestDataWithJsonFile:@"movie_comment.json"];
    NSArray *listArr = commentDic[@"list"];
    for (NSDictionary *dic in listArr) {
        CommentModel *model = [[CommentModel alloc] initWithDic:dic];
        [_commentArr addObject:model];
    }
    
}

//使用了autolayout之后在viewctrl里获取uiview的frame，重写viewDidLayoutSubviews方法
//-(void)viewDidLayoutSubviews
//{
//    
//}

//创建界面

- (void)configUI {
    
    headView = [[[NSBundle mainBundle] loadNibNamed:@"TopDetailHeaderView" owner:self options:nil] firstObject];
    self.tbView.tableHeaderView = headView;
    self.tbView.backgroundColor = [UIColor clearColor];
    
    
    self.tbView.separatorColor = KTableViewSeColor;
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tbView registerNib:[UINib nibWithNibName:@"TopDetailCell" bundle:nil] forCellReuseIdentifier:@"kTopDetailCellID"];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.commentArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kTopDetailCellID" forIndexPath:indexPath];
    cell.commentModel = self.commentArr[indexPath.row];
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.selectIndexPath isEqual:indexPath]) {
        //求label文字的高度

        CommentModel *model = self.commentArr[indexPath.row];
        /*
         NSStringDrawingUsesLineFragmentOrigin 表示可以换行
         NSStringDrawingUsesFontLeading 计算行高时使用行间距。（字体大小+行间距=行高）
         NSStringDrawingUsesDeviceMetrics 使用设备的字体（如果不设置，使用的印刷字体）
         NSStringDrawingTruncatesLastVisibleLine
         最后一行如果超出范围，自动变为省略号(如果不换行，没有效果)
         */
        NSDictionary *arrtDic = @{NSFontAttributeName :[UIFont systemFontOfSize:16]};
        CGRect frame = [model.content boundingRectWithSize:CGSizeMake(KScreenWidth-114, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:arrtDic context:nil];
        //height为cell的高度，frame.size.height为contentLabel的高度，还得加上contentLabel的y坐标49和底部10个像素的间隙
        CGFloat heigth = MAX(frame.size.height+49+10, KTableViewRowHeight);
        return heigth;
    } else {
        return KTableViewRowHeight;
    }
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (![self.selectIndexPath isEqual:indexPath]) {
        self.selectIndexPath = indexPath;
        
        //刷新选择的cell
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
