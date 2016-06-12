//
//  WXTabBarButton.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "WXTabBarButton.h"
#define  KItemSize 20

@implementation WXTabBarButton



- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imgName withTitleLabel:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - KItemSize)/2, 5, KItemSize , KItemSize)];
        imageView.image = [UIImage imageNamed:imgName];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, frame.size.width, 15)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
    }
    return self;
}

- (void)imageForSeleted:(NSString *)imageName {
    self.selected = YES;
    imageView.image = [UIImage imageNamed:imageName];
    
    
}

@end
