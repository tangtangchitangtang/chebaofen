//
//  wangJiView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "wangJiView.h"

@implementation wangJiView

-(void)creatView{
    _phoneText=[UITextField new];
    [self addSubview:_phoneText];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(_mainWidth*0);
        make.right.mas_equalTo(-_mainWidth*0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    _phoneText.placeholder=@"手机号";
    _phoneText.font=[UIFont systemFontOfSize:16];
    _phoneText.keyboardType=UIKeyboardTypePhonePad;
    _phoneText.textAlignment=NSTextAlignmentCenter;
    _phoneText.delegate=self;
    UIImageView *phoneimageView=[UIImageView new];
    [_phoneText addSubview:phoneimageView];
    [phoneimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*15);
        make.width.mas_equalTo(30*_mainWidth);
        make.height.mas_equalTo(30*_mainHeight);
        
    }];
    phoneimageView.image=[UIImage imageNamed:@"手机号"];
    
    UILabel *XianLabe=[UILabel new];
    [self addSubview:XianLabe];
    [XianLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_phoneText.mas_bottom).mas_equalTo(_mainHeight*4);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    XianLabe.backgroundColor=_LightGrey;
    
    _yanZhengText=[UITextField new];
    [self addSubview:_yanZhengText];
    [_yanZhengText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(XianLabe.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(_mainWidth*0);
        make.right.mas_equalTo(-_mainWidth*0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    _yanZhengText.placeholder=@"验证码";
    _yanZhengText.font=[UIFont systemFontOfSize:16];
    _yanZhengText.keyboardType=UIKeyboardTypePhonePad;
    _yanZhengText.textAlignment=NSTextAlignmentCenter;
    _yanZhengText.delegate=self;
    
    UIImageView *yanZhengimageView=[UIImageView new];
    [_yanZhengText addSubview:yanZhengimageView];
    [yanZhengimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*15);
        make.width.mas_equalTo(30*_mainWidth);
        make.height.mas_equalTo(30*_mainHeight);
        
    }];
    yanZhengimageView.image=[UIImage imageNamed:@"矢量智能对象-拷贝-2"];
    
    
    _yanZhenMaBtn =[UIButton new];
    [_yanZhengText addSubview:_yanZhenMaBtn];
    [_yanZhenMaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10*_mainWidth);
        make.width.mas_equalTo(80*_mainWidth);
        make.height.mas_equalTo(25*_mainHeight);
    }];
    _yanZhenMaBtn.layer.borderColor=_backgroundColor.CGColor;
    _yanZhenMaBtn.layer.borderWidth=1;
    _yanZhenMaBtn.layer.cornerRadius=3;
    [_yanZhenMaBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_yanZhenMaBtn setTitleColor:_backgroundColor forState:UIControlStateNormal];
    _yanZhenMaBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [_yanZhenMaBtn addTarget:self action:@selector(YanZhen:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *XianLabe2=[UILabel new];
    [self addSubview:XianLabe2];
    [XianLabe2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_yanZhengText.mas_bottom).mas_equalTo(_mainHeight*4);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    XianLabe2.backgroundColor=_LightGrey;
    
    
    _baoCunBtn=[UIButton new];
    [self addSubview:_baoCunBtn];
    [_baoCunBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(XianLabe2.mas_bottom).mas_equalTo(_mainHeight*30);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
        make.height.mas_equalTo(_mainHeight*35);
    }];
    _baoCunBtn.backgroundColor=_backgroundColor;
    _baoCunBtn.layer.cornerRadius=_mainHeight*5;
    [_baoCunBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_baoCunBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _baoCunBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
}
-(void)creatView2{
    
    _pwdText=[UITextField new];
    [self addSubview:_pwdText];
    [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(_mainWidth*0);
        make.right.mas_equalTo(-_mainWidth*0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    _pwdText.placeholder=@"请输入6-12密码";
    _pwdText.font=[UIFont systemFontOfSize:16];
//    _pwdText.keyboardType=UIKeyboardTypePhonePad;
    _pwdText.textAlignment=NSTextAlignmentCenter;
    _pwdText.delegate=self;
    
    UIImageView *phoneimageView=[UIImageView new];
    [_pwdText addSubview:phoneimageView];
    [phoneimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*15);
        make.width.mas_equalTo(30*_mainWidth);
        make.height.mas_equalTo(30*_mainHeight);
        
    }];
    phoneimageView.image=[UIImage imageNamed:@"矢量智能对象-拷贝-2"];
    
    UILabel *XianLabe=[UILabel new];
    [self addSubview:XianLabe];
    [XianLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_pwdText.mas_bottom).mas_equalTo(_mainHeight*4);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    XianLabe.backgroundColor=_LightGrey;
    
    
    _pwdText2=[UITextField new];
    [self addSubview:_pwdText2];
    [_pwdText2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(XianLabe.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(_mainWidth*0);
        make.right.mas_equalTo(-_mainWidth*0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    _pwdText2.placeholder=@"请输入6-12密码";
    _pwdText2.font=[UIFont systemFontOfSize:16];
//    _pwdText2.keyboardType=UIKeyboardTypePhonePad;
    _pwdText2.textAlignment=NSTextAlignmentCenter;
    _pwdText2.delegate=self;
    UIImageView *phoneimageView2=[UIImageView new];
    [_pwdText2 addSubview:phoneimageView2];
    [phoneimageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*15);
        make.width.mas_equalTo(30*_mainWidth);
        make.height.mas_equalTo(30*_mainHeight);
        
    }];
    phoneimageView2.image=[UIImage imageNamed:@"矢量智能对象-拷贝-2"];
    
    UILabel *XianLabe2=[UILabel new];
    [self addSubview:XianLabe2];
    [XianLabe2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_pwdText2.mas_bottom).mas_equalTo(_mainHeight*4);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    XianLabe2.backgroundColor=_LightGrey;
    
    _queRen=[UIButton new];
    [self addSubview:_queRen];
    [_queRen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(XianLabe2.mas_bottom).mas_equalTo(_mainHeight*30);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
        make.height.mas_equalTo(_mainHeight*35);
    }];
    _queRen.backgroundColor=_backgroundColor;
    _queRen.layer.cornerRadius=_mainHeight*5;
    [_queRen setTitle:@"确认" forState:UIControlStateNormal];
    [_queRen setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _queRen.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    
    
}

-(IBAction)YanZhen:(UIButton *)sender{
    
    
    NSString *phoneStr=_phoneText.text;
    if (![ZQTools isMobileNumber:phoneStr]) {
        [ZQTools svpInfo:@"手机号有误"];
        return;
    }
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:phoneStr,@"mobilephone", nil];
    
    [ZQTools AFNGetDataUrl:@"sms/sendsms" Dict:dict andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _yanZhenMaBtn.enabled=NO;
        _timeTick=60;
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        
    } anderrorBlock:nil];
}
-(void)timeFireMethod
{
    _yanZhenMaBtn.enabled=NO;
    if (_timeTick==0) {
        _yanZhenMaBtn.enabled=YES;
        [_yanZhenMaBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_timer invalidate];
        return;
    }
    _timeTick--;
    [_yanZhenMaBtn setTitle:[NSString stringWithFormat:@"%dS",_timeTick] forState:UIControlStateNormal];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}

@end
