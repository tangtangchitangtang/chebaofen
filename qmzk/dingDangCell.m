//
//  dingDangCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "dingDangCell.h"

@implementation dingDangCell
-(void)creatView{
    
    self.backgroundColor=_LightGrey;
    
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(5);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    UIView *topView=[UIView new];
    [beiJingView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    UIImageView *biaoQian=[UIImageView new];
    [topView addSubview:biaoQian];
    [biaoQian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(20);
    }];
    biaoQian.image=[UIImage imageNamed:@"标签"];
    
    UILabel *baoYangLabel=[UILabel new];
    [topView addSubview:baoYangLabel];
    [baoYangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(biaoQian.mas_right).mas_equalTo(6);
        make.centerY.mas_equalTo(0);
    }];
    baoYangLabel.text=@"保养";
    baoYangLabel.textColor=ColorWithRGB(149, 149, 149);
    baoYangLabel.font=[UIFont systemFontOfSize:17];
    
    UILabel *zhangTaiLabel=[UILabel new];
    [topView addSubview:zhangTaiLabel];
    [zhangTaiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
    }];
    zhangTaiLabel.textColor=ColorWithRGB(200, 200, 200);
    zhangTaiLabel.font=[UIFont systemFontOfSize:17];
    
    
    NSNumber *orderState=[_tableDic objectForKey:@"morderStatus"];
    
    if (orderState.intValue==1) {
        zhangTaiLabel.text=@"待付款";
    }
    if (orderState.intValue==2) {
        zhangTaiLabel.text=@"已完成";
    }
    
    UIView *xianView=[UIView new];
    [beiJingView addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    xianView.backgroundColor=_LightGrey;
    
    
    UIImageView *tuImgView=[UIImageView new];
    [beiJingView addSubview:tuImgView];
    [tuImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xianView.mas_bottom).mas_equalTo(7);
        make.height.width.mas_equalTo(80);
        make.left.mas_equalTo(15);
    }];
    NSArray *imgs=[_tableDic objectForKey:@"photo"];
    NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,imgs]];
    [tuImgView sd_setImageWithURL:rul];

    UILabel *dingDanNumLabel=[UILabel new];
    [beiJingView addSubview:dingDanNumLabel];
    [dingDanNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tuImgView);
        make.left.mas_equalTo(tuImgView.mas_right).mas_equalTo(15);
        make.right.mas_equalTo(-100);
    }];
    NSString *goodsName=[_tableDic objectForKey:@"goodsName"];
    if ([ZQTools charIsNil:goodsName]) {
        goodsName=@"";
    }

    dingDanNumLabel.text=goodsName;
    dingDanNumLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
    dingDanNumLabel.textColor=ColorWithRGB(10, 10, 10);
    
    NSNumber *number=[_tableDic objectForKey:@"grade"];
    
    UILabel *numLabel=[UILabel new];
    [beiJingView  addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(dingDanNumLabel);
    }];
    numLabel.text=[NSString stringWithFormat:@"x%@",number];
    numLabel.font=[UIFont systemFontOfSize:15];
    numLabel.textColor=ColorWithRGB(49, 49, 49);
    
    NSString *createTime=[_tableDic objectForKey:@"appointmentTime"];
    UILabel *timeLabel=[UILabel new];
    [beiJingView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(dingDanNumLabel);
        make.top.mas_equalTo(dingDanNumLabel.mas_bottom).mas_equalTo(10);
        
    }];
    timeLabel.text=[NSString stringWithFormat:@"%@ 下单",createTime];
    timeLabel.textColor=ColorWithRGB(149, 149, 149);
    timeLabel.font=[UIFont systemFontOfSize:15];
    
    NSNumber *totalPrice=[_tableDic objectForKey:@"truePrice"];
    NSString *priceStr=[NSString stringWithFormat:@"%@",totalPrice];
    UILabel *fuKuanLabel=[UILabel new];
    [beiJingView addSubview:fuKuanLabel];
    [fuKuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(timeLabel);
        make.right.mas_equalTo(-100);
        make.bottom.mas_equalTo(tuImgView.mas_bottom).mas_equalTo(-5);
    }];
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"实付:¥%@",priceStr]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(49, 49, 49) range:NSMakeRange(0, 3)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:_backgroundColor range:NSMakeRange(3, priceStr.length+1)];
    fuKuanLabel.attributedText=AttributedStr;
    fuKuanLabel.font=[UIFont systemFontOfSize:15];
    
    
    UIButton *btn=[UIButton new];
    [beiJingView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(fuKuanLabel);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    }];
    btn.layer.cornerRadius=2;
    btn.layer.borderWidth=1;
    btn.layer.borderColor=_backgroundColor.CGColor;
    
    [btn setTitle:@"回复" forState:0];
    [btn setTitleColor:_backgroundColor forState:0];
}



@end
