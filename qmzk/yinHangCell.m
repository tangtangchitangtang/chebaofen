

//
//  yinHangCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "yinHangCell.h"

@implementation yinHangCell

-(void)creatView{
    UIImageView *imgaview=[UIImageView new];
    [self addSubview:imgaview];
    [imgaview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(45);
    }];
    
    
    UILabel *nameLable=[UILabel new];
    [self addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-10);
        make.left.mas_equalTo(imgaview.mas_right).mas_equalTo(5);
    }];
    
    
    NSString *cardNumber=[_dic objectForKey:@"cardNumber"];
    
    NSArray *arr=[[ZQTools getBankName:cardNumber] componentsSeparatedByString:@"·"];

    nameLable.text=arr[0];
    nameLable.textColor=ColorWithRGB(50, 50, 50);
    nameLable.font= [UIFont systemFontOfSize:14];
    imgaview.image=[UIImage imageNamed:arr[0]];
    
    UILabel *weihaoLabel=[UILabel new];
    [self addSubview:weihaoLabel];
    [weihaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(10);
        make.left.mas_equalTo(nameLable);
    }];
    weihaoLabel.text=[NSString stringWithFormat:@"尾号%@ 储蓄卡",[cardNumber substringFromIndex:cardNumber.length-4]
];
    weihaoLabel.textColor=ColorWithRGB(150, 150, 150);
    weihaoLabel.font= [UIFont systemFontOfSize:14];

}
@end
