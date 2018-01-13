//
//  userView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "userView.h"
//#import "wangJiViewController.h"
#import "loginViewController.h"
#import "modifyLoginViewController.h"
@implementation userView
-(void)creatView{
    
    self.backgroundColor=_LightGrey;
    
    UIView *phoneView=[UIView new];
    [self addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    phoneView.backgroundColor=[UIColor whiteColor];
    
    UILabel *phongLabel=[UILabel new];
    [phoneView addSubview:phongLabel];
    [phongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*10);
    }];
    phongLabel.text=@"账户名";
    phongLabel.font=[UIFont fontWithName:@"Helvetica" size:14];
    phongLabel.textColor=ColorWithRGB(50, 50, 50);
    
//    UIImageView *jianTouIamgeView=[UIImageView new];
//    [phoneView addSubview:jianTouIamgeView];
//    [jianTouIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(0);
//        make.right.mas_equalTo(-_mainWidth*5);
//        make.width.mas_equalTo(_mainWidth*25);
//        make.height.mas_equalTo(_mainHeight*25);
//    }];
//    jianTouIamgeView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
    
    UILabel *bangDingLabel=[UILabel new];
    [phoneView addSubview:bangDingLabel];
    [bangDingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *phone=[dic2 objectForKey:@"phone"];
    if ([ZQTools charIsNil:phone]) {
        phone=@"18183128005";
    }
    
    bangDingLabel.text=phone;
    bangDingLabel.textColor=ColorWithRGB(150, 150, 150);
    bangDingLabel.font=[UIFont systemFontOfSize:14];
    
    
    
    
    UIView *weiXinView=[UIView new];
    [self addSubview:weiXinView];
    [weiXinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    weiXinView.backgroundColor=[UIColor whiteColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToMiMa:)];
    [weiXinView addGestureRecognizer:tapGesture];
    
    UILabel *weiXinLabel=[UILabel new];
    [weiXinView addSubview:weiXinLabel];
    [weiXinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*10);
    }];
    weiXinLabel.text=@"账号密码";
    weiXinLabel.font=[UIFont fontWithName:@"Helvetica" size:14];
    weiXinLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UIImageView *jianTouIamgeView2=[UIImageView new];
    [weiXinView addSubview:jianTouIamgeView2];
    [jianTouIamgeView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-_mainWidth*5);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView2.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
    
    
    UIView *QQView=[UIView new];
    [self addSubview:QQView];
    [QQView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weiXinView.mas_bottom).mas_equalTo(_mainHeight*7);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    QQView.backgroundColor=[UIColor whiteColor];
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToLogin:)];
    [QQView addGestureRecognizer:tapGesture2];
    
    UILabel *QQLabel=[UILabel new];
    [QQView addSubview:QQLabel];
    [QQLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    QQLabel.text=@"退出登录";
    QQLabel.font=[UIFont fontWithName:@"Helvetica" size:14];
    QQLabel.textColor=ColorWithRGB(50, 50, 50);
    
 
}

-(void)pushToMiMa:(UITapGestureRecognizer *)tap{
    modifyLoginViewController *xiuGai=[[modifyLoginViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:xiuGai];
}

-(void)pushToLogin:(UITapGestureRecognizer *)tap{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager removeItemAtPath:_userModelFile error:nil]) {
        loginViewController *login=[[loginViewController alloc] init];
        [ZQTools pushNextViewController:self.viewController andRootController:login];
    }
    
    
}


@end
