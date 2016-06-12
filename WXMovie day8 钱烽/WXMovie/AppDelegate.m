//
//  AppDelegate.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarController.h"
#import "GuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
   // self.window.rootViewController = [[GuideViewController alloc] init];
    [self.window makeKeyAndVisible];
    //1.判断第一次进来 ——》启动界面 2.如果不是呢 直接进入RootTabBarController
    //启动界面之后 进入RootTabBarController
    //从沙盒中取出标记
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:KFirstStartFlag];
    NSLog(@"%@",NSHomeDirectory());
    //判断
    if (flag) { //如果不是第一次启动
        self.window.rootViewController = [[RootTabBarController alloc] init];
        
    } else { //第一次启动
        self.window.rootViewController = [[GuideViewController alloc] init];
        //把数据存入沙盒
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:KFirstStartFlag];
        //同步操作
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
   
   
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
