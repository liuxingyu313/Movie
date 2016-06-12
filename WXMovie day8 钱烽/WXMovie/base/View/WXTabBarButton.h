//
//  WXTabBarButton.h
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarButton : UIControl
{
    UIImageView *imageView;
    UILabel *titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imgName withTitleLabel:(NSString *)title;

- (void)imageForSeleted:(NSString *)imageName;


@end
