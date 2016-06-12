//
//  PostView.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "PostView.h"
#import "HomeModel.h"

@implementation PostView

- (instancetype)init {
    return  [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _creatUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _creatUI];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    largeView.dataArray = _dataArray;
    smallView.dataArray = _dataArray;
    [self changeTitleWithIndex:0];
}

- (void)_creatUI {
    self.backgroundColor = [UIColor clearColor];
    //创建大海报视图
    [self _creatLargeView];
    //创建头部视图
    [self _creatHeaderView];
    //创建尾部视图
    [self _creatFooterView];
    //创建灯光效果
    [self _creatLightView];
    //改变视图层次结构
    [self bringSubviewToFront:headView];
    
    [self _createMaskView];
    //向下滑动出现图片
    [self _createGesture];
    //大小collection相互观察
    [largeView addObserver:smallView forKeyPath:MovieKVOValue options:NSKeyValueObservingOptionNew context:nil];
    [smallView addObserver:largeView forKeyPath:MovieKVOValue options:NSKeyValueObservingOptionNew context:nil];
    //设置title的观察
    [smallView addObserver:self forKeyPath:MovieKVOValue options:NSKeyValueObservingOptionNew context:nil];
}

- (void)_creatLargeView {
    MovieLayout *layout = [[LargeLayout alloc] init];
    largeView = [[LargeCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeigth-64-49-KFooterHeight) collectionViewLayout:layout];
    [self addSubview:largeView];
}

- (void)_creatHeaderView {
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    headView = [[UIImageView alloc] initWithImage:image];
    
    
    
    headView.frame = CGRectMake(0, -KMovieSmallViewHeight-5, KScreenWidth, KHeaderHeight);
    //是否响应点击事件
    headView.userInteractionEnabled = YES;
    [self addSubview:headView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((KScreenWidth-26)/2, KHeaderHeight-20, 26, 20);
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    button.tag = 100;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:button];
    
    MovieLayout *layout = [[SmallLayout alloc] init];
    smallView = [[SmallCollectionView alloc] initWithFrame:CGRectMake(0, 5, KScreenWidth, KMovieSmallViewHeight) collectionViewLayout:layout];
    [headView addSubview:smallView];
    
}

- (void)_creatFooterView {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, KScreenHeigth-64-49-KFooterHeight, KScreenWidth, KFooterHeight)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:titleLabel];
}

- (void)_creatLightView {
    
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 124, 204)];
    left.image = [UIImage imageNamed:@"light"];
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth-10-124, 5, 124, 204)];
    right.image = [UIImage imageNamed:@"light"];
    [self addSubview:left];
    [self addSubview:right];
    
}

- (void)_createMaskView {
    _maskView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeigth - 64 - 49)];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0;
    [_maskView addTarget:self action:@selector(maskAction) forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:_maskView belowSubview:headView];
    
    
}

- (void)_createGesture {
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(maskAction)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

- (void)buttonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    //界面动画
    [UIView animateWithDuration:0.25 animations:^{
        headView.top = sender.selected? 0 : (-KMovieSmallViewHeight - 5);
        _maskView.alpha = sender.selected ? 0.6 : 0;
    }];
}

- (void)maskAction {
    
    UIButton *button = (UIButton *)[headView viewWithTag:100];
    [self buttonAction:button];
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    NSInteger index = [change[@"new"] integerValue];
    [self changeTitleWithIndex:index];
    
    
}

- (void)changeTitleWithIndex:(NSInteger)index {
    HomeModel *model = _dataArray[index];
    titleLabel.text = model.title;
}


@end
