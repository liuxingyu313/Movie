//
//  CinemaViewController.h
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController
{
/*
 districtList:
 {
 "name" : "东城区",
 "id" : "1029"
 }
 
 */
    NSArray *districtArr;
 /*   "1029":
    {
    [影院model1,
     影院model2,
     影院model3,
     影院model4,
     影院model5]
  
        
    }
  */
    NSMutableDictionary *cinemaDic;

}
  
@end
