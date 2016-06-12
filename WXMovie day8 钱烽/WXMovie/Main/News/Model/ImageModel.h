//
//  ImageModel.h
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>
//{
//    "id": 2238623,
//    "image": "http://img31.mtime.cn/pi/2013/03/08/144537.36699163_1280X720.jpg",
//    "type": 6
//}

@interface ImageModel : NSObject

@property (assign,nonatomic) NSInteger imageId;
@property (copy,nonatomic) NSString *image;
@property (assign,nonatomic) NSInteger type;

@end
