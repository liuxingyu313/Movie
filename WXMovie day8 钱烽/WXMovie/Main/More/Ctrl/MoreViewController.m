//
//  MoreViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 wxhl. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSString *userName;
    UIImage *userIcon;
    
}
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;


@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDataFromSandBox];
    self.navigationItem.title = @"更多";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    self.tableView.separatorColor = KTableViewSeColor;
    //NSHomeDirectory()通过这个方法找到当前文件的沙盒
    NSLog(@"%@",NSHomeDirectory());
    //找到缓存 －》计算大小－》点击cell ->弹出alertView->清除缓存－》刷新数据
    //创建头视图
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 150)];
    headView.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:userIcon forState:UIControlStateNormal];
    [button setTitle:@"编辑" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(25, 25, 100, 100);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 50;
    button.layer.masksToBounds = YES;
    button.tag = 2016;
    [headView addSubview:button];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 25, 200, 40)];
    nameLabel.text = userName;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor yellowColor];
    nameLabel.tag= 2017;
    [headView addSubview:nameLabel];
    self.tableView.tableHeaderView = headView;
  
}

- (void)buttonAction:(UIButton *)sender {
    //配置相片的来源——》弹出相册－》选择图片－》返回选择的图片——》配置给button
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //弹出相册
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:NULL];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self readCatchSize];
}

- (void)readCatchSize {
    
    NSInteger fileSize = [[SDImageCache sharedImageCache] getSize];
    NSLog(@"%ld",fileSize);
    self.sizeLabel.text = [NSString stringWithFormat:@"%.2f MB",fileSize/1024.0/1024.0];
    
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"确定清除缓存%@",self.sizeLabel.text] preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sizeLabel.text = @"0.0 MB";
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [[SDImageCache sharedImageCache] clearDisk];
            

        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
        [self presentViewController:alert animated:YES completion:NULL];

}
    
}
- (NSInteger)getCatchSize {
    
    NSInteger fileSize = 0;
    //拿到缓存文件夹
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:catchPath];
    //拿到缓存文件夹下所有文件的属性
    for (NSString *fileName in fileEnumerator) {
       //所有文件的路径
        NSString *filePath = [catchPath stringByAppendingPathComponent:fileName];
        //所有文件的大小
        NSDictionary *attDic = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        fileSize += [attDic fileSize];
    }
    return fileSize;
}

- (void)clearCatch {
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //清除
    [[NSFileManager defaultManager] removeItemAtPath:catchPath error:NULL];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//获取图片的delegate 在相册中选择图片时调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    UIButton *button = [self.tableView.tableHeaderView viewWithTag:2016];
    [button setImage:image forState:UIControlStateNormal];
    
    UILabel *label = [self.tableView.tableHeaderView viewWithTag:2017];
    userName = @"小皇帝詹姆斯";
    label.text = userName;
    [self saveDataToSandBox];
    
    
    
}

//保存数据到沙盒中
- (void)saveDataToSandBox {
    
    if (userIcon != nil) {
        //系统设定的类 ，用于app的一些基础设置 plist 归档 ，数据库，CoreData
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //一定要转换成data 第二个参数表示压缩比 最大0  最小1
        NSData *data = UIImageJPEGRepresentation(userIcon, 0.8);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"userIcon"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

//从沙盒中获取数据

- (void)getDataFromSandBox {
    userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    userIcon = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"userIcon"]];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
