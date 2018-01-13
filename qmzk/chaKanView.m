
//
//  chaKanView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "chaKanView.h"
#import "faBuQiuZhiViewController.h"
@implementation chaKanView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    _scrollView.contentOffset=CGPointMake(0,0);
    
    UIView *topView=[UIView new];
    [_scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainHeight*180+2);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];
    
    UIView *miaoShuView=[UIView new];
    CGFloat height= [self creatMiaoShuView:miaoShuView];
    [_scrollView addSubview:miaoShuView];
    [miaoShuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(height);
    }];
    miaoShuView.backgroundColor=[UIColor whiteColor];
    UIView *xiangView=[UIView new];
    [self addSubview:xiangView];
    [xiangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(miaoShuView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.width.mas_equalTo(_mainW);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*130+1);
    }];
    xiangView.backgroundColor=[UIColor whiteColor];
    [self creatXiangView:xiangView];
  
    UIView *lianXiView=[UIView new];
    [_scrollView addSubview:lianXiView];
    [lianXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.width.mas_equalTo(_mainW);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(120*_mainHeight+2);
    }];
    lianXiView.backgroundColor=[UIColor whiteColor];
    [self creatLianXi:lianXiView];
    
    UIButton *queDing=[UIButton new];
    [_scrollView addSubview:queDing];
    [queDing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(lianXiView);
        make.top.mas_equalTo(lianXiView.mas_bottom).mas_equalTo(_mainHeight*20);
        make.height.mas_equalTo(50*_mainHeight);
    }];
    queDing.backgroundColor=_backgroundColor;
    [queDing setTitle:@"修改" forState:0];
    [queDing setTitleColor:[UIColor whiteColor] forState:0];
    [queDing addTarget:self action:@selector(xiuGai:) forControlEvents:UIControlEventTouchUpInside];
    
    _scrollView.contentSize = CGSizeMake(0, 5+height+_mainHeight*530);

}

-(IBAction)xiuGai:(UIButton *)sender
{
    
    
    faBuQiuZhiViewController *faBu=[[faBuQiuZhiViewController alloc] init];
    faBu.dic=_typeDic;
    faBu.abc=2;
    [ZQTools pushNextViewController:self.viewController andRootController:faBu];

}
-(void)creatTopView:(UIView *)view{
    UILabel *nameLabel=[UILabel new];
    [view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-_mainHeight*60);
        make.left.mas_equalTo(10);
    }];
    nameLabel.text=[_typeDic objectForKey:@"positionName"];
    nameLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:22];
    
    UILabel *priceLabel=[UILabel new];
    [view addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-_mainHeight*30);
        make.left.mas_equalTo(10);
    }];
    NSString *xinZhi=[NSString stringWithFormat:@"%d-%d／月",[[_typeDic objectForKey:@"minSalary"] intValue],[[_typeDic objectForKey:@"maxSalary"] intValue]];
    priceLabel.text=xinZhi;
    priceLabel.font=[UIFont systemFontOfSize:17];
    priceLabel.textColor=ColorWithRGB(255, 37, 78);

    UILabel *timeLabe=[UILabel new];
    [view addSubview:timeLabe];
    [timeLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    NSString *createTime=[NSString stringWithFormat:@"%lld",[[_typeDic objectForKey:@"createTime"] longLongValue]];
    timeLabe.text=[ZQTools changeTimeCuo:@"yyyy/MM/dd" :createTime];
    timeLabe.font=[UIFont systemFontOfSize:12];
    timeLabe.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xian=[UILabel new];
    [view addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_mainHeight*90);
    }];
    xian.backgroundColor=_LightGrey;
    
    UIView *dizhiView=[UIView new];
    [view addSubview:dizhiView];
    [dizhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    
    UILabel *dizhiLabel=[UILabel new];
    [dizhiView addSubview:dizhiLabel];
    [dizhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    dizhiLabel.text=@"工作地址";
    dizhiLabel.font=[UIFont systemFontOfSize:15];
    dizhiLabel.textColor=ColorWithRGB(100, 100, 100);
    
    UILabel *diZhiLabel=[UILabel new];
    [dizhiView addSubview:diZhiLabel];
    [diZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
    NSString *sellerAddr=[_typeDic objectForKey:@"sellerAddr"];
    if ([ZQTools charIsNil:sellerAddr]) {
        sellerAddr=@"";
    }
    diZhiLabel.text=sellerAddr;
    diZhiLabel.textColor=ColorWithRGB(150, 150, 150);
    diZhiLabel.font=[UIFont systemFontOfSize:14];
    
    UILabel *xianLabel2=[UILabel new];
    [view addSubview:xianLabel2];
    [xianLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dizhiView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xianLabel2.backgroundColor=_LightGrey;

    UIView *yaoQiuView=[UIView new];
    [view addSubview:yaoQiuView];
    [yaoQiuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xianLabel2.mas_bottom);
        make.bottom.right.left.mas_equalTo(0);
    }];
    
    UILabel *yaoQiuLabel=[UILabel new];
    [yaoQiuView addSubview:yaoQiuLabel];
    [yaoQiuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    yaoQiuLabel.text=@"要求";
    yaoQiuLabel.textColor=ColorWithRGB(100, 100, 100);
    yaoQiuLabel.font=[UIFont systemFontOfSize:15];
    
    UILabel *yaoQiuLabel2=[UILabel new];
    [yaoQiuView addSubview:yaoQiuLabel2];
    [yaoQiuLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
    
    NSString *zhuanYe=[NSString stringWithFormat:@"招%d人/%@／工作%d年",[[_typeDic objectForKey:@"employNum"] intValue],[_typeDic objectForKey:@"education"],[[_typeDic objectForKey:@"workExperience"] intValue]];
    yaoQiuLabel2.text=zhuanYe;
    yaoQiuLabel2.font=[UIFont systemFontOfSize:14];
    yaoQiuLabel2.textColor=ColorWithRGB(150, 150, 150);
    
}

-(CGFloat )creatMiaoShuView:(UIView *)view{
    UILabel *miaoShuLabel=[UILabel new];
    [view addSubview:miaoShuLabel];
    [miaoShuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*45);
    }];

    miaoShuLabel.text=@"职位描述";
    miaoShuLabel.textColor=ColorWithRGB(50,50 , 50);
    miaoShuLabel.font=[UIFont systemFontOfSize:16];
    UILabel *xianLabel=[UILabel new];
    [view addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(miaoShuLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xianLabel.backgroundColor=_LightGrey;
    
    NSString *str=[_typeDic objectForKey:@"positionDesc"];
    
    
    CGSize sizea=[ZQTools getNSStringSize:str andViewWight:_mainW-20 andFont:15];
    
    UILabel *neiRongLabel=[UILabel new];
    [view addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(xianLabel.mas_bottom);
        make.height.mas_equalTo(sizea.height);
    }];
    neiRongLabel.numberOfLines=0;
    neiRongLabel.text=str;
    neiRongLabel.font=[UIFont systemFontOfSize:15];
    neiRongLabel.textColor=ColorWithRGB(100, 100, 100);
    CGFloat height=sizea.height+_mainHeight*45+10;
    
    return height;
}

-(void)creatXiangView:(UIView *)View{
    UILabel *jiBenLabel=[UILabel new];
    [View addSubview:jiBenLabel];
    [jiBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.width.mas_equalTo(165);
    }];
    jiBenLabel.text=@"公司详情";
    jiBenLabel.textColor=ColorWithRGB(50, 50, 50);
    jiBenLabel.font=[UIFont systemFontOfSize:16];
    
    UILabel *xian=[UILabel new];
    [View addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xian.backgroundColor=_LightGrey;

    
    UIView *nameView=[UIView new];
    [View addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    NSString *nickName=[_typeDic objectForKey:@"nickName"];
    if ([ZQTools charIsNil:nickName]) {
        nickName=@"";
    }

    nameLabel.text=nickName;
    nameLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
    
    UILabel *xingZhiLabel=[UILabel new];
    [View addSubview:xingZhiLabel];
    [xingZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    xingZhiLabel.text=[NSString stringWithFormat:@"性质：%@",[_typeDic objectForKey:@"sellerTypeText"]];
    xingZhiLabel.font=[UIFont systemFontOfSize:15];
    xingZhiLabel.textColor=ColorWithRGB(100, 100, 100);
    
    UILabel *hangYeLabel=[UILabel new];
    [View addSubview:hangYeLabel];
    [hangYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xingZhiLabel.mas_bottom);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    hangYeLabel.text=[NSString stringWithFormat:@"行业：%@",[_typeDic objectForKey:@"isGovEntityText"]];
    hangYeLabel.font=[UIFont systemFontOfSize:15];
    hangYeLabel.textColor=ColorWithRGB(100, 100, 100);
    
    
    
    
}
-(void)creatLianXi:(UIView *)View{
    
    UILabel *jiBenLabel=[UILabel new];
    [View addSubview:jiBenLabel];
    [jiBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.width.mas_equalTo(165);
    }];
    jiBenLabel.text=@"联系方式";
    jiBenLabel.textColor=ColorWithRGB(50, 50, 50);
    jiBenLabel.font=[UIFont systemFontOfSize:16];
    
    UILabel *xian4=[UILabel new];
    [View addSubview:xian4];
    [xian4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xian4.backgroundColor=_LightGrey;
    
    UIView *lianXiView=[UIView new];
    [View addSubview:lianXiView];
    [lianXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    
    UILabel *lianXiRenLabel=[UILabel new];
    [lianXiView addSubview:lianXiRenLabel];
    [lianXiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    lianXiRenLabel.text=@"联系人";
    lianXiRenLabel.font=[UIFont systemFontOfSize:15];
    lianXiRenLabel.textColor=ColorWithRGB(100, 100, 100);
    
    UILabel *nameLalel =[UILabel new];
    [lianXiView addSubview:nameLalel];
    [nameLalel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
    nameLalel.textColor=ColorWithRGB(100, 100, 100);
    nameLalel.font=[UIFont systemFontOfSize:14];
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    nameLalel.text=[userBasic objectForKey:@"nickName"];
    
    UILabel *xian3=[UILabel new];
    [View addSubview:xian3];
    [xian3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lianXiView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xian3.backgroundColor=_LightGrey;

    
    UIView *phoneView=[UIView new];
    [View addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lianXiView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    
    
    UILabel *phoneLabel=[UILabel new];
    [phoneView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    phoneLabel.text=@"手机号";
    phoneLabel.font=[UIFont systemFontOfSize:15];
    phoneLabel.textColor=ColorWithRGB(100, 100, 100);
    
    UILabel *phoneText=[UILabel new];
    [phoneView addSubview:phoneText];
    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
    phoneText.textColor=ColorWithRGB(100, 100, 100);
    phoneText.font=[UIFont systemFontOfSize:14];
    phoneText.text=[_typeDic objectForKey:@"phone"];
    
    
    
}
@end
