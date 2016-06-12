//
//  StarViewCode.m
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "StarViewCode.h"

@implementation StarViewCode

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
      //  self.height = KScreenWidth/14;
        [self _createSubviews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
  //      self.height = KScreenWidth/14;
        [self _createSubviews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.height = KScreenWidth/14;

    [self _createSubviews];
    self.backgroundColor = [UIColor clearColor];
}

- (void)_createSubviews {
    grayView = [[UIView alloc] init];
    yellowView = [[UIView alloc] init];
    [self addSubview:grayView];
    [self addSubview:yellowView];
    
    UIImage *image = [UIImage imageNamed:@"yellow"];
    UIImage *image1 = [UIImage imageNamed:@"gray"];
    //按比例缩放
    float scale = self.height/(image.size.height+0.5);
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    grayView.frame = CGRectMake(0, 0, 5*self.height, self.height);
    //配置图片
    yellowView.backgroundColor = [UIColor colorWithPatternImage:image];
    grayView.backgroundColor = [UIColor colorWithPatternImage:image1];
}

- (void)changeStarViewWidthWithRating:(float)rating {
    yellowView.frame = CGRectMake(0, 0, 5*self.height*rating/10, self.height);
}




@end
