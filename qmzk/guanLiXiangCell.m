
//
//  guanLiXiangCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "guanLiXiangCell.h"

@implementation guanLiXiangCell

-(CGFloat)cretView{
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
    nameLabel.text=@"糖糖吃糖糖";
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font=[UIFont systemFontOfSize:16];
    
    UIView *xingXingView=[UIView new];
    [beiJingView addSubview:xingXingView];
    [xingXingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(touXiangImageView);
        make.left.mas_equalTo(nameLabel);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(250);
    }];
    for (int i=0; i<3; i++) {
        UIImageView *imageView=[UIImageView new];
        [xingXingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(i*25);
            make.width.height.mas_equalTo(20);
        }];
        imageView.image=[UIImage imageNamed:@"全星"];
    }
    for (int i=3; i<5; i++) {
        UIImageView *imageView=[UIImageView new];
        [xingXingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(i*25);
            make.width.height.mas_equalTo(20);
        }];
        imageView.image=[UIImage imageNamed:@"无星"];
    }
    
    UILabel *neiRongLabel=[UILabel new];
    [beiJingView addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiangImageView.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    [neiRongLabel sizeToFit];
    neiRongLabel.numberOfLines=13;
    neiRongLabel.text=@"爱情公寓》系列曾经给我们带来很多美好的回忆，霸气的胡一菲，贱贱的曾小贤，傻傻的陈美嘉，花花的吕子乔，还有关谷悠悠......每个人都各具特色，还有无数经典台词至今让人记忆犹新。特别是我们的律政先锋、张益达、斯奈克、张大炮、痴汉张，张律师（自称），伟哥，炮哥、张尔康、张奥爱情公寓》系列曾经给我们带来很多美好的回忆，霸气的胡一菲，贱贱的曾小贤，傻傻的陈美嘉，花花的吕子乔，还有关谷悠悠......每个人都各具特色，还有无数经典台词至今让人记忆犹新。特别是我们的律政先锋、张益达、斯奈克、张大炮、痴汉张，张律师（自称），伟哥，炮哥、张尔康、张奥纳多纳多";
    neiRongLabel.textColor=_ziTiColor;
    neiRongLabel.font=[UIFont systemFontOfSize:15];
    
    
    [neiRongLabel layoutIfNeeded];
    
    return neiRongLabel.frame.size.height+85;


}

@end
