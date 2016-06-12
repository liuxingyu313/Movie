//
//  NewsModel.h
//  WXMovie
//
//  Created by apple on 16/4/3.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>
//
//{
//    "newsid" : 1491520,
//    "type" : 0,
//    "title" : "科幻大作《全面回忆》全新预告片发布",
//    "summary" : "",
//    "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
//}

typedef enum {
    WordType,ImageType,VideoType
}NewsType;

@interface NewsModel : NSObject

@property (assign,nonatomic) NSInteger newsid;
@property (assign,nonatomic) NewsType newsType;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *summary;
@property (copy,nonatomic) NSString *image;

@end
