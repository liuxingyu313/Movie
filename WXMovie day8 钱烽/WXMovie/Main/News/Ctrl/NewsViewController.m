//
//  NewsViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"

@interface NewsViewController ()
{
    NSMutableArray *_dataArr;
    UIImageView *_headerImageView;
    
}


@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    //数据解析
    [self _loadData];
    //界面创建
    [self _configUI];
}

- (void)_loadData {
    _dataArr = [NSMutableArray array];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news_list.json" ofType:nil]] options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dic in arr) {
        NewsModel *model = [[NewsModel alloc] init];
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.newsid = [dic[@"newsid"] integerValue];
        model.image = dic[@"image"];
        model.newsType = (NewsType)[dic[@"type"] integerValue];
        [_dataArr addObject:model];
    }
}

- (void)_configUI {
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = KTableViewSeColor;
    self.tableView.rowHeight = 100;

    
    _headerImageView = [[UIImageView alloc] init];
    NewsModel *model = _dataArr[0];
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    [_dataArr removeObject:_dataArr[0]];

    _headerImageView.backgroundColor = [UIColor clearColor];
    _headerImageView.frame = CGRectMake(0, 64, KScreenWidth, 150);
    [self.view insertSubview:_headerImageView belowSubview:self.tableView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, 150)];
    self.tableView.tableHeaderView = view;
    [self.tableView addSubview:view];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    cell.model = _dataArr[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //y坐标的偏移量
    CGFloat ofy = scrollView.contentOffset.y;
    CGFloat top = scrollView.contentInset.top;
    CGFloat y = ofy + top;
    NSLog(@"%f", y);
    if (y < 0) { //向下滑动，图片放大
        //对imageframe修改，需要改哪些值？
        //        transform 中心点放大，不好用
        //        imageView.transform = CGAffineTransformMakeScale((150 - y) / 150, (150 - y) / 150);
        CGFloat width =  KScreenWidth * (150 - y) / 150;//屏幕宽度*放大倍率
        CGFloat height = 150 - y;
        _headerImageView.frame = CGRectMake((KScreenWidth - width) / 2, 64, width, height);
    }else // 向上滑动，图片推到屏幕上面
    {
        _headerImageView.frame = CGRectMake(0, -y+64, KScreenWidth, 150);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *viewCtrlID = nil;
    switch (cell.model.newsType) {
        case WordType:
            //弹到文字新闻界面
            viewCtrlID = @"NewsWordViewController";
            break;
        case ImageType:
            //弹到图片新闻界面
            viewCtrlID = @"NewsImageViewController";

            break;
        case VideoType:
            //弹到视频新闻界面
            viewCtrlID = @"NewsVideoViewController";

            
            break;
            
        default:
            return;
            break;
    }
    UIViewController *viewCtrl = [self.storyboard instantiateViewControllerWithIdentifier:viewCtrlID];
    viewCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewCtrl animated:YES];
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
