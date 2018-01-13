
//
//  tiXianView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "tiXianView.h"
#import "yinHangfViewController.h"
@implementation tiXianView
-(void)creatView{
    self.backgroundColor=_LightGrey;

    NSLog(@"%@",_dic);
    UIView *yinHangView=[UIView new];
    [self addSubview:yinHangView];
    [yinHangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(67);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*55);
    }];
    yinHangView.backgroundColor=[UIColor whiteColor];
//    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToYinHang:)];
//    [yinHangView addGestureRecognizer:tapGesture2];

    UILabel *nameLabel=[UILabel new];
    [yinHangView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-10*_mainHeight);
        make.left.mas_equalTo(10);
    }];
    NSString *cardNumber=[_dic objectForKey:@"cardNumber"];
    
    NSArray *arr=[[ZQTools getBankName:cardNumber] componentsSeparatedByString:@"·"];
    
    nameLabel.text=arr[0];

    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font= [UIFont systemFontOfSize:15];
    
    UILabel *weiHaoLabel=[UILabel new];
    [yinHangView addSubview:weiHaoLabel];
    [weiHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(10*_mainHeight);
        make.left.mas_equalTo(10);
    }];
    weiHaoLabel.text=[NSString stringWithFormat:@"尾号%@ 储蓄卡",[cardNumber substringFromIndex:cardNumber.length-4]
                      ];
    weiHaoLabel.textColor=ColorWithRGB(150, 150, 150);
    weiHaoLabel.font= [UIFont systemFontOfSize:15];
    
    UIImageView *jianTouIamgeView=[UIImageView new];
    [yinHangView addSubview:jianTouIamgeView];
    [jianTouIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-_mainWidth*10);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];

    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(yinHangView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.height.mas_equalTo(140*_mainHeight);
        make.left.right.mas_equalTo(0);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    UILabel *tiXianLable=[UILabel new];
    [beiJingView addSubview:tiXianLable];
    [tiXianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*_mainHeight);
        make.left.mas_equalTo(10);
    }];
    tiXianLable.text=@"提现金额";
    tiXianLable.textColor=ColorWithRGB(100, 100, 100);
    tiXianLable.font= [UIFont systemFontOfSize:15];
    
    UIImageView *imagView=[UIImageView new];
    [beiJingView addSubview:imagView];
    [imagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(_mainWidth*40);
        make.height.mas_equalTo(_mainHeight*50);
    }];
    imagView.image=[UIImage imageNamed:@"我的-钱"];
    
    _numText=[UITextField new];
    [beiJingView addSubview:_numText];
    [_numText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(imagView);
        make.left.mas_equalTo(imagView.mas_right).mas_equalTo(_mainWidth*10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    _numText.textColor=ColorWithRGB(20, 20, 20);
    _numText.font=[UIFont fontWithName:@"Helvetica-Bold" size:35];
    _numText.delegate=self;
    _numText.keyboardType=UIKeyboardTypeDecimalPad;
    
    UILabel *xianLable=[UILabel new];
    [beiJingView addSubview:xianLable];
    [xianLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(_mainWidth*-35);
        make.height.mas_equalTo(1);
    }];
    xianLable.backgroundColor=_LightGrey;
    
    UIView *bottomView=[UIView new];
    [beiJingView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xianLable.mas_bottom);
        make.bottom.left.right.mas_equalTo(0);
    }];
    
    _keYongLabel=[UILabel new];
    [bottomView addSubview:_keYongLabel];
    [_keYongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    _keYongLabel.textColor=ColorWithRGB(100, 100, 100);
    _keYongLabel.font= [UIFont systemFontOfSize:15];
    
    UIButton *quRenBtn=[UIButton new];
    [self addSubview:quRenBtn];
    [quRenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomView.mas_bottom).mas_equalTo(_mainHeight*40);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    quRenBtn.backgroundColor=_backgroundColor;
    quRenBtn.layer.cornerRadius=_mainHeight*20;
    [quRenBtn setTitle:@"提现" forState:UIControlStateNormal];
    [quRenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quRenBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [quRenBtn addTarget:self action:@selector(creatTiXian:) forControlEvents:UIControlEventTouchUpInside];

    
}


-(IBAction)creatTiXian:(UIButton *)btn{
     double type=_numText.text.doubleValue;
    if (type==0) {
        [ZQTools svpInfo:@"体现金额不能为0"];
        return;
    }
    NSNumber *amount=[NSNumber numberWithFloat:type];
    
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idUserBasic,@"userId",amount,@"amount", nil];
    [ZQTools AFNGetDataUrl:@"finance/saveCashApply" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        [ZQTools svpInfo:@"提交成功"];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    } anderrorBlock:nil];
    

}

-(void)pushToYinHang:(UITapGestureRecognizer *)tpa{

    yinHangfViewController *yinHang=[[yinHangfViewController alloc] init];
    yinHang.abc=1;
    [ZQTools pushNextViewController:self.viewController andRootController:yinHang];

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}


-(void)creatView2{
    self.backgroundColor=_LightGrey;
    UIView *textView=[UIView new];
    [self addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(70);
        make.height.mas_equalTo(50);
    }];
    textView.backgroundColor=[UIColor whiteColor];
    
    _numText=[UITextField new];
    [textView addSubview:_numText];
    [_numText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    _numText.textColor=ColorWithRGB(49, 49, 49);
    _numText.font=[UIFont systemFontOfSize:16];
    _numText.delegate=self;
    _numText.keyboardType=UIKeyboardTypeDecimalPad;
    _numText.placeholder=@"请输入提现金额";
    
    UIView *btnView=[UIView new];
    [self addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(55);
    }];
    btnView.backgroundColor=[UIColor whiteColor];
    
    UIButton *btn=[UIButton new];
    [btnView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(_mainW-30);
    }];
    btn.layer.cornerRadius=35/2;
    btn.backgroundColor=_backgroundColor;
    [btn setTitle:@"提交" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn addTarget:self action:@selector(tiXian:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)tiXian:(id)sender{
    double type=_numText.text.doubleValue;
    if (type==0) {
        [ZQTools svpInfo:@"体现金额不能为0"];
        return;
    }
    NSNumber *amount=[NSNumber numberWithFloat:type];
    
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *sellerId=[dic2 objectForKey:@"sellerId"];
    NSString *acct=[dic2 objectForKey:@"sellerAcct"];
    NSString *acctName=[dic2 objectForKey:@"acctName"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:sellerId,@"sellerId",amount,@"money",acct,@"acct",acctName,@"acctName", nil];
    [ZQTools AFNPOSTDataUrl:@"seller/sellerWithdraw" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
        [ZQTools svpInfo:@"发起提现成功"];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    } anderrorBlock:nil];
}

@end
