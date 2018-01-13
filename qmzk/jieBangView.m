//
//  jieBangView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/20.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "jieBangView.h"

@implementation jieBangView
-(void)creatView{

    self.backgroundColor=_LightGrey;
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55*_mainHeight);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imgaview=[UIImageView new];
    [beiJingView addSubview:imgaview];
    [imgaview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(45*_mainHeight);
    }];
    
    UILabel *nameLable=[UILabel new];
    [beiJingView addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-10);
        make.left.mas_equalTo(imgaview.mas_right).mas_equalTo(5);
    }];
    
    
    NSString *cardNumber=[_dci objectForKey:@"cardNumber"];
    
    NSArray *arr=[[ZQTools getBankName:cardNumber] componentsSeparatedByString:@"·"];
    
    nameLable.text=arr[0];
    nameLable.textColor=ColorWithRGB(50, 50, 50);
    nameLable.font= [UIFont systemFontOfSize:14];
    imgaview.image=[UIImage imageNamed:arr[0]];

    UILabel *weihaoLabel=[UILabel new];
    [beiJingView addSubview:weihaoLabel];
    [weihaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(10);
        make.left.mas_equalTo(nameLable);
    }];
    weihaoLabel.text=[NSString stringWithFormat:@"尾号%@ 储蓄卡",[cardNumber substringFromIndex:cardNumber.length-4]
                      ];
    weihaoLabel.textColor=ColorWithRGB(150, 150, 150);
    
    weihaoLabel.font= [UIFont systemFontOfSize:14];
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
    [btn setTitle:@"解除绑定" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [btn addTarget:self action:@selector(jieCuoBangDing:) forControlEvents:UIControlEventTouchUpInside];

}
-(IBAction)jieCuoBangDing:(id)sender{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"是否要解除银行卡的绑定" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self jieBang];
    }]];
    [self.viewController presentViewController:alertController animated:YES completion:nil];

}
-(void)jieBang{
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idUserBasic,@"userId",[_dci objectForKey:@"cardNumber"],@"cardNumber", nil];
    [ZQTools AFNGetDataUrl:@"userBasic/deleteBindingBank" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        [ZQTools svpInfo:@"解除成功"];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    } anderrorBlock:nil];
}

@end



