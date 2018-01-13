
//
//  goodsView.m
//  qmzk
//
//  Created by 浪尖渝力 on 2018/1/10.
//  Copyright © 2018年 www.fuyuan.qmzk. All rights reserved.
//

#import "goodsView.h"
#import "listViewController.h"
#import "shenQingViewController.h"

@implementation goodsView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    UIView *centerView=[UIView new];
    [self addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(101);
    }];
    centerView.backgroundColor=[UIColor whiteColor];
    
    UIButton *btn=[UIButton new];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(_mainW-30);
        make.bottom.mas_equalTo(-10);
    }];
    btn.layer.cornerRadius=20;
    btn.backgroundColor=_backgroundColor;
    [btn setTitle:@"申请" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn addTarget:self action:@selector(tiJiao:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSArray *nameArr=[NSArray arrayWithObjects:@"机油",@"机油格", nil];
    
    for (int i=0; i<2; i++) {
        UIView *beiJingView=[UIView new];
        [centerView addSubview:beiJingView];
        [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.top.mas_equalTo(51*i);
        }];
        beiJingView.tag=i;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToDingDan:)];
        [beiJingView addGestureRecognizer:tapGesture];
        if (i!=1) {
            UIView *xianView=[UIView new];
            [centerView addSubview:xianView];
            [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10);
                make.right.mas_equalTo(0);
                make.height.mas_equalTo(1);
                make.top.mas_equalTo(beiJingView.mas_bottom);
            }];
            xianView.backgroundColor=_LightGrey;
        }
        
        UIImageView *imageView=[UIImageView new];
        [beiJingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(25);
        }];
        imageView.image=[UIImage imageNamed:nameArr[i]];
        
        UILabel *label=[UILabel new];
        [beiJingView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        label.text=nameArr[i];
        label.textColor=ColorWithRGB(49, 49, 49);
        label.font=[UIFont systemFontOfSize:16];
        
        UIImageView *jianTou=[UIImageView new];
        [beiJingView addSubview:jianTou];
        [jianTou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(15);
        }];
        jianTou.image=[UIImage imageNamed:@"arrow-right"];
    }
    
}
-(void)pushToDingDan:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag==0) {
        listViewController *list=[[listViewController alloc] init];
        list.numBer=@1;
        [ZQTools pushNextViewController:self.viewController andRootController:list];
    }
    if (tap.view.tag==1) {
        listViewController *list=[[listViewController alloc] init];
        list.numBer=@2;
        [ZQTools pushNextViewController:self.viewController andRootController:list];
    }
    
}
-(IBAction)tiJiao:(id)sende{
    shenQingViewController *shenqing=[[shenQingViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:shenqing];
}
@end
