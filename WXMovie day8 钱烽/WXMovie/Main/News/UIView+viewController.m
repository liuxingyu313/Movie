//
//  UIView+viewController.m
//  WXMovie
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "UIView+viewController.h"

@implementation UIView (viewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    
    while (YES) {
        if ([next isKindOfClass:[UIViewController class]]) {
            break;
        }else
        {
            next = next.nextResponder;
        }
    }
    
    return (UIViewController *)next;
}

@end
