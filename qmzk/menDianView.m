
//
//  menDianView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "menDianView.h"
#import "HHTimeView.h"
#import "BaiDuMapViewController.h"
@implementation menDianView

-(void)creatView{
    
    self.backgroundColor=_LightGrey;
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(networkDidReceiveMessage:) name:@"dingWei" object:nil];
    
    NSDictionary *userDic=[_dic objectForKey:@"seller"];
    NSDictionary *seller=[_dic objectForKey:@"userBasic"];
    
    UIView *shangJiaVie=[UIView new];
    [self addSubview:shangJiaVie];
    [shangJiaVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    shangJiaVie.backgroundColor=[UIColor whiteColor];

    
    UILabel *shangJiaLabel=[UILabel new];
    [shangJiaVie addSubview:shangJiaLabel];
    [shangJiaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    shangJiaLabel.text=@"商家LOGO";
    shangJiaLabel.textColor=ColorWithRGB(100, 100, 100);
    shangJiaLabel.font=[UIFont systemFontOfSize:17];
    
    UIImageView *jianTouIamgeView=[UIImageView new];
    [shangJiaVie addSubview:jianTouIamgeView];
    [jianTouIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
    
    _LogoImageView=[UIImageView new];
    [shangJiaVie addSubview:_LogoImageView];
    [_LogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(jianTouIamgeView.mas_left).mas_equalTo(-5);
        make.height.width.mas_equalTo(_mainWidth*40);
    }];
    
    NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,[seller  objectForKey:@"headImg"]]];    
    [_LogoImageView sd_setImageWithURL:rul];
    _LogoImageView.layer.cornerRadius=_mainWidth*20;
    _LogoImageView.layer.masksToBounds=YES;
    
    UIView *yingYeView=[UIView new];
    [self addSubview:yingYeView];
    [yingYeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(shangJiaVie.mas_bottom).mas_equalTo(1);
        make.height.mas_equalTo(_mainHeight*45);
        make.left.right.mas_equalTo(0);
    }];
    yingYeView.backgroundColor=[UIColor whiteColor];
    
    UILabel *yingYeLabel=[UILabel new];
    [yingYeView addSubview:yingYeLabel];
    [yingYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    yingYeLabel.text=@"营业状态";
    yingYeLabel.textColor=ColorWithRGB(100, 100, 100);
    yingYeLabel.font=[UIFont systemFontOfSize:17];
    
    UISwitch *switcBnt=[UISwitch new];
    [yingYeView addSubview:switcBnt];
    [switcBnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10*_mainWidth);
    }];
    NSNumber *isOpen=[userDic objectForKey:@"isOpen"];

    switcBnt.on = isOpen.boolValue;//设置初始为ON的一边
    UIView *timeView=[UIView new];
    [self addSubview:timeView];
    [timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(yingYeView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    timeView.backgroundColor=[UIColor whiteColor];
    
    UILabel *timeLabel=[UILabel new];
    [timeView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    timeLabel.text=@"营业时间";
    timeLabel.font=[UIFont systemFontOfSize:16];
    timeLabel.textColor=ColorWithRGB(100, 100, 100);
    
    
    UIImageView *jianTouIamgeView2=[UIImageView new];
    [timeView addSubview:jianTouIamgeView2];
    [jianTouIamgeView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView2.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];

    
    _timeLabel=[UILabel new];
    [timeView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(jianTouIamgeView.mas_left).mas_equalTo(-5);
    }];
    
    _businessBeginHour=[userDic objectForKey:@"businessBeginHour"];
    _businessBeginMinute=[userDic objectForKey:@"businessBeginMinute"];
    _businessEndHour=[userDic objectForKey:@"businessEndHour"];
    _busiinessEndMinute=[userDic objectForKey:@"busiinessEndMinute"];
    if (_businessBeginHour.intValue<10) {
        _businessBeginHour=[NSString stringWithFormat:@"0%@",_businessBeginHour];
    }
    if (_businessBeginMinute.intValue<10) {
        _businessBeginMinute=[NSString stringWithFormat:@"0%@",_businessBeginMinute];
    }
    if (_businessEndHour.intValue<10) {
        _businessEndHour=[NSString stringWithFormat:@"0%@",_businessEndHour];
    }if (_busiinessEndMinute.intValue<10) {
        _busiinessEndMinute=[NSString stringWithFormat:@"0%@",_busiinessEndMinute];
    }
    
    
    NSString *businessBeginHour=[NSString stringWithFormat:@"%@:%@",_businessBeginHour,_businessBeginMinute];

    NSString *businessEndHour=[NSString stringWithFormat:@"%@:%@",_businessEndHour,_busiinessEndMinute];

    
    _timeLabel.text=[NSString stringWithFormat:@"%@-%@",businessBeginHour,businessEndHour];
    _timeLabel.font=[UIFont systemFontOfSize:16];
    _timeLabel.textColor=ColorWithRGB(100, 100, 100);
    _timeLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creaTime:)];
    [_timeLabel addGestureRecognizer:tapGesture1];

    
    UIView *phoneView=[UIView new];
    [self addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(timeView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    phoneView.backgroundColor=[UIColor whiteColor];
    
    UILabel *phoneLabel=[UILabel new];
    [phoneView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    phoneLabel.text=@"电话";
    phoneLabel.font=[UIFont systemFontOfSize:16];
    phoneLabel.textColor=ColorWithRGB(100, 100, 100);
    
    
    UIImageView *jianTouIamgeView3=[UIImageView new];
    [phoneView addSubview:jianTouIamgeView3];
    [jianTouIamgeView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView3.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
    
    
    _phoneLable=[UITextField new];
    [phoneView addSubview:_phoneLable];
    [_phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(jianTouIamgeView.mas_left).mas_equalTo(-5);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    _phoneLable.text=[userDic objectForKey:@"phone"];
    _phoneLable.font=[UIFont systemFontOfSize:16];
    _phoneLable.textColor=ColorWithRGB(100, 100, 100);
    _phoneLable.textAlignment=NSTextAlignmentRight;
    _phoneLable.delegate=self;
    
    UIView *diZhiView=[UIView new];
    [self addSubview:diZhiView];
    [diZhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    diZhiView.backgroundColor=[UIColor whiteColor];
    
    UILabel *diZhiLabel=[UILabel new];
    [diZhiView addSubview:diZhiLabel];
    [diZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    diZhiLabel.text=@"地址";
    diZhiLabel.font=[UIFont systemFontOfSize:16];
    diZhiLabel.textColor=ColorWithRGB(100, 100, 100);
    
    
    UIImageView *jianTouIamgeView4=[UIImageView new];
    [diZhiView addSubview:jianTouIamgeView4];
    [jianTouIamgeView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView4.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
    
    
    _diZhiLabel=[UILabel new];
    [diZhiView addSubview:_diZhiLabel];
    [_diZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(jianTouIamgeView.mas_left).mas_equalTo(-5);
    }];
    _diZhiLabel.text=[userDic objectForKey:@"sellerAddress"];
    _diZhiLabel.font=[UIFont systemFontOfSize:16];
    _diZhiLabel.textColor=ColorWithRGB(100, 100, 100);
    _diZhiLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatPushToDiTu:)];
    [_diZhiLabel addGestureRecognizer:tapGesture];

    
    UIView *zizhiView=[UIView new];
    [self addSubview:zizhiView];
    [zizhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(diZhiView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*200);
    }];
    zizhiView.backgroundColor=[UIColor whiteColor];
    
    UILabel *ziZhiLabel=[UILabel new];
    [zizhiView addSubview:ziZhiLabel];
    [ziZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.top.mas_equalTo(0);
    }];
    ziZhiLabel.text=@"营业资质";
    ziZhiLabel.textColor=ColorWithRGB(100, 100, 100);
    ziZhiLabel.font=[UIFont systemFontOfSize:16];
    
    _iamgeView=[UIImageView new];
    [zizhiView addSubview:_iamgeView];
    [_iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ziZhiLabel.mas_bottom).mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(_mainHeight*140);
    }];
    NSURL *rul2=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,[userDic  objectForKey:@"businessLicenceImg"]]];
    [_iamgeView sd_setImageWithURL:rul2];
}

-(void)creaTime:(UITapGestureRecognizer *)tap{
    _timeView=[HHTimeView new];
    [self addSubview:_timeView];
    [_timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    NSArray *beginTimeArr=[_timeLabel.text componentsSeparatedByString:@"-"];
    _timeView.beginTime=beginTimeArr[0];
    _timeView.endTime=beginTimeArr[1];
    [_timeView creatView];
    [_timeView.quXiao addTarget:self action:@selector(queDin2:) forControlEvents:UIControlEventTouchUpInside];

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}

-(void)networkDidReceiveMessage:(NSNotification *)notification{
    NSDictionary *shujueDic=notification.userInfo;
    _diZhiLabel.text=[shujueDic objectForKey:@"address"];
    _longtitude=[shujueDic objectForKey:@"longtitude"];
    _longtitude=[shujueDic objectForKey:@"longtitude"];
}

-(IBAction)queDin2:(id)sender{
    [_timeView removeFromSuperview];
    _businessBeginHour=_timeView.nianStr1;
    _businessBeginMinute=_timeView.yueStr1;
    _businessEndHour=_timeView.nianStr2;
    _busiinessEndMinute=_timeView. yueStr2;
    if (_timeView.nianStr2.intValue<=_timeView.nianStr1.intValue) {
        _timeLabel.text=[NSString stringWithFormat:@"%@:%@-%@:%@",_timeView.nianStr1,_timeView.yueStr1,_timeView.nianStr2,_timeView.yueStr2];
    }  else {
        _timeLabel.text=[NSString stringWithFormat:@"%@:%@-%@:%@",_timeView.nianStr1,_timeView.yueStr1,_timeView.nianStr2,_timeView.yueStr2];
    }

    
    
}
-(void)creatPushToDiTu:(UITapGestureRecognizer *)tap{
    
    BaiDuMapViewController *bai=[[BaiDuMapViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:bai];


}
@end
