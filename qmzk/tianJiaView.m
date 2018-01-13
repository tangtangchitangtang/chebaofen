//
//  tianJiaView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "tianJiaView.h"

@implementation tianJiaView

-(void)creatView{
    
    self.backgroundColor=_LightGrey;
    
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100*_mainHeight+1);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    UIView *nameView=[UIView new];
    [topView addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50*_mainHeight);
    }];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(13);
    }];
    nameLabel.text=@"持卡人";
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font= [UIFont systemFontOfSize:15];

    
    _nameText=[UITextField new];
    [nameView addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(90);
        make.right.mas_equalTo(-10);
    }];
    _nameText.placeholder=@"请输入持卡人姓名";
    _nameText.textColor=ColorWithRGB(100, 100, 100);
    _nameText.font= [UIFont systemFontOfSize:13];
    _nameText.delegate=self;
    
    UILabel *xianLable=[UILabel new];
    [topView addSubview:xianLable];
    [xianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xianLable.backgroundColor=_LightGrey;

    UIView *numView=[UIView new];
    [topView addSubview:numView];
    [numView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50*_mainHeight);
    }];
    
    UILabel *numLabel=[UILabel new];
    [numView addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(13);
    }];
    numLabel.text=@"卡号";
    numLabel.textColor=ColorWithRGB(50, 50, 50);
    numLabel.font= [UIFont systemFontOfSize:15];
    
    
    _numText=[UITextField new];
    [numView addSubview:_numText];
    [_numText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(90);
        make.right.mas_equalTo(-10);
    }];
    _numText.placeholder=@"请输入银行卡号";
    _numText.textColor=ColorWithRGB(100, 100, 100);
    _numText.font= [UIFont systemFontOfSize:13];
    _numText.delegate=self;
    
    UIButton *quRenBtn=[UIButton new];
    [self addSubview:quRenBtn];
    [quRenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*40);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    quRenBtn.backgroundColor=_backgroundColor;
    quRenBtn.layer.cornerRadius=_mainHeight*20;
    [quRenBtn setTitle:@"确定" forState:UIControlStateNormal];
    [quRenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quRenBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [quRenBtn addTarget:self action:@selector(yangZhenShengFen:) forControlEvents:UIControlEventTouchUpInside];
    

}

-(IBAction)yangZhenShengFen:(id)sender{
    NSString *name=_nameText.text;
    NSString *num=_numText.text;
    if ([name isEqualToString:@""]) {
        [ZQTools svpInfo:@"持卡人不能为空"];
        return;
    }
    if ([num isEqualToString:@""]) {
        [ZQTools svpInfo:@"银行卡号不能为空"];
        return;
    }
        NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
        NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
        NSString *reviewsUserId=[userBasic objectForKey:@"idUserBasic"];

    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:reviewsUserId,@"userId",num,@"cardNumber", nil];
    [ZQTools AFNGetDataUrl:@"userBasic/bindingBank" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        [ZQTools svpInfo:@"绑定成功"];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    } anderrorBlock:nil];



}

-(void)creatView2{
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100*_mainHeight+1);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    UIView *nameView=[UIView new];
    [topView addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50*_mainHeight);
    }];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(13);
    }];
    nameLabel.text=@"电话";
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font= [UIFont systemFontOfSize:15];
    
    
    _phoneText=[UITextField new];
    [nameView addSubview:_phoneText];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(90);
        make.right.mas_equalTo(-10);
    }];
    _phoneText.placeholder=@"请输入银行预留电话";
    _phoneText.textColor=ColorWithRGB(100, 100, 100);
    _phoneText.font= [UIFont systemFontOfSize:13];
    _phoneText.delegate=self;
    
    UILabel *xianLable=[UILabel new];
    [topView addSubview:xianLable];
    [xianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xianLable.backgroundColor=_LightGrey;
    
    UIView *numView=[UIView new];
    [topView addSubview:numView];
    [numView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50*_mainHeight);
    }];
    
    UILabel *numLabel=[UILabel new];
    [numView addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(13);
    }];
    numLabel.text=@"验证码";
    numLabel.textColor=ColorWithRGB(50, 50, 50);
    numLabel.font= [UIFont systemFontOfSize:15];
    
    
    _yanZhengText=[UITextField new];
    [numView addSubview:_yanZhengText];
    [_yanZhengText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(90);
        make.right.mas_equalTo(-10);
    }];
    _yanZhengText.placeholder=@"请输入验证码";
    _yanZhengText.textColor=ColorWithRGB(100, 100, 100);
    _yanZhengText.font= [UIFont systemFontOfSize:13];
    _yanZhengText.delegate=self;
    
    _yanZhenMaBtn =[UIButton new];
    [numView addSubview:_yanZhenMaBtn];
    [_yanZhenMaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(80*_mainWidth);
        make.height.mas_equalTo(30*_mainHeight);
    }];
    _yanZhenMaBtn.layer.borderColor=_backgroundColor.CGColor;
    _yanZhenMaBtn.layer.borderWidth=1;
    _yanZhenMaBtn.layer.cornerRadius=4;
    [_yanZhenMaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_yanZhenMaBtn setTitleColor:_backgroundColor forState:UIControlStateNormal];
    _yanZhenMaBtn.titleLabel.font=[UIFont systemFontOfSize:11];
    [_yanZhenMaBtn addTarget:self action:@selector(YanZhen:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *quRenBtn=[UIButton new];
    [self addSubview:quRenBtn];
    [quRenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*40);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    quRenBtn.backgroundColor=_backgroundColor;
    quRenBtn.layer.cornerRadius=_mainHeight*20;
    [quRenBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [quRenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quRenBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];


}


-(IBAction)YanZhen:(UIButton *)sender{
    
    
//    NSString *phoneStr;
//    
//    if ([_titileStr isEqualToString:@"2"]) {
//        phoneStr=_phoneText.text;
//    }
//    else{
//        NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
//        phoneStr=[NSString stringWithFormat:@"%@",[[dic objectForKey:@"user"] objectForKey:@"mobilephone"]];
//        
//    }
//    if (![Help isMobileNumber:phoneStr]) {
//        NSLog(@"号码有误");
//        return;
//    }
//    
//    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:phoneStr,@"mobilephone", nil];
//    
//    [Help AFNGetDataUrl:@"sms/sendsms" andDic:dict andArr:nil andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _yanZhenMaBtn.enabled=NO;
        _timeTick=60;
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
//    } anderrorBlock:nil];
    
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
