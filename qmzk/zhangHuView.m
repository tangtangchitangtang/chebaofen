//
//  zhangHuView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "zhangHuView.h"
#import "mingXiViewController.h"
#import "yinHangfViewController.h"
#import "tiXianViewController.h"
#import "tiXianViewController.h"
@implementation zhangHuView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    UIImageView *topImageView=[UIImageView new];
    [self addSubview:topImageView];
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*300);
    }];
    topImageView.backgroundColor=_backgroundColor;
    
    [self creatTopView:topImageView];
    
    UIView *bottomView=[UIView new];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topImageView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90+1);
    }];
    bottomView.backgroundColor=[UIColor whiteColor];
    
    UIView *tiXainView=[UIView new];
    [bottomView addSubview:tiXainView];
    [tiXainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    tiXainView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToTiXian:)];
    [tiXainView addGestureRecognizer:tapGesture1];

    
    UIImageView *tiXainImagView=[UIImageView new];
    [tiXainView addSubview:tiXainImagView];
    [tiXainImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*15);
        make.width.mas_equalTo(_mainWidth*30);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    tiXainImagView.image=[UIImage imageNamed:@"我的-体现"];
    
    UILabel *tiXianLable=[UILabel new];
    [tiXainView addSubview:tiXianLable];
    [tiXianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(tiXainImagView.mas_right).mas_equalTo(_mainWidth*6);
    }];
    tiXianLable.text=@"提现";
    tiXianLable.textColor=ColorWithRGB(100, 100, 100);
    tiXianLable.font=[UIFont systemFontOfSize:16];
    
    UILabel *xianLable=[UILabel new];
    [bottomView addSubview:xianLable];
    [xianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tiXainView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xianLable.backgroundColor=_LightGrey;
    
    
    UIView *yinHangKaView=[UIView new];
    [bottomView addSubview:yinHangKaView];
    [yinHangKaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    yinHangKaView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToYingHang:)];
    [yinHangKaView addGestureRecognizer:tapGesture2];

    UIImageView *yinHangImagView=[UIImageView new];
    [yinHangKaView addSubview:yinHangImagView];
    [yinHangImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*15);
        make.width.mas_equalTo(_mainWidth*30);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    yinHangImagView.image=[UIImage imageNamed:@"icon-detail"];
    
    UILabel *yinHangLable=[UILabel new];
    [yinHangKaView addSubview:yinHangLable];
    [yinHangLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(tiXainImagView.mas_right).mas_equalTo(_mainWidth*6);
    }];
    yinHangLable.text=@"查看明细";
    yinHangLable.textColor=ColorWithRGB(100, 100, 100);
    yinHangLable.font=[UIFont systemFontOfSize:16];
    
//    UILabel *xianLabel2=[UILabel new];
//    [self addSubview:xianLabel2];
//    [xianLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(0);
//        make.height.mas_equalTo(14);
//        make.width.mas_equalTo(1);
//        make.bottom.mas_equalTo(-20);
//    }];
//    xianLabel2.backgroundColor=ColorWithRGB(150, 150, 150);
//
//    UILabel*shuoMingLabel=[UILabel new];
//    [self addSubview:shuoMingLabel];
//    [shuoMingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(xianLabel2);
//        make.right.mas_equalTo(xianLabel2.mas_right).mas_equalTo(-3);
//    }];
//    shuoMingLabel.text=@"账户说明";
//    shuoMingLabel.textColor=ColorWithRGB(150, 150, 150);
//    shuoMingLabel.font=[UIFont systemFontOfSize:13];
//
//    UILabel*shuoMingLabel2=[UILabel new];
//    [self addSubview:shuoMingLabel2];
//    [shuoMingLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(xianLabel2);
//        make.left.mas_equalTo(xianLabel2.mas_left).mas_equalTo(3);
//    }];
//    shuoMingLabel2.text=@"提现说明";
//    shuoMingLabel2.textColor=ColorWithRGB(150, 150, 150);
//    shuoMingLabel2.font=[UIFont systemFontOfSize:13];
    
}

-(void)creatTopView:(UIImageView *)view{
    view.userInteractionEnabled=YES;
    
//    UIButton *fanhuiBtn=[UIButton new];
//    [view addSubview:fanhuiBtn];
//    [fanhuiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(20);
//        make.left.mas_equalTo(10);
//        make.height.width.mas_equalTo(40);
//    }];
//    [fanhuiBtn setImage:[UIImage imageNamed:@"返回"] forState:0];
//    [fanhuiBtn addTarget:self action:@selector(fanHui:) forControlEvents:UIControlEventTouchUpInside];
//    
    UILabel *yuELabel=[UILabel new];
    [view addSubview:yuELabel];
    [yuELabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_mainHeight*80);
    }];
    yuELabel.text=@"账户余额(元)";
    yuELabel.textColor=[UIColor whiteColor];
    yuELabel.font=[UIFont systemFontOfSize:13];
    
    _yuELabel2=[UILabel new];
    [view addSubview:_yuELabel2];
    [_yuELabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_mainHeight*120);
    }];
    _yuELabel2.textColor=[UIColor whiteColor];
    _yuELabel2.font= [UIFont fontWithName:@"Helvetica-Bold" size:35];

    UILabel *yuELabel3=[UILabel new];
    [view addSubview:yuELabel3];
    [yuELabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_mainHeight*180);
    }];
    yuELabel3.text=@"";
    yuELabel3.textColor=[UIColor whiteColor];
    yuELabel3.font=[UIFont systemFontOfSize:15];
    
//    UIButton *xianXiBtn=[UIButton new];
//    [view addSubview:xianXiBtn];
//    [xianXiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(0);
//        make.bottom.mas_equalTo(_mainHeight*-20);
//        make.width.mas_equalTo(_mainWidth*150);
//        make.height.mas_equalTo(_mainHeight*40);
//    }];
//    xianXiBtn.layer.cornerRadius=_mainHeight*20;
//    xianXiBtn.layer.borderWidth=0.5;
//    xianXiBtn.layer.borderColor=[UIColor whiteColor].CGColor;
//    [xianXiBtn setTitle:@"查看详细" forState:0];
//    [xianXiBtn setTitleColor:[UIColor whiteColor] forState:0];
//    xianXiBtn.titleLabel.font=[UIFont systemFontOfSize:13];
//    [xianXiBtn addTarget:self action:@selector(pushToMingXi:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)fanHui:(id)sender{
    [self.viewController.navigationController popViewControllerAnimated:YES];

}
-(IBAction)pushToMingXi:(id)sender{
    mingXiViewController *mingXi=[[mingXiViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:mingXi];
}

-(void)pushToYingHang:(UITapGestureRecognizer *)tap{
//    yinHangfViewController *yinHang=[[yinHangfViewController alloc] init];
//    [ZQTools pushNextViewController:self.viewController andRootController:yinHang];
    
    mingXiViewController *mingXi=[[mingXiViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:mingXi];
}
-(void)pushToTiXian:(UITapGestureRecognizer *)tap{
//    yinHangfViewController *yinHang=[[yinHangfViewController alloc] init];
//    yinHang.abc=1;
//    [ZQTools pushNextViewController:self.viewController andRootController:yinHang];

    tiXianViewController *tiXian=[[tiXianViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:tiXian];
}
@end
