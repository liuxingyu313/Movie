//
//  TopDetailViewController.h
//  WXMovie
//
//  Created by apple on 16/4/10.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopDetailHeaderView.h"


@interface TopDetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

{
    TopDetailHeaderView *headView;
}

@end
