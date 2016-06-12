//
//  WXDataService.h
//  WXMovie
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXDataService : NSObject

+ (id)requestDataWithJsonFile:(NSString *)fileName;

@end
