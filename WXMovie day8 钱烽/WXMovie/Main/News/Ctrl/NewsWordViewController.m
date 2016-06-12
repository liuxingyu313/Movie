//
//  NewsWordViewController.m
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "NewsWordViewController.h"

@interface NewsWordViewController ()
{
    UIActivityIndicatorView *_aiview;
}

@end

@implementation NewsWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"文字新闻";
    _aiview = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"准备开始加载");
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始加载");
    [_aiview startAnimating];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"加载完成");
    [_aiview stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    NSLog(@"加载失败");
    [_aiview stopAnimating];
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
