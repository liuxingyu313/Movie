//
//  HomeViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "PostView.h"

@interface HomeViewController () <UITableViewDataSource,UITableViewDelegate>
{
    //BOOL animationFlag;

    
    __weak IBOutlet PostView *postView;
    
    __weak IBOutlet UITableView *listView;
    NSMutableArray *_modelArr;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _parseJsonData];

    self.title = @"电影";
    postView.hidden = YES;
    listView.backgroundColor = self.view.backgroundColor;
    listView.separatorColor = KTableViewSeColor;
    
    
    [self _creatCustomView];
    
    
}
- (void)_parseJsonData {
    _modelArr = [NSMutableArray array];
    //解压json数据
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = result[@"subjects"];
    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = dic[@"subject"];
        
        //配置model
        HomeModel *model = [[HomeModel alloc] init];
        model.rating = subject[@"rating"];
        model.title = subject[@"title"];
        model.original_title = subject[@"original_title"];
        model.year = subject[@"year"];
        model.images = subject[@"images"];
        [_modelArr addObject:model];
    }
    postView.dataArray = _modelArr;
}


- (void)_creatCustomView {
    UIImageView *customView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    customView.backgroundColor = [UIColor clearColor];
    
    UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [postButton setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateNormal];
    [postButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    postButton.frame = customView.frame;
    [postButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:postButton];
    
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [listButton setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    listButton.frame = customView.frame;
    [listButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:listButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
}

- (void)buttonAction:(UIButton *)button {
    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
    [customView sendSubviewToBack:button];
    //animationFlag = !animationFlag;
    UIViewAnimationTransition transition = postView ? UIViewAnimationTransitionFlipFromLeft :     UIViewAnimationTransitionFlipFromRight
;
   // postView.backgroundColor = [UIColor greenColor];
    listView.hidden = postView.hidden;

    postView.hidden = !listView.hidden;
    [UIView animateWithDuration:0.25 animations:^{
        [UIView setAnimationTransition:transition forView:customView cache:YES];
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [UIView setAnimationTransition:transition forView:self.view cache:YES];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:self options:nil] firstObject];
    }
   // cell.backgroundColor = [UIColor clearColor];
    cell.model = _modelArr[indexPath.row];
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  KScreenWidth/3;
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
