
//
//  shouCangViewCell.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shouCangViewCell.h"

@implementation shouCangViewCell

-(void)creatView{
    
    UIImageView *imageView=[UIImageView new];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(10);
    }];
    NSArray *typeArr=[_dic objectForKey:@"imgs"];
    if (typeArr.count==0) {
        imageView.backgroundColor=[UIColor orangeColor];
    }
    else{
        NSDictionary *imgDic=typeArr[0];
        NSString *uploadfilepath=[imgDic objectForKey:@"uploadfilepath"];
        NSURL *uploadfilepathUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,uploadfilepath]];
        [imageView sd_setImageWithURL:uploadfilepathUrl];
    }

    UILabel *titleLable=[UILabel new];
    [self addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView);
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
    }];
    NSString *title=[_dic objectForKey:@"title"];
    if ([ZQTools charIsNil:title]) {
        title=@"";
    }
    titleLable.text=title;
    titleLable.font=[UIFont fontWithName:@"Helvetica" size:18];
    titleLable.textColor=ColorWithRGB(50, 50, 50);

    UILabel *timeLale=[UILabel new];
    [self addSubview:timeLale];
    [timeLale mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(imageView);
        make.left.mas_equalTo(titleLable);
    }];
    NSNumber *createTime=[_dic objectForKey:@"createTime"];
  
    timeLale.text=[NSString stringWithFormat:@"发布于 %@", [ZQTools changeTimeCuo:@"yyyy/MM/hh" : [NSString stringWithFormat:@"%@",createTime]]];
    timeLale.font=[UIFont fontWithName:@"Helvetica" size:13];
    timeLale.textColor=ColorWithRGB(150, 150, 150);

    
    _shanChuBtn=[UIButton new];
    [self addSubview:_shanChuBtn];
    [_shanChuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(imageView);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(25);
    }];
    _shanChuBtn.tag=_abc;
    _shanChuBtn.layer.borderWidth=1;
    _shanChuBtn.layer.borderColor=ColorWithRGB(255, 37, 78).CGColor;
    [_shanChuBtn setTitle:@"删除" forState:0];
    [_shanChuBtn setTitleColor:ColorWithRGB(255, 37, 78) forState:0];
    _shanChuBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    
}
@end
