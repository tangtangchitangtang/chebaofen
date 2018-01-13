//
//  modifyLoginView.m
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "modifyLoginView.h"

@implementation modifyLoginView

-(void)creatView{
    _userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    UIView *view1=[UIView new];
    [self addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *zhangHaoLabel=[UILabel new];
    [view1 addSubview:zhangHaoLabel];
    [zhangHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    zhangHaoLabel.text=@"用户名";
    zhangHaoLabel.textColor=ColorWithRGB(149, 149, 149);
    zhangHaoLabel.font=[UIFont systemFontOfSize:15];
    
    UILabel *zhangHaoLabel2=[UILabel new];
    [view1 addSubview:zhangHaoLabel2];
    [zhangHaoLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
    }];
    zhangHaoLabel2.textColor=ColorWithRGB(149, 149, 149);
    zhangHaoLabel2.font=[UIFont systemFontOfSize:15];
    zhangHaoLabel2.text=[_userDic objectForKey:@"sellerName"];
    
    UIView *xianView=[UIView new];
    [view1 addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(view1.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    xianView.backgroundColor=_LightGrey;
    
    
    UIView *view2=[UIView new];
    [self addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(xianView);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *oldPwdLabel=[UILabel new];
    [view2 addSubview:oldPwdLabel];
    [oldPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    oldPwdLabel.text=@"旧密码";
    oldPwdLabel.textColor=ColorWithRGB(49, 49, 49);
    oldPwdLabel.font=[UIFont systemFontOfSize:15];
    
    _oldText=[UITextField new];
    [view2 addSubview:_oldText];
    [_oldText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    _oldText.placeholder=@"请输入旧密码";
    _oldText.textColor=ColorWithRGB(49, 49, 49);
    _oldText.font=[UIFont systemFontOfSize:19];
    _oldText.keyboardType=UIKeyboardTypeDefault;
    _oldText.delegate=self;
    _oldText.secureTextEntry=YES;//密文
    _oldText.returnKeyType=UIReturnKeyDone;
    
    UIView *xianView2=[UIView new];
    [view2 addSubview:xianView2];
    [xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(view2.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    xianView2.backgroundColor=_LightGrey;
    
    UIView *view3=[UIView new];
    [self addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(xianView2);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *newsPwdLabel=[UILabel new];
    [view3 addSubview:newsPwdLabel];
    [newsPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    newsPwdLabel.text=@"新密码";
    newsPwdLabel.textColor=ColorWithRGB(49, 49, 49);
    newsPwdLabel.font=[UIFont systemFontOfSize:15];
    
    _newsText=[UITextField new];
    [view3 addSubview:_newsText];
    [_newsText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    _newsText.placeholder=@"请输入新密码";
    _newsText.textColor=ColorWithRGB(49, 49, 49);
    _newsText.font=[UIFont systemFontOfSize:19];
    _newsText.keyboardType=UIKeyboardTypeDefault;
    _newsText.delegate=self;
    _newsText.secureTextEntry=YES;//密文
    _newsText.returnKeyType=UIReturnKeyDone;
    
    UIView *xianView3=[UIView new];
    [self addSubview:xianView3];
    [xianView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(view3.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    xianView3.backgroundColor=_LightGrey;
    
    
    UIView *view4=[UIView new];
    [self addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(xianView3);
        make.height.mas_equalTo(50);
    }];
    
    UILabel *newsPwdLabel1=[UILabel new];
    [view4 addSubview:newsPwdLabel1];
    [newsPwdLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    newsPwdLabel1.text=@"确认密码";
    newsPwdLabel1.textColor=ColorWithRGB(49, 49, 49);
    newsPwdLabel1.font=[UIFont systemFontOfSize:15];
    
    _newsText1=[UITextField new];
    [view4 addSubview:_newsText1];
    [_newsText1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    _newsText1.placeholder=@"请输入新密码";
    _newsText1.textColor=ColorWithRGB(49, 49, 49);
    _newsText1.font=[UIFont systemFontOfSize:19];
    _newsText1.keyboardType=UIKeyboardTypeDefault;
    _newsText1.delegate=self;
    _newsText1.secureTextEntry=YES;//密文
    _newsText1.returnKeyType=UIReturnKeyDone;
    
    UIView *xianView4=[UIView new];
    [self addSubview:xianView4];
    [xianView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(view4.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    xianView4.backgroundColor=_LightGrey;
    
    UILabel *tiShiLabel=[UILabel new];
    [self addSubview:tiShiLabel];
    [tiShiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(xianView4.mas_bottom).mas_equalTo(10);
    }];
    tiShiLabel.text=@"密码至少8个字符,且同时包含字母和数字";
    tiShiLabel.font=[UIFont systemFontOfSize:14];
    tiShiLabel.textColor=ColorWithRGB(149, 149, 149);
    
    
    UIButton *loginBtn=[UIButton new];
    [self addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(xianView4.mas_bottom).mas_equalTo(60);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(_mainW-50);
    }];
    loginBtn.layer.cornerRadius=25;
    loginBtn.backgroundColor=ColorWithRGB(216 , 146, 51);
    [loginBtn setTitle:@"注册并登陆" forState:0];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
}
-(IBAction)loginBtn:(id)sender{
    NSString *sellerNam=[_userDic objectForKey:@"sellerNam"];
    NSString *passWord=_newsText.text;
    NSString *passWord1=_newsText1.text;
    NSString *sellerPwd=_oldText.text;
    
    if ([ZQTools charIsNil:sellerPwd]) {
        [ZQTools svpInfo:@"旧密码不能为空"];
        return;
    }
    if ([ZQTools charIsNil:passWord]) {
        [ZQTools svpInfo:@"新密码不能为空"];
        return;
    }
    if ((![passWord isEqualToString:passWord1])||[ZQTools charIsNil:passWord]) {
        [ZQTools svpInfo:@"两次密码不一致"];
        return;
    }
    if ([sellerPwd isEqualToString:passWord]) {
        [ZQTools svpInfo:@"新密码不能和旧密码一样"];
        return;
    }
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:sellerNam,@"sellerNam",passWord,@"newPassword",sellerPwd,@"sellerPwd", nil];
    [ZQTools AFNGetDataUrl:@"app/updatePwd" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
         [NSKeyedArchiver archiveRootObject:responseObject toFile:_userModelFile];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    } anderrorBlock:nil];
    

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
