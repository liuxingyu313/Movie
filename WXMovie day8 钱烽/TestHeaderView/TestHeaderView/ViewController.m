//
//  ViewController.m
//  TestHeaderView
//
//  Created by apple on 16/4/3.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "ViewController.h"
#define KWidth [UIScreen mainScreen].bounds.size.width


@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *_imageView;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.jpg"]];
    _imageView.frame = CGRectMake(0, 0, KWidth, 150);
    [self.view insertSubview:_imageView belowSubview:self.tableView];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 150)];
//    view.backgroundColor = [UIColor clearColor];
//    self.tableView.tableHeaderView = view;
    self.tableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat ofy = scrollView.contentOffset.y;
    CGFloat top = scrollView.contentInset.top;
    CGFloat y = ofy+top;
    NSLog(@"%f",y);
    if (y < 0) { //向下滑动 图片放大
        CGFloat width = KWidth*((150-y)/150);
        CGFloat height = 150-y;
        _imageView.frame = CGRectMake((KWidth-width)/2, 0, width, height);
    } else { //向上滑动 推动图片
        _imageView.frame = CGRectMake(0, -y, KWidth, 150);
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
