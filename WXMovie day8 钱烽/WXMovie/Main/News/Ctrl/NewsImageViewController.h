//
//  NewsImageViewController.h
//  WXMovie
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NewsImageViewController : UIViewController <UICollectionViewDataSource,UIBarPositioningDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionFlowLayout;


@end
