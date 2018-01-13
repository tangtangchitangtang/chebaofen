//
//  fanKuiView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/22.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "fanKuiView.h"

@implementation fanKuiView
-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*175);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    _yiJianText=[UITextView new];
    [beiJingView addSubview:_yiJianText];
    [_yiJianText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(_mainWidth*10);
        make.right.mas_equalTo(_mainWidth*10);
        make.bottom.mas_equalTo(-_mainHeight*5);
    }];
    _yiJianText.text=@"你的意见对我们非常宝贵～";
    _yiJianText.font=[UIFont fontWithName:@"Helvetica" size:16];
    _yiJianText.textColor=ColorWithRGB(150, 150, 150);
    _yiJianText.delegate=self;
    
     
    
    UIButton *quRenBtn=[UIButton new];
    [self addSubview:quRenBtn];
    [quRenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(beiJingView.mas_bottom).mas_equalTo(_mainHeight*15);
        make.left.mas_equalTo(_mainWidth*15);
        make.right.mas_equalTo(-_mainWidth*15);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    quRenBtn.backgroundColor=_backgroundColor;
    quRenBtn.layer.cornerRadius=_mainHeight*5;
    [quRenBtn setTitle:@"确认" forState:UIControlStateNormal];
    [quRenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quRenBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [quRenBtn addTarget:self action:@selector(creatFanKui) forControlEvents:UIControlEventTouchUpInside];

}

-(void)creatFanKui{
    NSString *content=_yiJianText.text;
    if ([content isEqualToString:@"你的意见对我们非常宝贵～"]) {
        [ZQTools svpInfo:@"意见反馈不能为空"];
        return;
    }
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSNumber *tipoffUserId=[userBasic objectForKey:@"idUserBasic"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:tipoffUserId,@"tipoffUserId",content,@"content",@2,@"tipoffType", nil];
    [ZQTools AFNGetDataUrl:@"feedback/saveFeedback" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        [ZQTools svpInfo:@"提交成功"];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    } anderrorBlock: nil];


}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"你的意见对我们非常宝贵～"]) {
        textView.text=@"";
    }
    textView.textColor=ColorWithRGB(50, 50, 50);
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text=@"你的意见对我们非常宝贵～";
    }
    textView.textColor=ColorWithRGB(150, 150, 150);

}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    if ((textView.text.length - range.length + text.length) > 200)
    {
        NSString *substring = [text substringToIndex:200 - (textView.text.length - range.length)];
        NSMutableString *lastString = [textView.text mutableCopy];
        [lastString replaceCharactersInRange:range withString:substring];
        textView.text = [lastString copy];
        return NO;
    }
    else
    {
        return YES;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}

@end
