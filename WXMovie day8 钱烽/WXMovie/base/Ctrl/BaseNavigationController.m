//
//  BaseNavigationController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64@2x"] forBarMetrics:UIBarMetricsDefault];
    //设置标题颜色和字体大小等
    NSDictionary *dic = @{
                          NSFontAttributeName :[UIFont boldSystemFontOfSize:20],
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    [self.navigationBar setTitleTextAttributes:dic];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
