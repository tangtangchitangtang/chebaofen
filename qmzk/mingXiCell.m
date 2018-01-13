//
//  mingXiCell.m
//  
//
//  Created by tangtangchitangtang on 2017/6/28.
//
//

#import "mingXiCell.h"

@implementation mingXiCell

-(void)creatView{
    NSLog(@"%@",_dic);
    
    UILabel *leiXingLabel=[UILabel new];
    [self addSubview:leiXingLabel];
    [leiXingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    int businessType=[[_dic objectForKey:@"availMoney"] intValue];
    if (businessType==1) {
        leiXingLabel.text=@"客服消费成功";
    }
    if (businessType==2) {
        leiXingLabel.text=@"提现到银行卡";
    }   if (businessType==3) {
        leiXingLabel.text=@"客户退款";
    }
    leiXingLabel.textColor=ColorWithRGB(20, 20, 20);
    leiXingLabel.font= [UIFont fontWithName:@"Helvetica-Bold" size:16];
    
    UILabel *jinELabel=[UILabel new];
    [self addSubview:jinELabel];
    [jinELabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-35);
    }];
    double rechargeValue=[[_dic objectForKey:@"money"] doubleValue];
    if (businessType==1) {
         jinELabel.text=[NSString stringWithFormat:@"+%@",[ZQTools positiveFormat:[NSString stringWithFormat:@"%.2f",rechargeValue]]];    }
    if (businessType==2) {
        jinELabel.text=[NSString stringWithFormat:@"-%@",[ZQTools positiveFormat:[NSString stringWithFormat:@"%.2f",rechargeValue]]];
    }   if (businessType==3) {
        jinELabel.text=[NSString stringWithFormat:@"-%@",[ZQTools positiveFormat:[NSString stringWithFormat:@"%.2f",rechargeValue]]];
    }

    jinELabel.textColor=_backgroundColor;
    jinELabel.font= [UIFont systemFontOfSize:13];

    UILabel *timeLabel=[UILabel new];
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(leiXingLabel.mas_bottom).mas_equalTo(4);
        make.left.mas_equalTo(15);
    }];
    long createtime=[[_dic objectForKey:@"createTime"] longValue];
    timeLabel.text=[ZQTools changeTimeCuo:@"yyyy/MM/dd HH:ss" :[NSString stringWithFormat:@"%ld",createtime]];
    timeLabel.textColor=ColorWithRGB(150, 150, 150);
    timeLabel.font= [UIFont systemFontOfSize:13];
    
    
    
    if (businessType==1) {
        UIImageView *jianTouImgaView=[UIImageView new];
        [self addSubview:jianTouImgaView];
        [jianTouImgaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-2);
            make.width.mas_equalTo(23);
            make.height.mas_equalTo(30);
        }];
        jianTouImgaView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];

    }
    if (businessType==2) {
        leiXingLabel.text=@"提现到银行卡";
    }   if (businessType==3) {
        UIImageView *jianTouImgaView=[UIImageView new];
        [self addSubview:jianTouImgaView];
        [jianTouImgaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-2);
            make.width.mas_equalTo(23);
            make.height.mas_equalTo(30);
        }];
        jianTouImgaView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];

    }

    
  
}

@end
