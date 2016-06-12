//
//  BaseModel.m
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self buildRelationship:dic];
    }
    return self;
}

- (SEL)changeKeyToSetKey:(NSString *)key {
    NSString *firstStr = [[key substringToIndex:1] uppercaseString];
    NSString *otherStr = [key substringFromIndex:1];
    
    //特殊处理
    NSString *setterStr = nil;
    if ([key isEqualToString:@"id"]) {
        setterStr = [NSString stringWithFormat:@"set%@%@%@:", NSStringFromClass([self class]), firstStr, otherStr];
        // setterStr = @"setBaseModelId"
    }else{
        setterStr = [NSString stringWithFormat:@"set%@%@:", firstStr, otherStr];
    }
    return NSSelectorFromString(setterStr);
    
}

- (void)buildRelationship:(NSDictionary *)dic {
    //1.拿到所有的key
    //2.把key变成setKey字符串
    //3.把setKey字符串转换成方法
    //4.把dic里面的value赋值给setKey
    NSArray *allkeys = [dic allKeys];
    for (NSString *key in allkeys) {
        SEL method = [self changeKeyToSetKey:key];
        
        id value = dic[key];
        if ([self respondsToSelector:method]) {
            [self performSelector:method withObject:value];
        }
    }
}

@end
