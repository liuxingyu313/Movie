//
//  PhotoCell.m
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "PhotoCell.h"
#import "UIView+viewController.h"

@implementation PhotoCell
{
    UIImageView *_imageView;
    UIAlertController *alertCtrl;
}
 
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self _createImageView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _createImageView];
}

- (void)setImgUrlStr:(NSString *)imgUrlStr {
    _imgUrlStr= imgUrlStr;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imgUrlStr]];

    
}

- (void)_createImageView {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.userInteractionEnabled = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [_imageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(savePhoto:)]];
    [self.contentView addSubview:_imageView];
    
}

- (void)savePhoto:(UIGestureRecognizer *)longpress {
    
    alertCtrl = [UIAlertController alertControllerWithTitle:@"是否保存图片？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertCtrl addAction:[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //判断状态 -》 拿到图片 -》 找到相册 -》 保存到相册
        //if (longpress.state == UIGestureRecognizerStateBegan) {
            UIImage *img = _imageView.image;
            if (img) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
                
                hud.labelText = @"Saving";
                hud.dimBackground = YES;
                //保存图片到相册的方法
                UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void * _Nullable)(hud));
            }
        
    }]];
    [alertCtrl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
 
    [self.viewController presentViewController:alertCtrl animated:YES completion:NULL];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    MBProgressHUD *hud = (__bridge MBProgressHUD *)(contextInfo);
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"Success!";
    [hud hide:YES afterDelay:1.5];
    
    
    NSLog(@"保存成功");
    [alertCtrl dismissViewControllerAnimated:YES completion:NULL];
}


@end
