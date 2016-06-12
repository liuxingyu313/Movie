//
//  RootTabBarController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "RootTabBarController.h"
#import "WXTabBarButton.h"


@interface RootTabBarController ()
{
    UIImageView *_selectImage;
}

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _customTarBar];
    [self _createViewControllers];
}

- (void)_createViewControllers {
    //先拿到所有的storyboard
    UIStoryboard *home = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIStoryboard *news = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    UIStoryboard *top = [UIStoryboard storyboardWithName:@"Top" bundle:nil];
    UIStoryboard *cinema = [UIStoryboard storyboardWithName:@"Cinema" bundle:nil];
    UIStoryboard *more = [UIStoryboard storyboardWithName:@"More" bundle:nil];
    //拿到所有的control
    NSArray *viewCtrls = @[[home instantiateInitialViewController],
                           [news instantiateInitialViewController],
                           [top instantiateInitialViewController],
                           [cinema instantiateInitialViewController],
                           [more instantiateInitialViewController]
                           ];
    //设置给self
    self.viewControllers = viewCtrls;



}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self removeUITabBarButton];
}

- (void)removeUITabBarButton {
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

- (void)_customTarBar {
    float itemWith = KScreenWidth/5;
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all@2x"]];
    //1.设置选中的效果
    _selectImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1@2x"]];
    _selectImage.frame = CGRectMake(0, 2,44, 44);
    [self.tabBar addSubview:_selectImage];
    
    //2.获取button的图片和名称
    NSArray *nameArr = @[@"电影",@"新闻",@"TOP",@"影院",@"更多"];
    NSArray *imageArr = @[@"movie_home@2x",
                          @"msg_new@2x",
                          @"start_top250@2x",
                          @"icon_cinema@2x",
                          @"more_setting@2x"
                          ];
    for (int i = 0; i < nameArr.count; i++) {
        NSString *title = nameArr[i];
        NSString *imgName = imageArr[i];
        
        WXTabBarButton *item = [[WXTabBarButton alloc] initWithFrame:CGRectMake(i*itemWith, 0, itemWith, 49) withImageName:imgName withTitleLabel:title];
        [item addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        item.tag = 1000 +i;
        [self.tabBar addSubview:item];
        
    }
    _selectImage.center = [self.tabBar viewWithTag:1000].center;
}

- (void)buttonAction:(WXTabBarButton *)sender {
    self.selectedIndex = sender.tag - 1000;
    [UIView animateWithDuration:0.25 animations:^{
        _selectImage.center = sender.center;
    }];
    if (sender.tag == 1000) {
        [sender imageForSeleted:@"movie_select_home@2x"];
    } else {
        [[self.tabBar viewWithTag:1000] imageForSeleted:@"movie_home@2x"];
        sender.selected = NO;
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
