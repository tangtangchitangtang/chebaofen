//
//  xiuGaiView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "xiuGaiView.h"
#import "SameCityAddHeaderView.h"

@implementation xiuGaiView

-(void)creatView{
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(0, _mainHeight*50+_mainH-65);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    
    _imageview = [SameCityAddHeaderView addSameCityAddHeaderView];
    [_scrollView addSubview:_imageview];
    _imageview.inVc = self.viewController;
    
    
    UIView *zhuTiView=[UIView new];
    [_scrollView addSubview:zhuTiView];
    [zhuTiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*210);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*120+2);
        make.width.mas_equalTo(_mainW-20);
    }];
    zhuTiView.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    zhuTiView.layer.borderWidth=0.5;
    
    UILabel *zhuTiLabel=[UILabel new];
    [zhuTiView addSubview:zhuTiLabel];
    [zhuTiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    zhuTiLabel.text=@"标\t题";
    zhuTiLabel.textAlignment=NSTextAlignmentCenter;
    zhuTiLabel.font=[UIFont systemFontOfSize:15];
    zhuTiLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel=[UILabel new];
    [zhuTiView addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(zhuTiLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(zhuTiLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _zhuTiText=[UITextField new];
    [zhuTiView addSubview:_zhuTiText];
    [_zhuTiText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(zhuTiLabel);
        make.left.mas_equalTo(xianLabel.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel);
        make.right.mas_equalTo(-5);
    }];
    _zhuTiText.placeholder=@"20字以内";
    _zhuTiText.font=[UIFont systemFontOfSize:15];
    _zhuTiText.textColor=ColorWithRGB(150, 150, 150);
    _zhuTiText.delegate=self;
    _zhuTiText.returnKeyType=UIReturnKeyDone;
    
    UILabel *xianLabel2=[UILabel new];
    [zhuTiView addSubview:xianLabel2];
    [xianLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuTiLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    xianLabel2.backgroundColor=ColorWithRGB(200, 200, 200);
   
    UILabel *quYuLabel=[UILabel new];
    [zhuTiView addSubview:quYuLabel];
    [quYuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(xianLabel2.mas_bottom);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    quYuLabel.text=@"商品类型";
    quYuLabel.textAlignment=NSTextAlignmentCenter;
    quYuLabel.font=[UIFont systemFontOfSize:15];
    quYuLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel3=[UILabel new];
    [zhuTiView addSubview:xianLabel3];
    [xianLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(quYuLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(quYuLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel3.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _quYuText=[UILabel new];
    [zhuTiView addSubview:_quYuText];
    [_quYuText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(quYuLabel);
        make.left.mas_equalTo(xianLabel3.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel3);
        make.right.mas_equalTo(-5);
    }];
    _quYuText.text=@"请选择";
    _quYuText.font=[UIFont systemFontOfSize:15];
    _quYuText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatLeiXing:)];
    [_quYuText addGestureRecognizer:tapGesture2];
    
    UILabel *XianLabel=[UILabel new];
    [zhuTiView addSubview:XianLabel];
    [XianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(quYuLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    XianLabel.backgroundColor=ColorWithRGB(200, 200, 200);

    
    UILabel *caiDanLabel=[UILabel new];
    [zhuTiView addSubview:caiDanLabel];
    [caiDanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    caiDanLabel.text=@"菜单类型";
    caiDanLabel.textAlignment=NSTextAlignmentCenter;
    caiDanLabel.font=[UIFont systemFontOfSize:15];
    caiDanLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel15=[UILabel new];
    [zhuTiView addSubview:xianLabel15];
    [xianLabel15 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(caiDanLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(caiDanLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel15.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _caiDanLabel=[UILabel new];
    [zhuTiView addSubview:_caiDanLabel];
    [_caiDanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(caiDanLabel);
        make.left.mas_equalTo(xianLabel3.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel3);
        make.right.mas_equalTo(-5);
    }];
    _caiDanLabel.text=@"请选择";
    _caiDanLabel.font=[UIFont systemFontOfSize:15];
    _caiDanLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture3= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cretSelectDic:)];
    [_caiDanLabel addGestureRecognizer:tapGesture3];
    
    UIView *priceView=[UIView new];
    [_scrollView addSubview:priceView];
    [priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuTiView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(zhuTiView);
        make.height.mas_equalTo(40*_mainHeight);
        make.width.mas_equalTo(_mainW/2-20);
    }];
    priceView.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    priceView.layer.borderWidth=0.5;

    UILabel *priceLabel=[UILabel new];
    [priceView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    priceLabel.text=@"价\t格";
    priceLabel.textAlignment=NSTextAlignmentCenter;
    priceLabel.font=[UIFont systemFontOfSize:15];
    priceLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel4=[UILabel new];
    [priceView addSubview:xianLabel4];
    [xianLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(priceLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(1);
    }];
    xianLabel4.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _priceText=[UITextField new];
    [priceView addSubview:_priceText];
    [_priceText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel4);
        make.left.mas_equalTo(xianLabel4.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel4);
        make.right.mas_equalTo(-5);
    }];
    _priceText.keyboardType=UIKeyboardTypeDecimalPad;
    _priceText.text=@"50";
    _priceText.font=[UIFont systemFontOfSize:15];
    _priceText.delegate=self;
    _zhuTiText.returnKeyType=UIReturnKeyDone;
    
    
    
    UIView *priceView2=[UIView new];
    [_scrollView addSubview:priceView2];
    [priceView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuTiView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.right.mas_equalTo(zhuTiView);
        make.height.mas_equalTo(40*_mainHeight);
        make.width.mas_equalTo(_mainW/2-20);
    }];
    priceView2.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    priceView2.layer.borderWidth=0.5;
    
    UILabel *priceLabel2=[UILabel new];
    [priceView2 addSubview:priceLabel2];
    [priceLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    priceLabel2.text=@"原\t价";
    priceLabel2.textAlignment=NSTextAlignmentCenter;
    priceLabel2.font=[UIFont systemFontOfSize:15];
    priceLabel2.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel5=[UILabel new];
    [priceView addSubview:xianLabel5];
    [xianLabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceLabel2.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(priceLabel2);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(1);
    }];
    xianLabel5.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _priceText2=[UITextField new];
    [priceView2 addSubview:_priceText2];
    [_priceText2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel5);
        make.left.mas_equalTo(xianLabel5.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel5);
        make.right.mas_equalTo(-5);
    }];
    _priceText2.keyboardType=UIKeyboardTypeDecimalPad;
    _priceText2.text=@"60";
    _priceText2.font=[UIFont systemFontOfSize:15];
    _priceText2.delegate=self;
    _priceText2.returnKeyType=UIReturnKeyDone;
    
    UIView *kucunview=[UIView new];
    [_scrollView addSubview:kucunview];
    [kucunview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(priceView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(zhuTiView);
        make.height.mas_equalTo(40*_mainHeight);
        make.width.mas_equalTo(_mainW-20);
    }];
    kucunview.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    kucunview.layer.borderWidth=0.5;

    UILabel * kucunLabel=[UILabel new];
    [kucunview addSubview:kucunLabel];
    [kucunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    kucunLabel.text=@"库\t存";
    kucunLabel.textAlignment=NSTextAlignmentCenter;
    kucunLabel.font=[UIFont systemFontOfSize:15];
    kucunLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel6=[UILabel new];
    [kucunview addSubview:xianLabel6];
    [xianLabel6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kucunLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(kucunLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel6.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _kuCunText=[UITextField new];
    [kucunview addSubview:_kuCunText];
    [_kuCunText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel6);
        make.left.mas_equalTo(xianLabel6.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel6);
        make.right.mas_equalTo(-5);
    }];
    _kuCunText.keyboardType=UIKeyboardTypeDecimalPad;
    _kuCunText.text=@"50";
    _kuCunText.font=[UIFont systemFontOfSize:15];
    _kuCunText.delegate=self;
    _kuCunText.returnKeyType=UIReturnKeyDone;
    
    UIView *xiangView=[UIView new];
    [_scrollView addSubview:xiangView];
    [xiangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kucunview.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*200+2);
        make.width.mas_equalTo(_mainW-20);
    }];
    xiangView.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    xiangView.layer.borderWidth=0.5;
    for (int i=1; i<5; i++) {
        UILabel *xianLabelw=[UILabel new];
        [xiangView addSubview:xianLabelw];
        [xianLabelw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_mainHeight*40*i+i*0.5);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        xianLabelw.backgroundColor=ColorWithRGB(200, 200, 200);
    }
    
    UILabel *xiangLabel=[UILabel new];
    [xiangView addSubview:xiangLabel];
    [xiangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    xiangLabel.text=@"详\t情";
    xiangLabel.textAlignment=NSTextAlignmentCenter;
    xiangLabel.font=[UIFont systemFontOfSize:15];
    xiangLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel7=[UILabel new];
    [xiangView addSubview:xianLabel7];
    [xianLabel7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(xiangLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel7.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _xiangQingText=[UILabel new];
    [xiangView addSubview:_xiangQingText];
    [_xiangQingText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel7);
        make.left.mas_equalTo(xianLabel7.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel7);
        make.right.mas_equalTo(-5);
    }];
    _xiangQingText.text=@"150字以内";
    _xiangQingText.textColor=ColorWithRGB(150, 150, 150);
    _xiangQingText.font=[UIFont systemFontOfSize:15];
    _xiangQingText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatXiangQing:)];
    [_xiangQingText addGestureRecognizer:tapGesture];
    
    UILabel *youXiao=[UILabel new];
    [xiangView addSubview:youXiao];
    [youXiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(40*_mainHeight+0.5);
        make.width.mas_equalTo(50);
    }];
    youXiao.text=@"有限期";
    youXiao.textAlignment=NSTextAlignmentCenter;
    youXiao.font=[UIFont systemFontOfSize:15];
    youXiao.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel8=[UILabel new];
    [xiangView addSubview:xianLabel8];
    [xianLabel8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(youXiao.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(youXiao);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel8.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _youXiaoText=[UILabel new];
    [xiangView addSubview:_youXiaoText];
    [_youXiaoText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel8);
        make.left.mas_equalTo(xianLabel8.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel8);
        make.right.mas_equalTo(-5);
    }];
    _youXiaoText.font=[UIFont systemFontOfSize:15];
    _youXiaoText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatViewYouXiaoTime:)];
    [_youXiaoText addGestureRecognizer:tapGesture4];
    
    
    UILabel *shiYong=[UILabel new];
    [xiangView addSubview:shiYong];
    [shiYong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(80*_mainHeight+1);
        make.width.mas_equalTo(70);
    }];
    shiYong.text=@"使用时间";
    shiYong.textAlignment=NSTextAlignmentCenter;
    shiYong.font=[UIFont systemFontOfSize:15];
    shiYong.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel9=[UILabel new];
    [xiangView addSubview:xianLabel9];
    [xianLabel9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(shiYong.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(shiYong);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel9.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _shiYongText=[UITextField new];
    [xiangView addSubview:_shiYongText];
    [_shiYongText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel9);
        make.left.mas_equalTo(xianLabel9.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel9);
        make.right.mas_equalTo(-5);
    }];
    _shiYongText.font=[UIFont systemFontOfSize:15];
    _shiYongText.delegate=self;
    _shiYongText.returnKeyType=UIReturnKeyDone;
    
    UILabel *yuYue=[UILabel new];
    [xiangView addSubview:yuYue];
    [yuYue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(120*_mainHeight+1.5);
        make.width.mas_equalTo(70);
    }];
    yuYue.text=@"预约信息";
    yuYue.textAlignment=NSTextAlignmentCenter;
    yuYue.font=[UIFont systemFontOfSize:15];
    yuYue.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel10=[UILabel new];
    [xiangView addSubview:xianLabel10];
    [xianLabel10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(yuYue.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(yuYue);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel10.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _yuYueText=[UITextField new];
    [xiangView addSubview:_yuYueText];
    [_yuYueText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel10);
        make.left.mas_equalTo(xianLabel10.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel10);
        make.right.mas_equalTo(-5);
    }];
    _yuYueText.font=[UIFont systemFontOfSize:15];
    _yuYueText.delegate=self;
    _yuYueText.returnKeyType=UIReturnKeyDone;
    
    
    UILabel *renShu=[UILabel new];
    [xiangView addSubview:renShu];
    [renShu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(160*_mainHeight+1.5);
        make.width.mas_equalTo(70);
    }];
    renShu.text=@"适用人数";
    renShu.textAlignment=NSTextAlignmentCenter;
    renShu.font=[UIFont systemFontOfSize:15];
    renShu.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel11=[UILabel new];
    [xiangView addSubview:xianLabel11];
    [xianLabel11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(renShu.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(renShu);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel11.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _renShuText=[UITextField new];
    [xiangView addSubview:_renShuText];
    [_renShuText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel11);
        make.left.mas_equalTo(xianLabel11.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel11);
        make.right.mas_equalTo(-5);
    }];
    _renShuText.keyboardType=UIKeyboardTypeDecimalPad;
    _renShuText.font=[UIFont systemFontOfSize:15];
    _renShuText.delegate=self;
    _renShuText.returnKeyType=UIReturnKeyDone;


    
}

-(void)creatView2{
    _goodsType=[_typeDic objectForKey:@"goodsType"];
    _goodsBelongType=[_typeDic objectForKey:@"goodsBelongType"];
    _caiDanLabel.text=[_typeDic objectForKey:@"goodsBelongText"];
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(0, _mainHeight*50+_mainH-65);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    
 
    
    _imageview = [SameCityAddHeaderView addSameCityAddHeaderView];
    [_scrollView addSubview:_imageview];
    _imageview.inVc = self.viewController;
    NSArray *images=[_typeDic objectForKey:@"imgs"];
    for (int i=0; i<images.count; i++) {
        NSDictionary *type=images[i];
        NSString *uploadfilepath=[NSString stringWithFormat:@"%@%@",_addressUrl,[type objectForKey:@"uploadfilepath"]];
        [ZQTools getImageFromURL:uploadfilepath];
        [_imageview.imgArr addObject: [ZQTools getImageFromURL:uploadfilepath]];
    }
    
    UIView *zhuTiView=[UIView new];
    [_scrollView addSubview:zhuTiView];
    [zhuTiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_mainHeight*210);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*80+1);
        make.width.mas_equalTo(_mainW-20);
    }];
    zhuTiView.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    zhuTiView.layer.borderWidth=0.5;
    
    UILabel *zhuTiLabel=[UILabel new];
    [zhuTiView addSubview:zhuTiLabel];
    [zhuTiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    zhuTiLabel.text=@"标\t题";
    zhuTiLabel.textAlignment=NSTextAlignmentCenter;
    zhuTiLabel.font=[UIFont systemFontOfSize:15];
    zhuTiLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel=[UILabel new];
    [zhuTiView addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(zhuTiLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(zhuTiLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _zhuTiText=[UITextField new];
    [zhuTiView addSubview:_zhuTiText];
    [_zhuTiText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(zhuTiLabel);
        make.left.mas_equalTo(xianLabel.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel);
        make.right.mas_equalTo(-5);
    }];
    _zhuTiText.text=[_typeDic objectForKey:@"title"];
    _zhuTiText.font=[UIFont systemFontOfSize:15];
    _zhuTiText.textColor=ColorWithRGB(150, 150, 150);
    _zhuTiText.delegate=self;
    _zhuTiText.returnKeyType=UIReturnKeyDone;
    
    UILabel *xianLabel2=[UILabel new];
    [zhuTiView addSubview:xianLabel2];
    [xianLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuTiLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    xianLabel2.backgroundColor=ColorWithRGB(200, 200, 200);
    
    UILabel *quYuLabel=[UILabel new];
    [zhuTiView addSubview:quYuLabel];
    [quYuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(xianLabel2.mas_bottom);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    quYuLabel.text=@"商品类型";
    quYuLabel.textAlignment=NSTextAlignmentCenter;
    quYuLabel.font=[UIFont systemFontOfSize:15];
    quYuLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel3=[UILabel new];
    [zhuTiView addSubview:xianLabel3];
    [xianLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(quYuLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(quYuLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel3.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _quYuText=[UILabel new];
    [zhuTiView addSubview:_quYuText];
    [_quYuText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(quYuLabel);
        make.left.mas_equalTo(xianLabel3.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel3);
        make.right.mas_equalTo(-5);
    }];
    _quYuText.text=[_typeDic objectForKey:@"goodsTypeText"];
    _quYuText.font=[UIFont systemFontOfSize:15];
    _quYuText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatLeiXing:)];
    [_quYuText addGestureRecognizer:tapGesture2];
    

    UIView *priceView=[UIView new];
    [_scrollView addSubview:priceView];
    [priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuTiView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(zhuTiView);
        make.height.mas_equalTo(40*_mainHeight);
        make.width.mas_equalTo(_mainW/2-20);
    }];
    priceView.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    priceView.layer.borderWidth=0.5;
    
    UILabel *priceLabel=[UILabel new];
    [priceView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    priceLabel.text=@"价\t格";
    priceLabel.textAlignment=NSTextAlignmentCenter;
    priceLabel.font=[UIFont systemFontOfSize:15];
    priceLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel4=[UILabel new];
    [priceView addSubview:xianLabel4];
    [xianLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(priceLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(1);
    }];
    xianLabel4.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _priceText=[UITextField new];
    [priceView addSubview:_priceText];
    [_priceText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel4);
        make.left.mas_equalTo(xianLabel4.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel4);
        make.right.mas_equalTo(-5);
    }];
    _priceText.keyboardType=UIKeyboardTypeDecimalPad;
    _priceText.text=[NSString stringWithFormat:@"%.2f",[[_typeDic objectForKey:@"discountedPrice"] doubleValue]];
    _priceText.font=[UIFont systemFontOfSize:15];
    _priceText.delegate=self;
    _zhuTiText.returnKeyType=UIReturnKeyDone;
    
    
    
    UIView *priceView2=[UIView new];
    [_scrollView addSubview:priceView2];
    [priceView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhuTiView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.right.mas_equalTo(zhuTiView);
        make.height.mas_equalTo(40*_mainHeight);
        make.width.mas_equalTo(_mainW/2-20);
    }];
    priceView2.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    priceView2.layer.borderWidth=0.5;
    
    UILabel *priceLabel2=[UILabel new];
    [priceView2 addSubview:priceLabel2];
    [priceLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    priceLabel2.text=@"原\t价";
    priceLabel2.textAlignment=NSTextAlignmentCenter;
    priceLabel2.font=[UIFont systemFontOfSize:15];
    priceLabel2.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel5=[UILabel new];
    [priceView addSubview:xianLabel5];
    [xianLabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceLabel2.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(priceLabel2);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(1);
    }];
    xianLabel5.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _priceText2=[UITextField new];
    [priceView2 addSubview:_priceText2];
    [_priceText2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel5);
        make.left.mas_equalTo(xianLabel5.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel5);
        make.right.mas_equalTo(-5);
    }];
    _priceText2.keyboardType=UIKeyboardTypeDecimalPad;
    _priceText2.text=[NSString stringWithFormat:@"%.2f",[[_typeDic objectForKey:@"price"] doubleValue]];
    _priceText2.font=[UIFont systemFontOfSize:15];
    _priceText2.delegate=self;
    _priceText2.returnKeyType=UIReturnKeyDone;
    
    UIView *kucunview=[UIView new];
    [_scrollView addSubview:kucunview];
    [kucunview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(priceView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(zhuTiView);
        make.height.mas_equalTo(40*_mainHeight);
        make.width.mas_equalTo(_mainW-20);
    }];
    kucunview.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    kucunview.layer.borderWidth=0.5;
    
    UILabel * kucunLabel=[UILabel new];
    [kucunview addSubview:kucunLabel];
    [kucunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    kucunLabel.text=@"库\t存";
    kucunLabel.textAlignment=NSTextAlignmentCenter;
    kucunLabel.font=[UIFont systemFontOfSize:15];
    kucunLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel6=[UILabel new];
    [kucunview addSubview:xianLabel6];
    [xianLabel6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kucunLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(kucunLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel6.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _kuCunText=[UITextField new];
    [kucunview addSubview:_kuCunText];
    [_kuCunText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel6);
        make.left.mas_equalTo(xianLabel6.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel6);
        make.right.mas_equalTo(-5);
    }];
    _kuCunText.keyboardType=UIKeyboardTypeDecimalPad;
    _kuCunText.text=[NSString stringWithFormat:@"%d",[[_typeDic objectForKey:@"stockNum"] intValue]];
    _kuCunText.font=[UIFont systemFontOfSize:15];
    _kuCunText.delegate=self;
    _kuCunText.returnKeyType=UIReturnKeyDone;
    
    UIView *xiangView=[UIView new];
    [_scrollView addSubview:xiangView];
    [xiangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kucunview.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*200+2);
        make.width.mas_equalTo(_mainW-20);
    }];
    xiangView.layer.borderColor=ColorWithRGB(200, 200, 200).CGColor;
    xiangView.layer.borderWidth=0.5;
    for (int i=1; i<5; i++) {
        UILabel *xianLabelw=[UILabel new];
        [xiangView addSubview:xianLabelw];
        [xianLabelw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_mainHeight*40*i+i*0.5);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        xianLabelw.backgroundColor=ColorWithRGB(200, 200, 200);
    }
    
    UILabel *xiangLabel=[UILabel new];
    [xiangView addSubview:xiangLabel];
    [xiangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    xiangLabel.text=@"详\t情";
    xiangLabel.textAlignment=NSTextAlignmentCenter;
    xiangLabel.font=[UIFont systemFontOfSize:15];
    xiangLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel7=[UILabel new];
    [xiangView addSubview:xianLabel7];
    [xianLabel7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(xiangLabel.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel7.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _xiangQingText=[UILabel new];
    [xiangView addSubview:_xiangQingText];
    [_xiangQingText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel7);
        make.left.mas_equalTo(xianLabel7.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel7);
        make.right.mas_equalTo(-5);
    }];
    _xiangQingText.text=[_typeDic objectForKey:@"detailInfo"];
    _xiangQingText.textColor=ColorWithRGB(150, 150, 150);
    _xiangQingText.font=[UIFont systemFontOfSize:15];
    _xiangQingText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatXiangQing:)];
    [_xiangQingText addGestureRecognizer:tapGesture];
    
    UILabel *youXiao=[UILabel new];
    [xiangView addSubview:youXiao];
    [youXiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(40*_mainHeight+0.5);
        make.width.mas_equalTo(50);
    }];
    youXiao.text=@"有限期";
    youXiao.textAlignment=NSTextAlignmentCenter;
    youXiao.font=[UIFont systemFontOfSize:15];
    youXiao.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel8=[UILabel new];
    [xiangView addSubview:xianLabel8];
    [xianLabel8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(youXiao.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(youXiao);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel8.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _youXiaoText=[UILabel new];
    [xiangView addSubview:_youXiaoText];
    [_youXiaoText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel8);
        make.left.mas_equalTo(xianLabel8.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel8);
        make.right.mas_equalTo(-5);
    }];
    _validityTime=[_typeDic objectForKey:@"validityTime"];
    _youXiaoText.text=[ZQTools changeTimeCuo:@"yyyy年MM月dd日" :[NSString stringWithFormat:@"%@",_validityTime]];
    
    _youXiaoText.font=[UIFont systemFontOfSize:15];
    _youXiaoText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatViewYouXiaoTime:)];
    [_youXiaoText addGestureRecognizer:tapGesture4];
    
    
    UILabel *shiYong=[UILabel new];
    [xiangView addSubview:shiYong];
    [shiYong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(80*_mainHeight+1);
        make.width.mas_equalTo(70);
    }];
    shiYong.text=@"使用时间";
    shiYong.textAlignment=NSTextAlignmentCenter;
    shiYong.font=[UIFont systemFontOfSize:15];
    shiYong.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel9=[UILabel new];
    [xiangView addSubview:xianLabel9];
    [xianLabel9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(shiYong.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(shiYong);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel9.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _shiYongText=[UITextField new];
    [xiangView addSubview:_shiYongText];
    [_shiYongText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel9);
        make.left.mas_equalTo(xianLabel9.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel9);
        make.right.mas_equalTo(-5);
    }];
    _shiYongText.text=[_typeDic objectForKey:@"usePeriod"];
    _shiYongText.font=[UIFont systemFontOfSize:15];
    _shiYongText.delegate=self;
    _shiYongText.returnKeyType=UIReturnKeyDone;
    
    UILabel *yuYue=[UILabel new];
    [xiangView addSubview:yuYue];
    [yuYue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(120*_mainHeight+1.5);
        make.width.mas_equalTo(70);
    }];
    yuYue.text=@"预约信息";
    yuYue.textAlignment=NSTextAlignmentCenter;
    yuYue.font=[UIFont systemFontOfSize:15];
    yuYue.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel10=[UILabel new];
    [xiangView addSubview:xianLabel10];
    [xianLabel10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(yuYue.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(yuYue);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel10.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _yuYueText=[UITextField new];
    [xiangView addSubview:_yuYueText];
    [_yuYueText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel10);
        make.left.mas_equalTo(xianLabel10.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel10);
        make.right.mas_equalTo(-5);
    }];
    _yuYueText.text=[_typeDic objectForKey:@"reservationInfo"];
    _yuYueText.font=[UIFont systemFontOfSize:15];
    _yuYueText.delegate=self;
    _yuYueText.returnKeyType=UIReturnKeyDone;
    
    
    UILabel *renShu=[UILabel new];
    [xiangView addSubview:renShu];
    [renShu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
        make.top.mas_equalTo(160*_mainHeight+1.5);
        make.width.mas_equalTo(70);
    }];
    renShu.text=@"适用人数";
    renShu.textAlignment=NSTextAlignmentCenter;
    renShu.font=[UIFont systemFontOfSize:15];
    renShu.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *xianLabel11=[UILabel new];
    [xiangView addSubview:xianLabel11];
    [xianLabel11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(renShu.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(renShu);
        make.height.mas_equalTo(_mainHeight*25);
        make.width.mas_equalTo(0.5);
    }];
    xianLabel11.backgroundColor=ColorWithRGB(200, 200, 200);
    
    _renShuText=[UITextField new];
    [xiangView addSubview:_renShuText];
    [_renShuText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianLabel11);
        make.left.mas_equalTo(xianLabel11.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(xianLabel11);
        make.right.mas_equalTo(-5);
    }];
    _renShuText.text=[NSString stringWithFormat:@"%d",[[_typeDic objectForKey:@"applicableNum"] intValue]];
    _renShuText.keyboardType=UIKeyboardTypeDecimalPad;
    _renShuText.font=[UIFont systemFontOfSize:15];
    _renShuText.delegate=self;
    _renShuText.returnKeyType=UIReturnKeyDone;
    
    
    
}
-(void)cretSelectDic:(UITapGestureRecognizer *)tap{
    [_zhuTiText resignFirstResponder];
    [_priceText resignFirstResponder];
    [_priceText2 resignFirstResponder];
    [_kuCunText resignFirstResponder];
    [_shiYongText resignFirstResponder];
    [_yuYueText resignFirstResponder];
    [_renShuText resignFirstResponder];
    
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"CTopCategory",@"code", nil];
    [ZQTools AFNGetDataUrl:@"dict/findAllDict" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _tan=[tanKuanView new];
        [self addSubview:_tan];
        [_tan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(0);
        }];
        _tan.typeArr=[responseObject objectForKey:@"rows"];
        _tan.quXiao.tag=2;
        [_tan cretView];
        [_tan.quXiao addTarget:self action:@selector(queDin:) forControlEvents:UIControlEventTouchUpInside];
        
    } anderrorBlock:nil];
    
}

-(void)creatLeiXing:(UITapGestureRecognizer *)tap{
    
    [_zhuTiText resignFirstResponder];
    [_priceText resignFirstResponder];
    [_priceText2 resignFirstResponder];
    [_kuCunText resignFirstResponder];
    [_shiYongText resignFirstResponder];
    [_yuYueText resignFirstResponder];
    [_renShuText resignFirstResponder];
    
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"积分商品",@"displayValue",@"0",@"realValue" ,nil];
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"一般商品",@"displayValue",@"1",@"realValue" ,nil];
    NSArray *typeArr=[NSArray arrayWithObjects:dic1,dic2, nil];
    _tan=[tanKuanView new];
    [self addSubview:_tan];
    [_tan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
    _tan.typeArr=typeArr;
    _tan.quXiao.tag=1;
    [_tan cretView];
    [_tan.quXiao addTarget:self action:@selector(queDin3:) forControlEvents:UIControlEventTouchUpInside];
}
-(IBAction)queDin:(UIButton *)sender{
    [_tan removeFromSuperview];
    _caiDanLabel.text=[_tan.typeDic objectForKey:@"displayValue"];
    _goodsBelongType=[_tan.typeDic objectForKey:@"realValue"];
    

}
-(IBAction)queDin3:(UIButton *)sender{
    [_tan removeFromSuperview];
    _quYuText.text=[_tan.typeDic objectForKey:@"displayValue"];
    _goodsType=[_tan.typeDic objectForKey:@"realValue"];
    
 
}
-(IBAction)queDin2:(UIButton *)sender{
    [_timeView removeFromSuperview];
    NSDate *date=_timeView.datePicker.date;
    NSTimeInterval dis = [date timeIntervalSince1970];
    _validityTime=[NSString stringWithFormat:@"%.0f", (double)dis*1000];
    _youXiaoText.text=[ZQTools changeTimeCuo:@"yyyy年MM月dd日" :_validityTime];


}
-(void)creatViewYouXiaoTime:(UITapGestureRecognizer *)tap{
    [_zhuTiText resignFirstResponder];
    [_priceText resignFirstResponder];
    [_priceText2 resignFirstResponder];
    [_kuCunText resignFirstResponder];
    [_shiYongText resignFirstResponder];
    [_yuYueText resignFirstResponder];
    [_renShuText resignFirstResponder];
    _timeView=[changYongShiJianSelect new];
    [self addSubview:_timeView];
    [_timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _timeView.quXiao.tag=3;
    [_timeView creatView];
    [_timeView.quXiao addTarget:self action:@selector(queDin2:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)creatXiangQing:(UITapGestureRecognizer *)tap{
    [_zhuTiText resignFirstResponder];
    [_priceText resignFirstResponder];
    [_priceText2 resignFirstResponder];
    [_kuCunText resignFirstResponder];
    [_shiYongText resignFirstResponder];
    [_yuYueText resignFirstResponder];
    [_renShuText resignFirstResponder];
    [_timeView removeFromSuperview];
    [_tan removeFromSuperview];

    
    _xiang=[shangPingTianJiaXiang new];
    
    [self addSubview:_xiang];
    [_xiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_xiang creatView];
    self.viewController.title=@"详情";

    self.viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(creatQueDing)];
}
-(void)creatQueDing{

    NSString *xiangStr=_xiang.fuJiaText.text;
    if ([xiangStr isEqualToString:@""]||[xiangStr isEqualToString:@"150字以内"]) {
        [ZQTools svpInfo:@"详情不能为空"];
        return;
    }
     [_xiang removeFromSuperview];
    _xiangQingText.text=_xiang.fuJiaText.text;
    _xiangQingText.textColor=ColorWithRGB(0, 0, 0);
    self.viewController.title=@"添加商品";
    if (_abc==1) {
         self.viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(creatFaBu)];
    }else{
        self.viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(creatFaBu)];
    }

}
-(void)creatFaBu{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSNumber  *idSeller=[userBasic objectForKey:@"idUserBasic"];
    NSString *title=_zhuTiText.text;
    
    NSNumber *price=[NSNumber numberWithFloat:_priceText2.text.doubleValue];
    NSNumber *discountedPrice=[NSNumber numberWithFloat:_priceText.text.doubleValue];
    NSString *detailInfo=_xiangQingText.text;
    NSNumber *goodsType=_goodsType;
    NSString *goodsTypeText=_quYuText.text;
    NSString *stateText=@"上架";
    NSString *usePeriod=_shiYongText.text;
    NSString *validityTime=[ZQTools changeTimeCuo:@"yyyy-MM-dd HH:mm:ss" :[NSString stringWithFormat:@"%@",_validityTime]];
    NSString *applicableNum=_renShuText.text;
    NSNumber *stockNum=[NSNumber numberWithInt:_kuCunText.text.intValue];
    NSString *reservationInfo=_yuYueText.text;
    NSNumber *goodsBelongType=_goodsBelongType;
    NSString *goodsBelongText=_caiDanLabel.text;
    if ([title isEqualToString:@""]) {
        [ZQTools svpInfo:@"主题不能为空"];
        return;
    }
    if ([detailInfo isEqualToString:@"150字以内"]) {
        [ZQTools svpInfo:@"详情不能为空"];
        return;
    }if ([goodsTypeText isEqualToString:@"请选择"]) {
        [ZQTools svpInfo:@"商品类型不能为空"];
        return;
    }
    if ([usePeriod isEqualToString:@""]) {
        [ZQTools svpInfo:@"商品使用时间不能为空"];
        return;
    }
    if ([validityTime isEqualToString:@""]) {
        [ZQTools svpInfo:@"商品有效时间不能为空"];
        return;
    }
    if (_abc==1) {
        if ([goodsBelongText isEqualToString:@"请选择"]) {
            [ZQTools svpInfo:@"商品菜单类型不能为空"];
            return;
        }

    }
       if (_imageview.imgArr.count==0) {
        [ZQTools svpInfo:@"商品图片不能为空"];
        return;
    }
    [ZQTools afnPostImageWithDict:nil WithAddressUrl:nil withImageArr:_imageview.imgArr withFileName:@"fdsaf" WithView:self success:^(id responseObject) {
        
        NSString *picIds=[responseObject objectForKey:@"resultId"];
        NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        [dic setObject:idSeller forKey:@"userBasicId"];
        
        [dic setObject:title forKey:@"title"];
           
        [dic setObject:@0 forKey:@"monthSellCount"];
        
        [dic setObject:price forKey:@"price"];
        
        [dic setObject:discountedPrice forKey:@"discountedPrice"];
        [dic setObject:detailInfo forKey:@"detailInfo"];
        [dic setObject:goodsType forKey:@"goodsType"];
        [dic setObject:goodsTypeText forKey:@"goodsTypeText"];
        [dic setObject:stateText forKey:@"stateText"];
        [dic setObject:validityTime forKey:@"validityTime"];
        [dic setObject:usePeriod forKey:@"usePeriod"];
        [dic setObject:reservationInfo forKey:@"reservationInfo"];
        [dic setObject:applicableNum forKey:@"applicableNum"];
        [dic setObject:picIds forKey:@"fileIds"];
        [dic setObject:stockNum forKey:@"stockNum"];
        if (_abc==1) {
            [dic setObject:goodsBelongType forKey:@"goodsBelongType"];
            [dic setObject:goodsBelongText forKey:@"goodsBelongText"];
        
        }
        if (_abc==2) {
            NSNumber *idGoods=[_typeDic objectForKey:@"idGoods"];
            [dic setObject:idGoods forKey:@"goodsId"];
        }

        if (_abc==1) {
            [ZQTools AFNGetDataUrl:@"mgoods/saveMgoods" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
                [ZQTools svpInfo:@"发布成功"];
                [self.viewController.navigationController popViewControllerAnimated:YES];
            } anderrorBlock: nil];
        }
        else{
            [ZQTools AFNGetDataUrl:@"mgoods/updateMgoods" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
                
                [ZQTools svpInfo:@"修改成功"];
                [self.viewController.navigationController popViewControllerAnimated:YES];
            } anderrorBlock: nil];
            
        }
        
    }];
    


}

-(void)textFieldDidBeginEditing:(UITextField *)textView
{
    [UIView beginAnimations:@"showKeyboardAnimation" context:nil];
    [UIView setAnimationDuration:0.30];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y- 100, self.frame.size.width, self.frame.size.height);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textView{
    [_timeView removeFromSuperview];
    [_tan removeFromSuperview];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.30];
    CGRect rect = self.frame;
    rect.origin.y += 100;
    self.frame = rect;
    [UIView commitAnimations];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
