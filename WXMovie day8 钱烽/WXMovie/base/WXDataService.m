//
//  WXDataService.m
//  WXMovie
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "WXDataService.h"

@implementation WXDataService

+ (id)requestDataWithJsonFile:(NSString *)fileName {
    //1.取得json文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    //2.ios5以后使用
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //3.
//    NSJSONReadingMutableContainers = (1UL << 0)   //可变容器
//    NSJSONReadingMutableLeaves = (1UL << 1),      //可变字符串
//    NSJSONReadingAllowFragments = (1UL << 2)      //返回的数据不是字典和数组
    id result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error: nil];
    return result;
}


@end
