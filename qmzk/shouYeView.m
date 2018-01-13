

//
//  shouYeView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shouYeView.h"
#import "dingDanViewController.h"
#import "zhangHuViewController.h"
#import "sheZhiViewController.h"
#import "zhaoPingViewController.h"
#import "shangPingViewController.h"
#import "guanLiViewController.h"
#import "menDianViewController.h"
#import "duiHuanViewController.h"
#import "xiTongViewController.h"
#import "SGScanningQRCodeVC.h"
#import "SGGenerateQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
#import "SGAlertView.h"
#import <Photos/Photos.h>
#import "AddLifeCircle.h" //发布界面
#import "MingShengViewController.h"
#import "goodsViewController.h"
#import "commentViewController.h"

@implementation shouYeView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    [self creatTopView];
    [self creatCenterView];
    
    
}
-(void)creatTopView{
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    
    UIImageView *topVioew=[UIImageView new];
    [self addSubview:topVioew];
    [topVioew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*190);
    }];
    topVioew.userInteractionEnabled=YES;
    
    topVioew.image=[UIImage imageNamed:@"background"];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToGeRenView:)];
//    [topVioew addGestureRecognizer:tapGesture];
    
    
    UIView *touXiangBeiJingView=[UIView new];
    [topVioew addSubview:touXiangBeiJingView];
    [touXiangBeiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(20);
        make.left.mas_equalTo(_mainWidth*30);
        make.width.height.mas_equalTo(_mainWidth*70);
    }];
    touXiangBeiJingView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
    touXiangBeiJingView.layer.cornerRadius=_mainWidth*35;
    
    
    UIImageView *touXiangImgaeView=[UIImageView new];
    [touXiangBeiJingView addSubview:touXiangImgaeView];
    [touXiangImgaeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.height.mas_equalTo(_mainWidth*64);
    }];
    touXiangImgaeView.layer.masksToBounds=YES;
    touXiangImgaeView.layer.cornerRadius=_mainWidth*32;
    NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,[userDic objectForKey:@"picture"]]];
//    [touXiangImgaeView sd_setImageWithURL:rul];
    [touXiangImgaeView setImage:[UIImage imageNamed:@"head1"]];

    UILabel *nameLabe=[UILabel new];
    [topVioew addSubview:nameLabe];
    [nameLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(5);
        make.left.mas_equalTo(touXiangBeiJingView.mas_right).mas_equalTo(15);
        make.right.mas_equalTo(_mainWidth*-100);
    }];
    nameLabe.textColor=[UIColor whiteColor];
    nameLabe.text=[userDic objectForKey:@"acctName"];
    nameLabe.font=[UIFont systemFontOfSize:18];
    
    UIImageView *phoneImageView=[UIImageView new];
    [topVioew addSubview:phoneImageView];
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(35);
        make.left.mas_equalTo(nameLabe);
        make.width.mas_equalTo(13);
        make.height.mas_equalTo(20);
    }];
    phoneImageView.image=[UIImage imageNamed:@"location"];
    
    UILabel *phoneLable=[UILabel new];
    [topVioew addSubview:phoneLable];
    [phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(35);
        make.left.mas_equalTo(phoneImageView.mas_right).mas_equalTo(_mainWidth*4);
        make.right.mas_equalTo(_mainWidth*-100);
    }];
    phoneLable.textColor=[UIColor whiteColor];
    phoneLable.text=[userDic objectForKey:@"adress"];
    phoneLable.font=[UIFont systemFontOfSize:15];
    
    UIView *bottomView=[UIView new];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topVioew.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*57);
    }];
    bottomView.backgroundColor=[UIColor whiteColor];
    
    UILabel *xianlabel=[UILabel new];
    [bottomView addSubview:xianlabel];
    [xianlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*47);
        make.width.mas_equalTo(1);
    }];
    xianlabel.backgroundColor=_LightGrey;
    
    UIView *shaoMaView=[UIView new];
    [bottomView addSubview:shaoMaView];
    [shaoMaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.mas_equalTo(0);
        make.right.mas_equalTo(xianlabel.mas_left);
    }];
    UITapGestureRecognizer *tapGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanningQRCode:)];
    [shaoMaView addGestureRecognizer:tapGesture5];
    
    UIImageView *shaoMaImageView=[UIImageView new];
    [shaoMaView addSubview:shaoMaImageView];
    [shaoMaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(-_mainWidth*30);
        make.height.width.mas_equalTo(_mainWidth*25);
    }];
    shaoMaImageView.image=[UIImage imageNamed:@"scan-1"];
    
    UILabel *shaoMaLabl=[UILabel new];
    [shaoMaView addSubview:shaoMaLabl];
    [shaoMaLabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(shaoMaImageView.mas_right).mas_equalTo(_mainWidth*7);
    }];
    shaoMaLabl.text=@"扫码验证";
    shaoMaLabl.font=[UIFont systemFontOfSize:15];
    shaoMaLabl.textColor=ColorWithRGB(50, 50, 50);
    
    UIView *shuRuView=[UIView new];
    [bottomView addSubview:shuRuView];
    [shuRuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.right.mas_equalTo(0);
        make.left.mas_equalTo(xianlabel.mas_right);
    }];
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shuRuYanZheng:)];
    [shuRuView addGestureRecognizer:tapGesture4];
    
    UIImageView *shuRuImageView=[UIImageView new];
    [shuRuView addSubview:shuRuImageView];
    [shuRuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(-_mainWidth*20);
        make.width.mas_equalTo(_mainWidth*30);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    shuRuImageView.image=[UIImage imageNamed:@"import"];
    
    UILabel *shuRuLabl=[UILabel new];
    [shuRuView addSubview:shuRuLabl];
    [shuRuLabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(shuRuImageView.mas_right).mas_equalTo(_mainWidth*7);
    }];
    shuRuLabl.text=@"输入验证";
    shuRuLabl.font=[UIFont systemFontOfSize:15];
    shuRuLabl.textColor=ColorWithRGB(50, 50, 50);
    
}
-(void)creatCenterView{
    UIView *centerView=[UIView new];
    [self addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*257);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(254);
    }];
    centerView.backgroundColor=[UIColor whiteColor];

   
    NSArray *nameArr=[NSArray arrayWithObjects:@"订单管理",@"评价回复",@"我要提现",@"店铺信息",@"商品余数", nil];
    
    for (int i=0; i<5; i++) {
        UIView *beiJingView=[UIView new];
        [centerView addSubview:beiJingView];
        [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.top.mas_equalTo(51*i);
        }];
        beiJingView.tag=i;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToDingDan:)];
        [beiJingView addGestureRecognizer:tapGesture];
        if (i!=4) {
            UIView *xianView=[UIView new];
            [centerView addSubview:xianView];
            [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10);
                make.right.mas_equalTo(0);
                make.height.mas_equalTo(1);
                make.top.mas_equalTo(beiJingView.mas_bottom);
            }];
            xianView.backgroundColor=_LightGrey;
        }
        
        UIImageView *imageView=[UIImageView new];
        [beiJingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(25);
        }];
        imageView.image=[UIImage imageNamed:nameArr[i]];
        
        UILabel *label=[UILabel new];
        [beiJingView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        label.text=nameArr[i];
        label.textColor=ColorWithRGB(49, 49, 49);
        label.font=[UIFont systemFontOfSize:16];
        
        UIImageView *jianTou=[UIImageView new];
        [beiJingView addSubview:jianTou];
        [jianTou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(15);
        }];
        jianTou.image=[UIImage imageNamed:@"arrow-right"];
    }
   
}

-(void)pushToDingDan:(UITapGestureRecognizer *)tap{
    if (tap.view.tag==0) {
        dingDanViewController *geRen=[[dingDanViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }
    if (tap.view.tag==2) {
        zhangHuViewController *geRen=[[zhangHuViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }
    if (tap.view.tag==4) {
        goodsViewController *geRen=[[goodsViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }
    if (tap.view.tag==3) {
        menDianViewController *geRen=[[menDianViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }
    if (tap.view.tag==1) {
        commentViewController *geRen=[[commentViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
    }
//    if (tap.view.tag==6) {
//        MingShengViewController *geRen=[[MingShengViewController alloc] init];
//        [ZQTools pushNextViewController:self.viewController andRootController:geRen];
//    
//    }

}

-(void)pushToGeRenView:(UITapGestureRecognizer *)tap{
//    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
//    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
//    NSNumber *idSeller=[userBasic objectForKey:@"idUserBasic"];
//    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idSeller,@"basicId", nil];
//    [ZQTools AFNGetDataUrl:@"seller/findAllSesllerDetail" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
//        NSDictionary *userBasic2=[responseObject objectForKey:@"seller"];
//        int auditState=[[userBasic2 objectForKey:@"auditState"] intValue];
    
//        if (auditState!=3) {
            menDianViewController *geRen=[[menDianViewController alloc] init];
//            geRen.dic=responseObject;
            [ZQTools pushNextViewController:self.viewController andRootController:geRen];

//        }
//    } anderrorBlock:nil];
    
    
}
- (void)scanningQRCode:(UITapGestureRecognizer *)sender {
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        // 判断授权状态
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusRestricted) { // 因为家长控制, 导致应用无法方法相册(跟用户的选择没有关系)
//            [self alertTitle:@"因为系统原因, 无法访问相册"];
        } else if (status == PHAuthorizationStatusDenied) { // 用户拒绝当前应用访问相册
            SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"请去-> [设置 - 隐私 - 照片 - SGQRCodeExample] 打开访问开关" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
            [alertView show];
        } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许当前应用访问相册
            SGScanningQRCodeVC *scanningQRCodeVC = [[SGScanningQRCodeVC alloc] init];
            [self.viewController.navigationController pushViewController:scanningQRCodeVC animated:YES];
        } else if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
            // 弹框请求用户授权
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) { // 用户点击了好
                    
                }
            }];
        }
        
    } else {
        SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"未检测到您的摄像头, 请在真机上测试" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
        [alertView show];
    }
}

- (void)shuRuYanZheng:(UITapGestureRecognizer *)sender{
    duiHuanViewController *duiHuan=[[duiHuanViewController alloc] init];
    duiHuan.abc=2;
    [ZQTools pushNextViewController:self.viewController andRootController:duiHuan];

}



@end
