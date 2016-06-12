//
//  GuideViewController.m
//  WXMovie
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "GuideViewController.h"
#import "RootTabBarController.h"

@interface GuideViewController () <UIScrollViewDelegate>

@end

@implementation GuideViewController

- (void)dealloc {
    NSLog(@"dealloc");
    NSLog(@"%s",__FUNCTION__);
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatUI];
}

- (void)_creatUI {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeigth)];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(5 * KScreenWidth, KScreenHeigth);
    
    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%d@2x",i+1];
        NSString *progressImageName = [NSString stringWithFormat:@"guideProgress%d@2x",i+1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * KScreenWidth, 0, KScreenWidth, KScreenHeigth)];
        imageView.image = [UIImage imageNamed:imageName];
        
        UIImageView *progressView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:progressImageName ]];
        progressView.frame = CGRectMake((KScreenWidth - progressView.image.size.width)/2, KScreenHeigth-50, progressView.image.size.width, progressView.image.size.height);
        
        [imageView addSubview:progressView];
        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 4 * KScreenWidth) {
        RootTabBarController *root = [[RootTabBarController alloc] init];
        
        //转场
    [UIView transitionWithView:self.view.window duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.view.window.rootViewController = root;
    } completion:^(BOOL finished) {
        
    }];
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
