
//
//  zhaoPingCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "zhaoPingCell.h"

@implementation zhaoPingCell
-(void)creatView{
    NSLog(@"%@",_typeDic);
    self.backgroundColor=_LightGrey;
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];

    UILabel *nameLabel=[UILabel new];
    [beiJingView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(25);
    }];
    nameLabel.text=[_typeDic objectForKey:@"positionName"];
    nameLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *timeLabel=[UILabel new];
    [beiJingView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    NSString *createTime=[NSString stringWithFormat:@"%lld",[[_typeDic objectForKey:@"createTime"] longLongValue]];
    timeLabel.text=[ZQTools changeTimeCuo:@"yyyy/MM/dd" :createTime];
    timeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    timeLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UIImageView *addressImage=[UIImageView new];
    [beiJingView addSubview:addressImage];
    [addressImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom).mas_equalTo(5);
        make.left.mas_equalTo(nameLabel);
        make.height.with.mas_equalTo(15);
    }];
    addressImage.backgroundColor=[UIColor orangeColor];
    
    UILabel *addressLabel=[UILabel new];
    [beiJingView addSubview:addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(addressImage);
        make.left.mas_equalTo(addressImage.mas_right).mas_equalTo(2);
    }];
    NSLog(@"%@",_typeDic);
    NSString *sellerAddr=[_typeDic objectForKey:@"sellerAddr"];
    if ([ZQTools charIsNil:sellerAddr]) {
        sellerAddr=@"";
    }
    addressLabel.text=sellerAddr;
    addressLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    addressLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UIImageView *zhuanYeImage=[UIImageView new];
    [beiJingView addSubview:zhuanYeImage];
    [zhuanYeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-30);
        make.height.width.centerY.mas_equalTo(addressImage);
    }];
    zhuanYeImage.backgroundColor=[UIColor orangeColor];
    
    UILabel *zhuanYeLabel=[UILabel new];
    [beiJingView addSubview:zhuanYeLabel];
    [zhuanYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(addressImage);
        make.left.mas_equalTo(zhuanYeImage.mas_right).mas_equalTo(2);
    }];
    
    NSString *zhuanYe=[NSString stringWithFormat:@"%@／工作%d年",[_typeDic objectForKey:@"education"],[[_typeDic objectForKey:@"workExperience"] intValue]];
    zhuanYeLabel.text=zhuanYe;
    zhuanYeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    zhuanYeLabel.textColor=ColorWithRGB(150, 150, 150);

    UILabel *xinChouLabel=[UILabel new];
    [beiJingView addSubview:xinChouLabel];
    [xinChouLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(zhuanYeImage);
        make.right.mas_equalTo(timeLabel);
    }];
    NSString *xinZhi=[NSString stringWithFormat:@"%d-%d",[[_typeDic objectForKey:@"minSalary"] intValue],[[_typeDic objectForKey:@"maxSalary"] intValue]];
    xinChouLabel.text=xinZhi;
    xinChouLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    xinChouLabel.textColor=ColorWithRGB(255, 37, 78);

    

}
@end
