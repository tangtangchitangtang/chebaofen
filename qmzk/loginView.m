//
//  loginView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "loginView.h"
#import "wangJiViewController.h"
#import "shouYeViewController.h"
@implementation loginView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    UIImageView *iamgeView=[UIImageView new];
    [self addSubview:iamgeView];
    [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH*0.35);
    }];
    iamgeView.image=[UIImage imageNamed:@"1"];
    
    
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_mainW);
        make.top.mas_equalTo(iamgeView.mas_bottom);
        make.height.mas_equalTo(_mainHeight*120+1);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];

    UILabel *zhangHaoLabel=[UILabel new];
    [beiJingView addSubview:zhangHaoLabel];
    [zhangHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-_mainHeight*30+0.5);
        make.left.mas_equalTo(_mainWidth*15);
    }];
    zhangHaoLabel.text=@"账号";
    zhangHaoLabel.font=[UIFont fontWithName:@"Helvetica" size:18];
    zhangHaoLabel.textColor=ColorWithRGB(243, 174, 172);
    
    _nameText=[UITextField new];
    [beiJingView addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(zhangHaoLabel);
        make.left.mas_equalTo(_mainWidth*100);
        make.right.mas_equalTo(-_mainWidth*40);
        make.height.mas_equalTo(60*_mainHeight);
    }];
    _nameText.placeholder=@"请输入账号";
    _nameText.font=[UIFont fontWithName:@"Helvetica" size:18];
    _nameText.textColor=ColorWithRGB(50,50, 50);
    _nameText.delegate=self;
    _nameText.clearsOnBeginEditing=YES;//再次编辑时清空文本框

    UILabel*xianLabel=[UILabel new];
    [beiJingView addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(_mainW);
    }];
    xianLabel.backgroundColor=_LightGrey;
    
    
    UILabel *pwdLabel=[UILabel new];
    [beiJingView addSubview:pwdLabel];
    [pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_mainHeight*30+0.5);
        make.left.mas_equalTo(_mainWidth*15);
    }];
    pwdLabel.text=@"密码";
    pwdLabel.font=[UIFont fontWithName:@"Helvetica" size:18];
    pwdLabel.textColor=ColorWithRGB(50, 50, 50);
    
    _pwdText=[UITextField new];
    [beiJingView addSubview:_pwdText];
    [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(pwdLabel);
        make.left.mas_equalTo(_mainWidth*100);
        make.right.mas_equalTo(-_mainWidth*40);
        make.height.mas_equalTo(60*_mainHeight);
    }];
    _pwdText.placeholder=@"请输入密码";
    _pwdText.font=[UIFont fontWithName:@"Helvetica" size:18];
    _pwdText.textColor=ColorWithRGB(50,50, 50);
    _pwdText.delegate=self;
    _pwdText.secureTextEntry=YES;//密文
    _pwdText.clearsOnBeginEditing=YES;//再次编辑时清空文本框
    
    UIImageView *btnImage=[UIImageView new];
    [self addSubview:btnImage];
    [btnImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(beiJingView.mas_bottom).mas_equalTo(_mainHeight*40);
        make.height.mas_equalTo(_mainHeight*70);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
    }];
    btnImage.image=[UIImage imageNamed:@"logon"];
    
    UILabel *btnlabel=[UILabel new];
    [btnImage addSubview:btnlabel];
    [btnlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-_mainHeight*12);
        make.centerX.mas_equalTo(0);
    }];
    btnlabel.text=@"登陆";
    btnlabel.font=[UIFont fontWithName:@"Helvetica" size:21];
    btnlabel.textColor=[UIColor whiteColor];
    btnImage.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logingBtn:)];
    [btnImage addGestureRecognizer:tapGesture1];
    
    UILabel *zhuCeLabel=[UILabel new];
    [self addSubview:zhuCeLabel];
    [zhuCeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(btnImage.mas_bottom).mas_equalTo(40*_mainHeight);
        make.centerX.mas_equalTo(0);
    }];
    zhuCeLabel.text=@"忘记密码?";
    zhuCeLabel.font=[UIFont fontWithName:@"Helvetica" size:14];
    zhuCeLabel.textColor=_backgroundColor;
    zhuCeLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToWangJi:)];
    [zhuCeLabel addGestureRecognizer:tapGesture2];
    

}

-(IBAction)logingBtn:(UITapGestureRecognizer *)btn{
    
    NSString *nameStr=[NSString stringWithFormat:@"%@",_nameText.text];
    NSString *pwdStr=[NSString stringWithFormat:@"%@",_pwdText.text];
    
    
    if ([nameStr isEqualToString:@""]||nameStr==nil||[pwdStr isEqualToString:@""]||pwdStr==nil) {
        [ZQTools svpInfo:@"输入有错"];
        return;
    }
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:nameStr,@"sellerName",pwdStr,@"sellerPwd",nil];

    
    [ZQTools AFNPOSTDataUrl:@"seller/slogin" Dict:dict andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
    
        [NSKeyedArchiver archiveRootObject:responseObject toFile:_userModelFile];
    
        shouYeViewController *wodeView=[[shouYeViewController alloc] init];
        UINavigationController *nav1= [[UINavigationController alloc] initWithRootViewController:wodeView];
        self.window.rootViewController=nav1;
    
    } anderrorBlock:nil];
    


}


-(void)pushToWangJi:(UITapGestureRecognizer *)tap{
    
    wangJiViewController *WangJi=[[wangJiViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:WangJi];


}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}
@end
