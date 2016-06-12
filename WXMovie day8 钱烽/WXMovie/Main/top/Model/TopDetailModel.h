//
//  TopDetailModel.h
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "BaseModel.h"

//{
//    "image" : "http://img31.mtime.cn/mt/2012/06/28/131128.94272291.jpg",
//    "titleCn" : "摩尔庄园2海妖宝藏",
//    "titleEn" : "Legend of The Moles-Treasure of Scylla",
//    "rating" : "7.7",
//    "year" : "2012",
//    "content" : "摩尔庄园大电影系列第二部：《摩尔庄园海妖宝藏》继续讲述快乐、勇敢、热爱和平的小摩尔们战胜邪恶",
//    "type" : [ "动画", "动作", "奇幻", "冒险" ],
//    "url" : "http://movie.mtime.com/157836/",
//    "directors" : [ "刘可欣" ],
//    "actors" : ["阿黄","阿龟","阿宇","阿红","凤姐"],
//    "release" : {
//        "location" : "中国",
//        "date" : "2012-7-5"
//    }

@interface TopDetailModel : BaseModel
@property (copy,nonatomic) NSString *image;
@property (copy,nonatomic) NSString *titleCn;
@property (copy,nonatomic) NSString *titleEn;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSArray *videos;






@end
