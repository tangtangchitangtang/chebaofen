//
//  shangPingXiangQingView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shangPingXiangQingView.h"

@implementation shangPingXiangQingView
-(void)creatView{
    
    NSLog(@"%@",_typeDic);
    
    self.backgroundColor=_LightGrey;
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
    
    UIView *topView=[UIView new];
    [_scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(290*_mainHeight);
    }];
    [self creatTopView:topView];
    
    UIView *diZhiView=[UIView new];
    [_scrollView addSubview:diZhiView];
    [diZhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*6);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainHeight*75);
    }];
    diZhiView.backgroundColor=[UIColor whiteColor];
    [self creatCenterView:diZhiView];
    
    UIView *xiangQingView=[UIView new];
    [_scrollView addSubview:xiangQingView];
    CGFloat hight=[self creatXiagQingview:xiangQingView];
    [xiangQingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(diZhiView.mas_bottom).mas_equalTo(_mainHeight*6);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(hight);
    }];
    xiangQingView.backgroundColor=[UIColor whiteColor];
    
    UIView *xueZhiView=[UIView new];
    [_scrollView addSubview:xueZhiView];
    [xueZhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangQingView.mas_bottom).mas_equalTo(_mainHeight*6);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(210+50*_mainHeight);
    }];
    xueZhiView.backgroundColor=[UIColor whiteColor];
    [self creatXuZhiView:xueZhiView];
    
    UIButton *quRenBtn=[UIButton new];
    [self addSubview:quRenBtn];
    [quRenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xueZhiView.mas_bottom);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainHeight*60);
    }];
    quRenBtn.backgroundColor=_backgroundColor;
    int state=[[_typeDic objectForKey:@"state"] intValue];
    if (state==0) {
        [quRenBtn setTitle:@"下架" forState:UIControlStateNormal];
    }
    if (state==1) {
        [quRenBtn setTitle:@"上架" forState:UIControlStateNormal];
        
    }
    [quRenBtn addTarget:self action:@selector(xiaJia:) forControlEvents:UIControlEventTouchUpInside];
    [quRenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quRenBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    
    _scrollView.contentSize = CGSizeMake(0, 490*_mainHeight + 210 + hight);
    
}
-(void)creatTopView:(UIView *)view{
    UIImageView *imageView=[UIImageView new];
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*200);
    }];
    NSArray *imgs=[_typeDic objectForKey:@"imgs"];
    NSMutableArray *typeArr=[NSMutableArray arrayWithCapacity:0];
    
    for (int i=0; i<imgs.count; i++ ) {
        NSString *uploadfilepath=[imgs[i] objectForKey:@"uploadfilepath"];
        [typeArr addObject:[NSString stringWithFormat:@"%@%@",_addressUrl,uploadfilepath]];
      
    }

    [ZQTools getHederImage:CGRectMake(0, 0, _mainW, _mainHeight*200) :typeArr :view :^(int value) {
        NSLog(@"%d",value);
    }];

    
    UIView *topView=[UIView new];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    UILabel *nameLabel=[UILabel new];
    [topView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*14);
        make.left.mas_equalTo(13);
        make.right.mas_equalTo(70);
    }];
    nameLabel.text=[_typeDic objectForKey:@"title"];
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font= [UIFont fontWithName:@"Helvetica" size:20];
    
    UILabel *XiaoShouLabel=[UILabel new];
    [topView addSubview:XiaoShouLabel];
    [XiaoShouLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-13);
    }];
    NSNumber *monthSellCount=[_typeDic objectForKey:@"monthSellCount"];
    XiaoShouLabel.text=[NSString stringWithFormat:@"月销售%@笔",monthSellCount];
    XiaoShouLabel.textColor=ColorWithRGB(150, 150, 150);
    XiaoShouLabel.font= [UIFont fontWithName:@"Helvetica-Bold" size:13];
    
    UILabel *priceLabel=[UILabel new];
    [topView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-_mainHeight*14);
        make.left.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    
    NSString *discountedPrice=[NSString stringWithFormat:@"%.2f",[[_typeDic objectForKey:@"discountedPrice"] doubleValue]];
    NSString *price=[NSString stringWithFormat:@"%.2f",[[_typeDic objectForKey:@"price"] doubleValue]];
    
    
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@门市价:¥%@",discountedPrice,price]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(150, 150, 150) range:NSMakeRange(discountedPrice.length+1, 5+price.length)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(255, 37, 78) range:NSMakeRange(0, discountedPrice.length+1)];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 1)];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:23] range:NSMakeRange(1, discountedPrice.length+1)];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(discountedPrice.length+1, 5+price.length)];
    priceLabel.attributedText=AttributedStr;

    UILabel *kuCunLabel=[UILabel new];
    [topView addSubview:kuCunLabel];
    [kuCunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(priceLabel);
        make.right.mas_equalTo(-13);
    }];
    NSNumber *stockNum=[_typeDic objectForKey:@"stockNum"];
    if ([stockNum isKindOfClass:[NSNull class]]) {
        stockNum=@0;
    }
    kuCunLabel.text=[NSString stringWithFormat:@"库存：%@",stockNum];
    kuCunLabel.textColor=ColorWithRGB(150, 150, 150);
    kuCunLabel.font= [UIFont fontWithName:@"Helvetica" size:14];
    
}

-(void)creatCenterView:(UIView *)view{
    
    UILabel *nameLabel=[UILabel new];
    [view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*14);
        make.left.mas_equalTo(13);
        make.right.mas_equalTo(70);
    }];
    nameLabel.text=@"黄焖鸡米饭连锁";
    nameLabel.textColor=ColorWithRGB(80, 80, 80);
    nameLabel.font= [UIFont fontWithName:@"Helvetica" size:20];
    
    UIImageView *imageView=[UIImageView new];
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-_mainHeight*14);
        make.left.mas_equalTo(13);
        make.width.height.mas_equalTo(15);
    }];
    imageView.backgroundColor=[UIColor orangeColor];
    
    UILabel *diZhiLabel=[UILabel new];
    [view addSubview:diZhiLabel];
    [diZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(imageView);
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
        make.right.mas_equalTo(-100);
    }];
    NSDictionary *seller=[_typeDic objectForKey:@"seller"];
    diZhiLabel.text=[seller objectForKey:@"sellerAddress"];
    diZhiLabel.textColor=ColorWithRGB(150, 150, 150);
    diZhiLabel.font= [UIFont fontWithName:@"Helvetica" size:13];
    
    UILabel *xianLabel=[UILabel new];
    [view addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*70);
        make.width.mas_equalTo(1);
        make.right.mas_equalTo(-70);
    }];
    xianLabel.backgroundColor=_LightGrey;
    
    UIButton *btn=[UIButton new];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.height.width.mas_equalTo(30);
        make.centerY.mas_equalTo(0);
    }];
    [btn setImage:[UIImage imageNamed:@"电话"] forState:0];


}

-(float)creatXiagQingview:(UIView *)View{
    
    UILabel *titleLabel=[UILabel new];
    [View addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_mainHeight*10);
        make.width.mas_equalTo(70);
    }];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=@"商品详情";
    titleLabel.textColor=ColorWithRGB(20, 20, 20);
    titleLabel.font= [UIFont fontWithName:@"Helvetica" size:17];
    
    UILabel *quanLable=[UILabel new];
    [View addSubview:quanLable];
    [quanLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(titleLabel.mas_left).mas_equalTo(-8);
        make.centerY.mas_equalTo(titleLabel);
        make.height.width.mas_equalTo(6);
    }];
    quanLable.backgroundColor=ColorWithRGB(20, 20, 20);
    quanLable.layer.cornerRadius=3;
    
    UILabel *quanLable2=[UILabel new];
    [View addSubview:quanLable2];
    [quanLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel.mas_right).mas_equalTo(8);
        make.centerY.mas_equalTo(titleLabel);
        make.height.width.mas_equalTo(6);
    }];
    quanLable2.backgroundColor=ColorWithRGB(20, 20, 20);
    quanLable2.layer.cornerRadius=3;

    UILabel *xianLabel=[UILabel new];
    [View addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*30);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(1.5);
    }];
    xianLabel.backgroundColor=ColorWithRGB(20, 20, 20);
    NSString *detailInfo=[_typeDic objectForKey:@"detailInfo"];
    NSString *str=detailInfo;
    CGSize size=[ZQTools getNSStringSize:str andViewWight:_mainW-26 andFont:14];
    UILabel *neiRongLabel=[UILabel new];
    [View addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xianLabel.mas_top).mas_equalTo(_mainHeight*20);
        make.left.mas_equalTo(13);
        make.right.mas_equalTo(-13);
        make.height.mas_equalTo(size.height);
    }];
    neiRongLabel.numberOfLines=0;
    neiRongLabel.text=str;
    neiRongLabel.textColor=ColorWithRGB(50, 50, 50);
    neiRongLabel.font= [UIFont fontWithName:@"Helvetica" size:14];
    NSArray *imgs=[_typeDic objectForKey:@"imgs"];
    for (int i=0; i<imgs.count; i++ ) {
        
        UIImageView *iamgeView=[UIImageView new];
        [View addSubview:iamgeView];
        [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(5*i+200*i*_mainHeight);
            make.height.mas_equalTo(_mainHeight*200);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(_mainW-26);
        }];
        NSString *uploadfilepath=[imgs[i] objectForKey:@"uploadfilepath"];
        NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,uploadfilepath]];
        [iamgeView sd_setImageWithURL:rul];
    
    }
 
    
    
    return (200*imgs.count+50)*_mainHeight+size.height+15;
}

-(void)creatXuZhiView:(UIView *)view{
    UILabel *titleLabel=[UILabel new];
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_mainHeight*10);
        make.width.mas_equalTo(70);
    }];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=@"购买须知";
    titleLabel.textColor=ColorWithRGB(20, 20, 20);
    titleLabel.font= [UIFont fontWithName:@"Helvetica" size:17];
    
    UILabel *quanLable=[UILabel new];
    [view addSubview:quanLable];
    [quanLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(titleLabel.mas_left).mas_equalTo(-8);
        make.centerY.mas_equalTo(titleLabel);
        make.height.width.mas_equalTo(6);
    }];
    quanLable.backgroundColor=ColorWithRGB(20, 20, 20);
    quanLable.layer.cornerRadius=3;
    
    UILabel *quanLable2=[UILabel new];
    [view addSubview:quanLable2];
    [quanLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel.mas_right).mas_equalTo(8);
        make.centerY.mas_equalTo(titleLabel);
        make.height.width.mas_equalTo(6);
    }];
    quanLable2.backgroundColor=ColorWithRGB(20, 20, 20);
    quanLable2.layer.cornerRadius=3;
    
    UILabel *xianLabel=[UILabel new];
    [view addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*30);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(1.5);
    }];
    NSLog(@"%@",_typeDic);
    xianLabel.backgroundColor=ColorWithRGB(20, 20, 20);
    NSString * validityTime1=[NSString stringWithFormat:@"%lld",[[_typeDic objectForKey:@"validityTime"] longLongValue]] ;
    if ([ZQTools charIsNil:validityTime1]) {
        validityTime1=@"0";
    }
    
    NSString *validityTime=[ZQTools changeTimeCuo:@"yyyy/MM/dd" :[NSString stringWithFormat:@"%lld",[validityTime1 longLongValue]]];
    NSString *usePeriod=[_typeDic objectForKey:@"usePeriod"];
    NSString *reservationInfo=[_typeDic objectForKey:@"reservationInfo"];
    NSNumber *applicableNum=[_typeDic objectForKey:@"applicableNum"];
    NSString *userNUm=[NSString stringWithFormat:@"一张券适用%@人",applicableNum];
    
    NSArray *arr=[NSArray arrayWithObjects:@"有效期",validityTime,@"使用时间",usePeriod,@"预约信息",reservationInfo,@"使用人数",userNUm, nil];
    for (int i=0; i<arr.count; i++) {
        if (i%2==0) {
            UILabel *label=[UILabel new];
            [view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(_mainHeight*50+i*25);
                make.left.mas_equalTo(13);
            }];
            label.text=arr[i];
            label.textColor=[UIColor orangeColor];
            label.font= [UIFont fontWithName:@"Helvetica" size:14];
        }
        else{
            UILabel *label=[UILabel new];
            [view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(_mainHeight*50+i*25);
                make.left.mas_equalTo(18);
            }];
            label.text=arr[i];
            label.textColor=ColorWithRGB(80, 80, 80);
            label.font= [UIFont fontWithName:@"Helvetica" size:14];

            UILabel *quanLabel=[UILabel new];
            [view addSubview:quanLabel];
            [quanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(label);
                make.left.mas_equalTo(13);
                make.width.height.mas_equalTo(3);
            }];
            quanLabel.layer.cornerRadius=1.5;
            quanLabel.backgroundColor=ColorWithRGB(80, 80, 80);
        
        }
    }
}

-(IBAction)xiaJia:(UIButton *)sender{
    NSNumber *idGoods=[_typeDic objectForKey:@"idGoods"];
    NSNumber *stockNum=[_typeDic objectForKey:@"stockNum"];

    if ([sender.titleLabel.text isEqualToString:@"上架"]) {
        
        NSDictionary *dicaa=[NSDictionary dictionaryWithObjectsAndKeys:idGoods,@"goodsId",stockNum,@"stockNum",@0,@"state", nil];
        
        [ZQTools AFNGetDataUrl:@"mgoods/updateMgoods" Dict:dicaa andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            [sender setTitle:@"下架" forState:0];
        } anderrorBlock:nil];
    }  if ([sender.titleLabel.text isEqualToString:@"下架"]) {
        
        NSDictionary *dicaa=[NSDictionary dictionaryWithObjectsAndKeys:idGoods,@"goodsId",stockNum,@"stockNum",@1,@"state", nil];
        
        [ZQTools AFNGetDataUrl:@"mgoods/updateMgoods" Dict:dicaa andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            [sender setTitle:@"上架" forState:0];
        } anderrorBlock:nil];
    }

   


}




@end
