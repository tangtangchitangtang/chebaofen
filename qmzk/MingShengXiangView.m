

//
//  MingShengXiangView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "MingShengXiangView.h"

@implementation MingShengXiangView
-(void)creatView{

    NSLog(@"%@",_dic);
//    self.backgroundColor=_LightGrey;
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    
    UIView *xiangQingView=[UIView new];
    [_scrollView addSubview:xiangQingView];
    CGFloat hight=[self creatXiagQingview:xiangQingView];
    [xiangQingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*6);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(hight);
    }];
    xiangQingView.backgroundColor=[UIColor whiteColor];
     _scrollView.contentSize = CGSizeMake(0, hight);

}

-(float)creatXiagQingview:(UIView *)View{
    
    
    
    UILabel *titleLabel=[UILabel new];
    [View addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_mainHeight*10);
        make.width.mas_equalTo(_mainW-20);
    }];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=[_dic objectForKey:@"title"];
    titleLabel.textColor=ColorWithRGB(20, 20, 20);
    titleLabel.font= [UIFont fontWithName:@"Helvetica" size:17];
    [titleLabel layoutIfNeeded];
   
    NSString *detailInfo=[_dic objectForKey:@"content"];
    NSString *str=detailInfo;
    CGSize size=[ZQTools getNSStringSize:str andViewWight:_mainW-26 andFont:14];
    UILabel *neiRongLabel=[UILabel new];
    [View addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_top).mas_equalTo(_mainHeight*20);
        make.left.mas_equalTo(13);
        make.right.mas_equalTo(-13);
        make.height.mas_equalTo(size.height);
    }];
    neiRongLabel.numberOfLines=0;
    neiRongLabel.text=str;
    neiRongLabel.textColor=ColorWithRGB(50, 50, 50);
    neiRongLabel.font= [UIFont fontWithName:@"Helvetica" size:14];
    
    NSArray *imgs=[_dic objectForKey:@"imgs"];
    for (int i=0; i<imgs.count; i++ ) {
        
        UIImageView *iamgeView=[UIImageView new];
        [View addSubview:iamgeView];
        [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(5*i+200*i*_mainHeight+20*_mainHeight);
            make.height.mas_equalTo(_mainHeight*200);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(_mainW-26);
        }];
        NSString *uploadfilepath=[imgs[i] objectForKey:@"uploadfilepath"];
        NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,uploadfilepath]];
        [iamgeView sd_setImageWithURL:rul];
        
    }
    
    
    
    return (200*imgs.count+50)*_mainHeight+size.height+15+titleLabel.frame.size.height;
}

@end
