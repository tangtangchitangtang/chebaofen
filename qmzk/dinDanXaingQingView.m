
//
//  dinDanXaingQingView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "dinDanXaingQingView.h"
#import "duiHuanViewController.h"
#import "pingLunCell.h"
@implementation dinDanXaingQingView


-(void)creatView1{
    self.backgroundColor=_LightGrey;
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(65);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];
    UIView *xiangXiView=[UIView new];
    [self addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*265+2);
    }];
    xiangXiView.backgroundColor=[UIColor whiteColor];
    [self creatXiangXiView:xiangXiView :0];


}
-(void)creatView2{
    self.backgroundColor=_LightGrey;
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(65);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];

    UIView *xiangXiView=[UIView new];
    [self addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*265+2);
    }];
    xiangXiView.backgroundColor=[UIColor whiteColor];
   [self creatXiangXiView:xiangXiView :1];
    
    UIView *btnView=[UIView new];
    [self addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*50);
    }];
    btnView.backgroundColor=[UIColor whiteColor];
    
    UIButton *btn=[UIButton new];
    [btnView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(_mainW*0.95);
        make.height.mas_equalTo(_mainHeight*35);
    }];
    btn.layer.cornerRadius=_mainHeight*17.5;
    btn.backgroundColor=_backgroundColor;
    [btn setTitle:@"兑换" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [btn addTarget:self action:@selector(creatDuiHuan:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)creatView3{
    self.backgroundColor=_LightGrey;
    _tableView=[UITableView new];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.bottom.left.right.mas_equalTo(0);
    }];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.bounces=NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, _mainWidth, 365*_mainHeight+2)];
 
    UIView *topView=[UIView new];
    [headView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];
    
    UIView *xiangXiView=[UIView new];
    [headView addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*265+2);
    }];
    xiangXiView.backgroundColor=[UIColor whiteColor];
    [self creatXiangXiView:xiangXiView :1];
    _tableView.tableHeaderView=headView;
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(networkDidReceiveMessage:) name:@"huifu" object:nil];
    
    NSNumber *orderId=[_tableDic objectForKey:@"orderId"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:orderId ,@"orderId",@1,@"page",@10,@"rows", nil];
    
    [ZQTools AFNGetDataUrl:@"reviews/queryReviewsByThemeIdAndThemeType" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _tableArr=[responseObject objectForKey:@"rows"];
        [_tableView reloadData];
        
    } anderrorBlock:nil];
}
-(void)networkDidReceiveMessage:(NSNotification *)notification{
    NSNumber *orderId=[_tableDic objectForKey:@"orderId"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:orderId ,@"orderId",@1,@"page",@10,@"rows", nil];
    [ZQTools AFNGetDataUrl:@"reviews/queryReviewsByThemeIdAndThemeType" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _tableArr=[responseObject objectForKey:@"rows"];
        [_tableView reloadData];
        
    } anderrorBlock:nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _tableArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    pingLunCell *cell=[[pingLunCell alloc] init];
    cell.typeDic=_tableArr[indexPath.row];
    cell.viewController=self.viewController;
    [cell setFrame:CGRectMake(0, 0, _mainW, [cell cretView])];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}



-(void)creatView4{
    self.backgroundColor=_LightGrey;
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(65);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];
    
    UIView *xiangXiView=[UIView new];
    [self addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*265+2);
    }];
    xiangXiView.backgroundColor=[UIColor whiteColor];
    [self creatXiangXiView:xiangXiView :1];
    
    
    UIView *tuiKuanView=[UIView new];
    [self addSubview:tuiKuanView];
    [tuiKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangXiView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    tuiKuanView.backgroundColor=[UIColor whiteColor];
    [self creatTuiKuanYuanYin:tuiKuanView];
    
 

}

#pragma mark————————————退款中
-(void)creatView5{
    self.backgroundColor=_LightGrey;
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(65);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];
    
    UIView *xiangXiView=[UIView new];
    [self addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*265+2);
    }];
    xiangXiView.backgroundColor=[UIColor whiteColor];
    [self creatXiangXiView:xiangXiView :1];
    
    
    UIView *tuiKuanView=[UIView new];
    [self addSubview:tuiKuanView];
    [tuiKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangXiView.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    tuiKuanView.backgroundColor=[UIColor whiteColor];
    [self creatTuiKuanYuanYin:tuiKuanView];
    
    
    UIView *btnView=[UIView new];
    [self addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*50);
    }];
    btnView.backgroundColor=[UIColor whiteColor];
    
    UIButton *btn=[UIButton new];
    [btnView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(_mainW*0.95);
        make.height.mas_equalTo(_mainHeight*35);
    }];
    btn.layer.cornerRadius=_mainHeight*17.5;
    btn.backgroundColor=_backgroundColor;
    [btn setTitle:@"确认退款" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    [btn addTarget:self action:@selector(tuikuan) forControlEvents:UIControlEventTouchUpInside];
    
}



-(void)creatTopView:(UIView *)view{
    
//    NSDictionary *goodsDic=[_tableDic objectForKey:@"goods"];
    
    
    UIImageView *imageView=[UIImageView new];
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10*_mainWidth);
        make.width.height.mas_equalTo(75*_mainHeight);
    }];
    NSString *imgs=[_tableDic objectForKey:@"photo"];
    NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",_addressUrl,imgs]];
    [imageView sd_setImageWithURL:rul];
    
    UILabel *titileLabel=[UILabel new];
    [view addSubview:titileLabel];
    [titileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView);
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(_mainWidth*12);
    }];
    NSString *goodsName=[_tableDic objectForKey:@"goodsName"];
    if ([ZQTools charIsNil:goodsName]) {
        goodsName=@"";
    }
    titileLabel.text=goodsName;
    
    titileLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
    titileLabel.textColor=ColorWithRGB(10, 10, 10);
    
    UILabel *pingFenAndDiZhi=[UILabel new];
    [view addSubview:pingFenAndDiZhi];
    [pingFenAndDiZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(imageView);
        make.left.mas_equalTo(titileLabel);
        make.right.mas_equalTo(_mainWidth*-10);
    }];
    NSNumber *score=[_tableDic objectForKey:@"grade"];
    NSString *sellerAddress=[_tableDic objectForKey:@"adress"];
    if ([score isKindOfClass:[NSNull class]]||score.intValue==0) {

        pingFenAndDiZhi.text=[NSString stringWithFormat:@"暂无评分 | %@",sellerAddress];
    }
    else{
        pingFenAndDiZhi.text=[NSString stringWithFormat:@"%@分 | %@",score,sellerAddress];
    }
    pingFenAndDiZhi.font=[UIFont fontWithName:@"Helvetica" size:12];
    pingFenAndDiZhi.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *piceLabel=[UILabel new];
    [view addSubview:piceLabel];
    [piceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(imageView);
        make.left.mas_equalTo(pingFenAndDiZhi);
    }];
    NSNumber *price=[_tableDic objectForKey:@"price"];
    if ([ZQTools charIsNil:[NSString stringWithFormat:@"%@",price]]) {
        price=0;
    }
    
    piceLabel.text=[NSString stringWithFormat:@"¥%@",price];
    piceLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
    piceLabel.textColor=ColorWithRGB(255, 37, 78);
    
    
}
-(void)creatXiangXiView:(UIView *)view : (int )abc{
    UIView *xiangXiView=[UIView new];
    [view addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
    }];
    
    UILabel *xiangLabel=[UILabel new];
    [xiangXiView addSubview:xiangLabel];
    [xiangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*10);
    }];
    xiangLabel.text=@"订单明细";
    xiangLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    xiangLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *XianLabel=[UILabel new];
    [view addSubview:XianLabel];
    [XianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangXiView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    XianLabel.backgroundColor=_LightGrey;
    
    UILabel *biaoHaoLabel=[UILabel new];
    [view addSubview:biaoHaoLabel];
    [biaoHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(XianLabel.mas_bottom).mas_equalTo(_mainHeight*10);
        make.left.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    
    biaoHaoLabel.text=@"订单编号";
    biaoHaoLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    biaoHaoLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *bianHaoLabel2=[UILabel new];
    [view addSubview:bianHaoLabel2];
    [bianHaoLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(biaoHaoLabel);
        make.right.mas_equalTo(-_mainWidth*10);
    }];
    NSString *orderNum=[_tableDic objectForKey:@"morderCode"];
    if ([orderNum isKindOfClass:[NSNull class]]) {
        orderNum=@"";
    }
    bianHaoLabel2.text=[NSString stringWithFormat:@"%@",orderNum];
    bianHaoLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    bianHaoLabel2.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *timeLabel=[UILabel new];
    [view addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(biaoHaoLabel.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    timeLabel.text=@"下单时间";
    timeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    timeLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *timeLabel2=[UILabel new];
    [view addSubview:timeLabel2];
    [timeLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(timeLabel);
        make.right.mas_equalTo(-_mainWidth*10);
    }];
    NSString *createTime=[_tableDic objectForKey:@"appointmentTime"];
    if ([createTime isKindOfClass:[NSNull class]]) {
        createTime=@"";
    }
    timeLabel2.text=createTime;
    timeLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    timeLabel2.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *phoneLabel=[UILabel new];
    [view addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(timeLabel.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    phoneLabel.text=@"手机号";
    phoneLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    phoneLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *phoneLabel2=[UILabel new];
    [view addSubview:phoneLabel2];
    [phoneLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(phoneLabel);
        make.right.mas_equalTo(-_mainWidth*10);
    }];
    
        NSString *mobilePhone=[_tableDic objectForKey:@"phone"];
        if (![ZQTools charIsNil:mobilePhone]) {
            phoneLabel2.text=[ZQTools PhoneModel:mobilePhone];
        }
        else{
            phoneLabel2.text=@"";
        }
    
    phoneLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    phoneLabel2.textColor=ColorWithRGB(50, 50, 50);
    

    
    UILabel *numLabel=[UILabel new];
    [view addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneLabel2.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    numLabel.text=@"数量";
    numLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    numLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *numLabel2=[UILabel new];
    [view addSubview:numLabel2];
    [numLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(numLabel);
        make.right.mas_equalTo(-_mainWidth*10);
    }];
    NSNumber *goodsNum=[_tableDic objectForKey:@"number"];
    if ([goodsNum isKindOfClass:[NSNull class]]) {
        goodsNum=@0;
    }
    numLabel2.text=[NSString stringWithFormat:@"x%@",goodsNum];
    numLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    numLabel2.textColor=ColorWithRGB(50, 50, 50);
    
    
    UILabel *allPiceLabel=[UILabel new];
    [view addSubview:allPiceLabel];
    [allPiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(numLabel.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    allPiceLabel.text=@"总价";
    allPiceLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    allPiceLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *allPiceLabel2=[UILabel new];
    [view addSubview:allPiceLabel2];
    [allPiceLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(allPiceLabel);
        make.right.mas_equalTo(-_mainWidth*10);
    }];
    NSNumber *discountPrice=[_tableDic objectForKey:@"goodsPrice"];
 
    if ([discountPrice isKindOfClass:[NSNull class]]) {
        discountPrice=@0;
    }

    
    allPiceLabel2.text=[NSString stringWithFormat:@"¥%@",discountPrice];
    allPiceLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    allPiceLabel2.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *youHuiLabel=[UILabel new];
    [view addSubview:youHuiLabel];
    [youHuiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(allPiceLabel.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.mas_equalTo(xiangLabel);
        make.height.mas_equalTo(_mainHeight*20);
    }];
    
    youHuiLabel.text=@"积分优惠";
    youHuiLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    youHuiLabel.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *youHuiLabel2=[UILabel new];
    [view addSubview:youHuiLabel2];
    [youHuiLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(youHuiLabel);
        make.right.mas_equalTo(-_mainWidth*10);
    }];
    NSNumber *orderPrice=[_tableDic objectForKey:@"exp"];
    youHuiLabel2.text=[NSString stringWithFormat:@"¥%@",orderPrice];
    youHuiLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    youHuiLabel2.textColor=ColorWithRGB(50, 50, 50);
    
    UILabel *xianLabel2=[UILabel new];
    [view addSubview:xianLabel2];
    [xianLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(youHuiLabel.mas_bottom).mas_equalTo(_mainHeight*5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    xianLabel2.backgroundColor=_LightGrey;
    
    UIView *fuKuanView=[UIView new];
    [view addSubview:fuKuanView];
    [fuKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xianLabel2.mas_bottom).mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    
    UILabel *fuKuanLable=[UILabel new];
    [fuKuanView addSubview:fuKuanLable];
    [fuKuanLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(_mainWidth*-10);
    }];

    NSNumber *truePrice=[_tableDic objectForKey:@"truePrice"];
//    if (abc==1) {
        fuKuanLable.text=[NSString stringWithFormat:@"已付款: ¥%@",truePrice];
//    }
//    else {
//         fuKuanLable.text=[NSString stringWithFormat:@"待付款: ¥%@",orderPrice];
//    }
    
    fuKuanLable.font=[UIFont fontWithName:@"Helvetica" size:16];
    fuKuanLable.textColor=ColorWithRGB(50, 50, 50);}
-(void)creatTuiKuanYuanYin:(UIView *)view{
  
    UIView *xiangXiView=[UIView new];
    [view addSubview:xiangXiView];
    [xiangXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40*_mainHeight);
    }];
    
    UILabel *xiangLabel=[UILabel new];
    [xiangXiView addSubview:xiangLabel];
    [xiangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*10);
    }];
    xiangLabel.text=@"退款原因";
    xiangLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    xiangLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UILabel *XianLabel=[UILabel new];
    [view addSubview:XianLabel];
    [XianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangXiView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    XianLabel.backgroundColor=_LightGrey;

    _textView=[UITextView new];
    [view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xiangLabel.mas_bottom);
        make.left.mas_equalTo(_mainWidth*10);
        make.right.mas_equalTo(-_mainWidth*10);
        make.bottom.mas_equalTo(0);
    }];
    _textView.text=[_tableDic objectForKey:@"refundReason"];
    _textView.editable=NO;
    _textView.textColor=ColorWithRGB(50, 50, 50);
    xiangLabel.font=[UIFont fontWithName:@"Helvetica" size:15];

}

-(IBAction)creatDuiHuan:(id)sender{
    self.viewController.automaticallyAdjustsScrollViewInsets = false;
    duiHuanViewController *duiHuan=[duiHuanViewController alloc];
    [ZQTools pushNextViewController:self.viewController andRootController:duiHuan];
}


#pragma mark——————————退款
- (void)tuikuan
{

    [ZQTools showAlert:@"确认退款给顾客吗?" with_Controller:self.viewController with_titleArr:@[@"确定"] withShowType:0 with_Block:^(int index) {
        
        if(index==0)
        {
        
            NSString *orderId = [self.tableDic objectForKey:@"orderId"];
            
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:orderId,@"orderId", nil];
            
            [ZQTools AFNGetDataUrl:@"order/reFund" Dict:dict andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
                
                
                [ZQTools svpInfo:@"退款成功"];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:_reloadOrder object:nil];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    
                    [self.viewController.navigationController popViewControllerAnimated:YES];
                    
                });
                
            } anderrorBlock:nil];
 
        }
        
    }];


}



@end
