
//
//  xiTongCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/18.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "xiTongCell.h"

@implementation xiTongCell

-(float )creawtView{
    self.backgroundColor=_LightGrey;
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    UIImageView *touXiangImageView=[UIImageView new];
    [beiJingView addSubview:touXiangImageView];
    [touXiangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.width.mas_equalTo(50);
        make.top.mas_equalTo(10);
    }];
    touXiangImageView.layer.cornerRadius=25;
    touXiangImageView.backgroundColor=[UIColor orangeColor];
    
    UILabel *nameLabel=[UILabel new];
    [beiJingView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiangImageView);
        make.left.mas_equalTo(touXiangImageView.mas_right).mas_equalTo(10);
    }];
    nameLabel.text=@"系统消息";
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font=[UIFont systemFontOfSize:16];
    
    
    UILabel *timelabel=[UILabel new];
    [beiJingView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    
    NSString *creTimeStr = [_tableDic objectForKey:@"createTime"];
    
    if(creTimeStr!=nil&&![creTimeStr isKindOfClass:[NSNull class]])
    {
        NSString *createTime=[NSString stringWithFormat:@"%lld",[[_tableDic objectForKey:@"createTime"] longLongValue]];
        timelabel.text=[ZQTools changeTimeCuo:@"yyyy/MM/dd HH:mm" :createTime];
    }
    
    timelabel.textColor=ColorWithRGB(100, 100, 100);
    timelabel.font=[UIFont systemFontOfSize:14];
    
    UILabel *neiRongLabel=[UILabel new];
    [beiJingView addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    [neiRongLabel sizeToFit];
    neiRongLabel.numberOfLines=13;
    neiRongLabel.text=[_tableDic objectForKey:@"msgContent"];
    neiRongLabel.textColor=_ziTiColor;
    neiRongLabel.font=[UIFont systemFontOfSize:15];
    
    
    [neiRongLabel layoutIfNeeded];
    
    return neiRongLabel.frame.size.height+65;

}

@end
