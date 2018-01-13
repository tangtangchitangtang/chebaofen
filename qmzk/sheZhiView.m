//
//  sheZhiView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "sheZhiView.h"
#import "gengXinViewController.h"
#import "fanKuiViewController.h"
#import "userViewController.h"
#import "gengXinViewController.h"
@implementation sheZhiView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    NSArray *nameArr=[NSArray arrayWithObjects:@"账户安全",@"版本更新",@"清除缓存",@"意见反馈",nil];
    for (int i=0; i<nameArr.count; i++) {
        UIView *beiJingView2=[UIView new];
        [self addSubview:beiJingView2];
        [beiJingView2 mas_makeConstraints:^(MASConstraintMaker *make) {
      
            make.top.mas_equalTo(70+45*_mainHeight*i+i*1);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45*_mainHeight);
        }];
        beiJingView2.backgroundColor=[UIColor whiteColor];
        beiJingView2.tag=i;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToZhangHu:)];
        [beiJingView2 addGestureRecognizer:tapGesture];
        
        UILabel *nameLabel=[UILabel new];
        [beiJingView2 addSubview:nameLabel];
       
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(_mainWidth*15);
        }];
     
        nameLabel.text=nameArr[i];
        nameLabel.font=[UIFont fontWithName:@"Helvetica" size:14];
        nameLabel.textColor=ColorWithRGB(50, 50, 50);
        
        UIImageView *jianTouIamgeView=[UIImageView new];
        [beiJingView2 addSubview:jianTouIamgeView];
        [jianTouIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(_mainWidth*25);
            make.height.mas_equalTo(_mainHeight*25);
        }];
        jianTouIamgeView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
 
        if (i==2) {
            _neiChunLabel=[UILabel new];
            [beiJingView2 addSubview:_neiChunLabel];
            [_neiChunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.right.mas_equalTo(-25*_mainWidth);
            }];
            _neiChunLabel.text=[NSString stringWithFormat:@"%.1fM",_neiCun];
            _neiChunLabel.textColor=ColorWithRGB(100, 100, 100);
            _neiChunLabel.font=[UIFont systemFontOfSize:16];
            
        }
        
    }
}
-(void)pushToZhangHu:(UITapGestureRecognizer *)tap{
    if (tap.view.tag==0) {
        userViewController *geRen=[[userViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }

    if (tap.view.tag==2) {
        [self creatAltel];
    }
    if (tap.view.tag==1) {
        gengXinViewController *geRen=[[gengXinViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }
    if (tap.view.tag==3) {
        fanKuiViewController *geRen=[[fanKuiViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }


}

- (void)clearFile
{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory , NSUserDomainMask , YES ) firstObject];
    NSArray * files = [[NSFileManager defaultManager ] subpathsAtPath :cachePath];
    //NSLog ( @"cachpath = %@" , cachePath);
    for ( NSString * p in files) {
        
        NSError * error = nil ;
        //获取文件全路径
        NSString * fileAbsolutePath = [cachePath stringByAppendingPathComponent :p];
        
        if ([[NSFileManager defaultManager ] fileExistsAtPath :fileAbsolutePath]) {
            [[NSFileManager defaultManager ] removeItemAtPath :fileAbsolutePath error :&error];
        }
    }
    
    //读取缓存大小
//        float cacheSize = [self readCacheSize] *1024; 
    //    self.cacheSize.text = [NSString stringWithFormat:@"%.2fKB",cacheSize];
    
}

-(void)creatAltel{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"是否要清除缓存" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self clearFile];
        _neiChunLabel.text=@"0M";
    }]];
    [self.viewController presentViewController:alertController animated:YES completion:nil];
}



@end
