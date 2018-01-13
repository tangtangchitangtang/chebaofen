
//
//  shangPingCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shangPingCell.h"

@implementation shangPingCell

-(void)creatView{
    UIImageView *iamgeView=[UIImageView new];
    [self addSubview:iamgeView];
    [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(60);
        make.left.mas_equalTo(10);
    }];
   
    NSArray *imgs=[_typeDic objectForKey:@"imgs"];
    
    if (imgs.count!=0) {
        NSString *uploadfilepath=[imgs[0] objectForKey:@"uploadfilepath"];
        NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,uploadfilepath]];
        [iamgeView sd_setImageWithURL:rul];
    }


    

    
    UILabel *titleLabel=[UILabel new];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iamgeView.mas_top);
        make.left.mas_equalTo(iamgeView.mas_right).mas_equalTo(10);
        make.right.mas_equalTo(-60);
    }];
    titleLabel.text=[_typeDic objectForKey:@"title"];
    titleLabel.textColor=ColorWithRGB(50, 50, 50);
    titleLabel.font= [UIFont fontWithName:@"Helvetica-Bold" size:17];

    
    UILabel *zhuangTaiLabel=[UILabel new];
    [self addSubview:zhuangTaiLabel];
    [zhuangTaiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(titleLabel);
        make.right.mas_equalTo(-10);
    }];
    int state=[[_typeDic objectForKey:@"state"] intValue];
    if (state==0) {
        zhuangTaiLabel.text=@"出售中";
    } if (state==1) {
        zhuangTaiLabel.text=@"已下架";
    }
   
    zhuangTaiLabel.textColor=_backgroundColor;
    zhuangTaiLabel.font= [UIFont fontWithName:@"Helvetica" size:14];

    UILabel *priceLabel=[UILabel new];
    [self addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(iamgeView);
        make.left.mas_equalTo(titleLabel);
        make.right.mas_equalTo(-10);
    }];
    float price=[[_typeDic objectForKey:@"discountedPrice"] doubleValue];
    NSString *price1=[NSString stringWithFormat:@"%.2f",price];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"价格:¥%@",price1]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(150, 150, 150) range:NSMakeRange(0, 3)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(255, 37, 78) range:NSMakeRange(3, price1.length+1)];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 3+price1.length+1)];
    priceLabel.attributedText=AttributedStr;
    
    UILabel *kuCunLabel=[UILabel new];
    [self addSubview:kuCunLabel];
    [kuCunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(priceLabel);
        make.right.mas_equalTo(-10);
    }];
    NSNumber *stockNum=[_typeDic objectForKey:@"stockNum"];
    if ([stockNum isKindOfClass:[NSNull class]]) {
        stockNum=@0;
    }
    kuCunLabel.text=[NSString stringWithFormat:@"库存：%@",stockNum];
    kuCunLabel.textColor=_backgroundColor;
    kuCunLabel.font= [UIFont fontWithName:@"Helvetica" size:14];
    

}
@end
