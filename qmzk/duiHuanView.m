
//
//  duiHuanView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "duiHuanView.h"

@implementation duiHuanView
-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (_abc==2) {
              make.top.mas_equalTo(70);
        }
        else{
            
            make.top.mas_equalTo(6);
             
        }
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    _duiHuanTextView=[UITextField new];
    [beiJingView addSubview:_duiHuanTextView];
    [_duiHuanTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    _duiHuanTextView.placeholder=@"请输入兑换码";
    _duiHuanTextView.textColor=ColorWithRGB(50, 50, 50);
    _duiHuanTextView.font=[UIFont fontWithName:@"Helvetica" size:15];
    _duiHuanTextView.delegate=self;
  
    UIView *btnView=[UIView new];
    [self addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*50);
    }];
    btnView.backgroundColor=[UIColor whiteColor];
    
    UIButton *btn=[UIButton new];
    [btnView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(_mainW*0.95);
        make.height.mas_equalTo(_mainHeight*35);
    }];
     btn.layer.cornerRadius=_mainHeight*17.5;
    btn.backgroundColor=_backgroundColor;
    [btn setTitle:@"提交" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [btn addTarget:self action:@selector(duiHuan) forControlEvents:UIControlEventTouchUpInside];

}

-(void)duiHuan{
    NSString *scannedResult=_duiHuanTextView.text;
    if ([scannedResult isEqualToString:@""]) {
        [ZQTools svpInfo:@"兑换码不能为空"];
        return;
    }
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSNumber *sellerId=[userBasic objectForKey:@"idUserBasic"];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:sellerId,@"sellerId",scannedResult,@"redeemCode", nil];
    [ZQTools AFNGetDataUrl:@"seller/sellerExchange" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
        [ZQTools svpInfo:@"兑换成功"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.viewController.navigationController popViewControllerAnimated:YES];
            
        });
        
    } anderrorBlock:nil];
    
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}

@end
