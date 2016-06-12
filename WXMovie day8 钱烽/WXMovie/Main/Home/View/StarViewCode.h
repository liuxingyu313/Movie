//
//  StarViewCode.h
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"


@interface StarViewCode : UIView {
    UIView *yellowView;
    UIView *grayView;
}

- (void)changeStarViewWidthWithRating:(float)rating;
@end
