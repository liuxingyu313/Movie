//
//  TopModel.h
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
"rating": {
    "max": 10,
    "average": 9.6,
    "stars": "50",
    "min": 0
},
"genres": [
           "犯罪",
           "剧情"
           ],
"collect_count": 828146,
"casts": [
          {
              "avatars": {
                  "small": "http:\/\/img3.douban.com\/img\/celebrity\/small\/17525.jpg",
                  "large": "http:\/\/img3.douban.com\/img\/celebrity\/large\/17525.jpg",
                  "medium": "http:\/\/img3.douban.com\/img\/celebrity\/medium\/17525.jpg"
              },
              "alt": "http:\/\/movie.douban.com\/celebrity\/1054521\/",
              "id": "1054521",
              "name": "蒂姆·罗宾斯"
          },
          {
              "avatars": {
                  "small": "http:\/\/img3.douban.com\/img\/celebrity\/small\/34642.jpg",
                  "large": "http:\/\/img3.douban.com\/img\/celebrity\/large\/34642.jpg",
                  "medium": "http:\/\/img3.douban.com\/img\/celebrity\/medium\/34642.jpg"
              },
              "alt": "http:\/\/movie.douban.com\/celebrity\/1054534\/",
              "id": "1054534",
              "name": "摩根·弗里曼"
          },
          {
              "avatars": {
                  "small": "http:\/\/img5.douban.com\/img\/celebrity\/small\/5837.jpg",
                  "large": "http:\/\/img5.douban.com\/img\/celebrity\/large\/5837.jpg",
                  "medium": "http:\/\/img5.douban.com\/img\/celebrity\/medium\/5837.jpg"
              },
              "alt": "http:\/\/movie.douban.com\/celebrity\/1041179\/",
              "id": "1041179",
              "name": "鲍勃·冈顿"
          }
          ],
"title": "肖申克的救赎",
"original_title": "The Shawshank Redemption",
"subtype": "movie",
"directors": [
              {
                  "avatars": {
                      "small": "http:\/\/img3.douban.com\/img\/celebrity\/small\/230.jpg",
                      "large": "http:\/\/img3.douban.com\/img\/celebrity\/large\/230.jpg",
                      "medium": "http:\/\/img3.douban.com\/img\/celebrity\/medium\/230.jpg"
                  }
 */

@interface TopModel : NSObject

@property (strong,nonatomic) NSDictionary *rating; //评分
@property (strong,nonatomic) NSDictionary *images; //图片
@property (copy,nonatomic) NSString *title;  //标题
@property (copy,nonatomic) NSString *year;




@end
