//
//  faBuQiuZhiView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "faBuQiuZhiView.h"

@implementation faBuQiuZhiView
-(void)creatView{
    
    _parentId=[_typeDic objectForKey:@"jobIndustry"];
    self.backgroundColor=_LightGrey;
    
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(0, _mainH+_mainHeight*60+1);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    _scrollView.contentOffset=CGPointMake(0,0);
    
    UIView *jibenView=[UIView new];
    [_scrollView addSubview:jibenView];
    [jibenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(240*_mainHeight+4);
    }];
    [self creatJiBenView:jibenView];
    
    UIView *lianXiView=[UIView new];
    [_scrollView addSubview:lianXiView];
    [lianXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jibenView.mas_bottom);
        make.width.mas_equalTo(_mainW);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(120*_mainHeight+1);
    }];
    [self creatLianXi:lianXiView];
    
    UIView *miaoSuView=[UIView new];
    [self addSubview:miaoSuView];
    [miaoSuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lianXiView.mas_bottom);
        make.width.mas_equalTo(_mainW);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*140);
    }];
    [self creatMiaoView:miaoSuView];
    
    UIView *xiangView=[UIView new];
    [self addSubview:xiangView];
    [xiangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(miaoSuView.mas_bottom);
        make.width.mas_equalTo(_mainW);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*160);
    }];
    [self creatXiangView:xiangView];
    
    UIButton *queDing=[UIButton new];
    [self addSubview:queDing];
    [queDing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50*_mainHeight);
    }];
    queDing.backgroundColor=_backgroundColor;
    [queDing setTitle:@"确定" forState:0];
    [queDing setTitleColor:[UIColor whiteColor] forState:0];
    [queDing addTarget:self action:@selector(creatFabu) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)creatJiBenView:(UIView *)view{
    UILabel *jiBenLabel=[UILabel new];
    [view addSubview:jiBenLabel];
    [jiBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.width.mas_equalTo(65);
    }];
    jiBenLabel.text=@"基本信息";
    jiBenLabel.textColor=ColorWithRGB(100, 100, 100);
    jiBenLabel.font=[UIFont systemFontOfSize:15];
    
    UIImageView *imgeView=[UIImageView new];
    [view addSubview:imgeView];
    [imgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(jiBenLabel.mas_centerY).mas_equalTo(-5);
        make.width.height.mas_equalTo(6);
        make.left.mas_equalTo(jiBenLabel.mas_right);
    }];
    imgeView.image=[UIImage imageNamed:@"-"];
    
    
    UIView *hangYeView=[UIView new];
    [view addSubview:hangYeView];
    [hangYeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    hangYeView.backgroundColor=[UIColor whiteColor];
    
    UILabel *yangYeLabel=[UILabel new];
    [hangYeView addSubview:yangYeLabel];
    [yangYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(jiBenLabel);
    }];
    yangYeLabel.text=@"行业";
    yangYeLabel.font=[UIFont systemFontOfSize:15];
    
    _yangYeLabel=[UILabel new];
    [hangYeView addSubview:_yangYeLabel];
    [_yangYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(200);
    }];
    _yangYeLabel.textAlignment=NSTextAlignmentRight;
    _yangYeLabel.textColor=ColorWithRGB(100, 100, 100);
    _yangYeLabel.font=[UIFont systemFontOfSize:15];
    if (_abc==1) {
        _yangYeLabel.text=@"请选择";
    }
    if (_abc==2) {
        NSString *jobIndustryText=[_typeDic objectForKey:@"jobIndustryText"];
        if ([ZQTools charIsNil:jobIndustryText]) {
            jobIndustryText=@"";
        }
        _yangYeLabel.text=jobIndustryText;
    }
    _yangYeLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cretSelectDic:)];
    [_yangYeLabel addGestureRecognizer:tapGesture];
    
    
    UIView *zhiWeiView=[UIView new];
    [view addSubview:zhiWeiView];
    [zhiWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(hangYeView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    zhiWeiView.backgroundColor=[UIColor whiteColor];
    
    UILabel *zhiWeiLable=[UILabel new];
    [zhiWeiView addSubview:zhiWeiLable];
    [zhiWeiLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(jiBenLabel);
    }];
    zhiWeiLable.text=@"职位";
    zhiWeiLable.font=[UIFont systemFontOfSize:15];
    
    _zhiWeiLabel2=[UITextField new];
    [zhiWeiView addSubview:_zhiWeiLabel2];
    [_zhiWeiLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(200);
    }];
    _zhiWeiLabel2.textAlignment=NSTextAlignmentRight;
    _zhiWeiLabel2.textColor=ColorWithRGB(100, 100, 100);
    _zhiWeiLabel2.font=[UIFont systemFontOfSize:15];
    if (_abc==1) {
        _zhiWeiLabel2.placeholder=@"请输入";
    }
    if (_abc==2) {
        _zhiWeiLabel2.text=[_typeDic objectForKey:@"positionName"];
    }
    _zhiWeiLabel2.delegate=self;
    //_zhiWeiLabel2.userInteractionEnabled=YES;
    // UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cretSelectDic2:)];
    //[_zhiWeiLabel2 addGestureRecognizer:tapGesture2];
    
    UIView *xinZhiView=[UIView new];
    [view addSubview:xinZhiView];
    [xinZhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zhiWeiView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    xinZhiView.backgroundColor=[UIColor whiteColor];
    
    UILabel *xinZhiLabel=[UILabel new];
    [xinZhiView addSubview:xinZhiLabel];
    [xinZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    xinZhiLabel.text=@"薪资";
    xinZhiLabel.font=[UIFont systemFontOfSize:15];
    
    _stopBtn=[UITextField new];
    [xinZhiView addSubview:_stopBtn];
    [_stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(_mainHeight*30);
        make.width.mas_equalTo(100);
    }];
    _stopBtn.backgroundColor=_LightGrey;
    if (_abc==1) {
        _stopBtn.placeholder=@"6000";
    }
    if (_abc==2) {
        _stopBtn.text=[NSString stringWithFormat:@"%d",[[_typeDic objectForKey:@"maxSalary"] intValue]];
    }
    _stopBtn.font=[UIFont systemFontOfSize:15];
    _stopBtn.textColor=ColorWithRGB(100, 100, 100);
    _stopBtn.delegate=self;
    _stopBtn.keyboardType=UIKeyboardTypeDecimalPad;
    _stopBtn.returnKeyType=UIReturnKeyDone;

    UILabel *xianLabel=[UILabel new];
    [xinZhiView addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(_stopBtn.mas_left).mas_equalTo(-10);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(1.5);
    }];
    xianLabel.backgroundColor=[UIColor blackColor];
    
    _startBtn=[UITextField new];
    [xinZhiView addSubview:_startBtn];
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(xianLabel.mas_left).mas_equalTo(-10);
        make.height.mas_equalTo(_mainHeight*30);
        make.width.mas_equalTo(100);
    }];
    _startBtn.backgroundColor=_LightGrey;
    if (_abc==1) {
        _startBtn.placeholder=@"6000";
    }
    if (_abc==2) {
        _startBtn.text=[NSString stringWithFormat:@"%d",[[_typeDic objectForKey:@"minSalary"] intValue]];
    }
    _startBtn.font=[UIFont systemFontOfSize:15];
    _startBtn.textColor=ColorWithRGB(100, 100, 100);
    _startBtn.keyboardType=UIKeyboardTypeDecimalPad;
    _startBtn.returnKeyType=UIReturnKeyDone;
    
    UIView *diZhiView=[UIView new];
    [view addSubview:diZhiView];
    [diZhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xinZhiView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    diZhiView.backgroundColor=[UIColor whiteColor];
    
    UILabel *diZhiLable=[UILabel new];
    [diZhiView addSubview:diZhiLable];
    [diZhiLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    diZhiLable.text=@"工作地址";
    diZhiLable.font=[UIFont systemFontOfSize:15];
    
    _diZhiText=[UITextField new];
    [diZhiView addSubview:_diZhiText];
    [_diZhiText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(250);
    }];
    _diZhiText.textAlignment=NSTextAlignmentRight;
    _diZhiText.textColor=ColorWithRGB(100, 100, 100);
    _diZhiText.font=[UIFont systemFontOfSize:14];
    if (_abc==1) {
        _diZhiText.placeholder=@"玉溪市高薪区解放一路";
    }
    if (_abc==2) {
        NSString *sellerAddr=[_typeDic objectForKey:@"sellerAddr"];
        if ([ZQTools charIsNil:sellerAddr]) {
            sellerAddr=@"";
        }
        _diZhiText.text=sellerAddr;
    }

    
    _diZhiText.delegate=self;
    
    UIView *yaoQiuView=[UIView new];
    [view addSubview:yaoQiuView];
    [yaoQiuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(diZhiView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(1);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    yaoQiuView.backgroundColor=[UIColor whiteColor];
    

    UILabel *yaoQiuLable=[UILabel new];
    [yaoQiuView addSubview:yaoQiuLable];
    [yaoQiuLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    yaoQiuLable.text=@"要求";
    yaoQiuLable.font=[UIFont systemFontOfSize:15];
    
    
    _yaoQiuText=[UILabel new];
    [yaoQiuView addSubview:_yaoQiuText];
    [_yaoQiuText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(250);
    }];
    _yaoQiuText.textAlignment=NSTextAlignmentRight;
    _yaoQiuText.textColor=ColorWithRGB(100, 100, 100);
    _yaoQiuText.font=[UIFont systemFontOfSize:14];
    
    if (_abc==1) {
         _yaoQiuText.text=@"请选择";
    }
    if (_abc==2) {
       
        _education=[_typeDic objectForKey:@"education"];
        _employNum=[NSNumber numberWithInt:[[_typeDic objectForKey:@"employNum"] intValue]];
        _workExperience=[NSNumber numberWithInt:[[_typeDic objectForKey:@"workExperience"] intValue]];
        NSString *zhuanYe=[NSString stringWithFormat:@"招%@人/%@／工作%@年",_employNum,_employNum,_workExperience];
        _yaoQiuText.text=zhuanYe;
    }

    _yaoQiuText.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatXiangQing:)];
    [_yaoQiuText addGestureRecognizer:tapGesture3];
}

-(void)creatFabu{

    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    
    NSDictionary *seller=[userDic objectForKey:@"seller"];
    NSNumber *sellerId=[seller objectForKey:@"basicUserId"];
    NSLog(@"%@",seller);
    
    NSString *positionName=_zhiWeiLabel2.text;
    NSNumber *minSalary=[NSNumber numberWithInt:_startBtn.text.intValue];
    NSNumber *maxSalary=[NSNumber numberWithInt:_stopBtn.text.intValue];
    NSString *positionDesc=_miaoSuText.text;
    NSString *phone=_phoneText.text;
    NSString *companyDesc=@"abc";
    if ([positionName isEqualToString:@""]) {
        [ZQTools svpInfo:@"职位名称不能为空"];
        return;
    }
    if (minSalary==0) {
        [ZQTools svpInfo:@"最低工资不能为空"];
        return;
    }if (maxSalary==0) {
        [ZQTools svpInfo:@"最高工资不能为空"];
        return;
    }
    if ([_yaoQiuText.text isEqualToString:@"请选择"]||[_yaoQiuText.text isEqualToString:@""]) {
        [ZQTools svpInfo:@"要求不能为空"];
        return;
    }
    if ([positionDesc isEqualToString:@""]) {
        [ZQTools svpInfo:@"职位描述不能为空"];
        return;
    }
    if ([phone isEqualToString:@""]) {
        [ZQTools svpInfo:@"联系电话不能为空"];
        return;
    }if (_expectedIndustry==0) {
        [ZQTools svpInfo:@"行业不能为空"];
        return;
    }
    
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    if (_abc==1) {
        [dic setObject:sellerId forKey:@"sellerId"];
    }
    if (_abc==2) {
        NSNumber *idEmploy=[_typeDic objectForKey:@"idEmploy"];
        [dic setObject:idEmploy forKey:@"idEmploy"];

    }
    [dic setObject:positionName forKey:@"positionName"];
    [dic setObject:minSalary forKey:@"minSalary"];
    [dic setObject:maxSalary forKey:@"maxSalary"];
    [dic setObject:_employNum forKey:@"employNum"];
    [dic setObject:_workExperience forKey:@"workExperience"];
    [dic setObject:_education forKey:@"education"];
    [dic setObject:positionDesc forKey:@"positionDesc"];
    [dic setObject:companyDesc forKey:@"companyDesc"];
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:_expectedIndustry forKey:@"jobIndustry"];
    
    if (_abc==1) {
        [ZQTools AFNGetDataUrl:@"recruit/publishRecruit" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            [ZQTools svpInfo:@"发布成功"];
            [self.viewController.navigationController popViewControllerAnimated:YES];
        } anderrorBlock:nil];
    }
    if (_abc==2) {
        [ZQTools AFNGetDataUrl:@"recruit/modifyRecruit" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            [ZQTools svpInfo:@"修改成功"];
            [self.viewController.navigationController popViewControllerAnimated:YES];
            
        } anderrorBlock:nil];
    }
   
    
    
    
    
}
-(void)creatLianXi:(UIView *)View{

    UILabel *jiBenLabel=[UILabel new];
    [View addSubview:jiBenLabel];
    [jiBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.width.mas_equalTo(65);
    }];
    jiBenLabel.text=@"联系方式";
    jiBenLabel.textColor=ColorWithRGB(100, 100, 100);
    jiBenLabel.font=[UIFont systemFontOfSize:15];
    
    UIImageView *imgeView=[UIImageView new];
    [View addSubview:imgeView];
    [imgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(jiBenLabel.mas_centerY).mas_equalTo(-5);
        make.width.height.mas_equalTo(6);
        make.left.mas_equalTo(jiBenLabel.mas_right);
    }];
    imgeView.image=[UIImage imageNamed:@"-"];
    
    UIView *lianXiView=[UIView new];
    [View addSubview:lianXiView];
    [lianXiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    lianXiView.backgroundColor=[UIColor whiteColor];
    
    UILabel *lianXiRenLabel=[UILabel new];
    [lianXiView addSubview:lianXiRenLabel];
    [lianXiRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    lianXiRenLabel.text=@"联系人";
    lianXiRenLabel.font=[UIFont systemFontOfSize:15];
    
    _nameText =[UITextField new];
    [lianXiView addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(200);
    }];
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    _nameText.textAlignment=NSTextAlignmentRight;
    _nameText.textColor=ColorWithRGB(100, 100, 100);
    _nameText.font=[UIFont systemFontOfSize:14];
    _nameText.placeholder=[userBasic objectForKey:@"nickName"];
    _nameText.delegate=self;
    _nameText.enabled=NO;

    UIView *phoneView=[UIView new];
    [View addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lianXiView.mas_bottom).mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*40);
    }];
    phoneView.backgroundColor=[UIColor whiteColor];
    
    
    UILabel *phoneLabel=[UILabel new];
    [phoneView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    phoneLabel.text=@"手机号";
    phoneLabel.font=[UIFont systemFontOfSize:15];
    
    _phoneText=[UITextField new];
    [phoneView addSubview:_phoneText];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(200);
    }];
    _phoneText.textAlignment=NSTextAlignmentRight;
    _phoneText.textColor=ColorWithRGB(100, 100, 100);
    _phoneText.font=[UIFont systemFontOfSize:14];
    if (_abc==1) {
        _phoneText.placeholder=@"18183128005";
    }
    if (_abc==2) {
        _phoneText.text=[_typeDic objectForKey:@"phone"];
    }
    
    _phoneText.keyboardType=UIKeyboardTypeDecimalPad;
    _phoneText.returnKeyType=UIReturnKeyDone;
    _phoneText.delegate=self;

    
}

-(void)creatMiaoView:(UIView *)View{
    
    UILabel *jiBenLabel=[UILabel new];
    [View addSubview:jiBenLabel];
    [jiBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.width.mas_equalTo(65);
    }];
    jiBenLabel.text=@"职位描述";
    jiBenLabel.textColor=ColorWithRGB(100, 100, 100);
    jiBenLabel.font=[UIFont systemFontOfSize:15];
    
    UIImageView *imgeView=[UIImageView new];
    [View addSubview:imgeView];
    [imgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(jiBenLabel.mas_centerY).mas_equalTo(-5);
        make.width.height.mas_equalTo(6);
        make.left.mas_equalTo(jiBenLabel.mas_right);
    }];
    imgeView.image=[UIImage imageNamed:@"-"];
    
    UIView *beijingView=[UIView new];
    [View addSubview:beijingView];
    [beijingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100*_mainHeight);
    }];
    beijingView.backgroundColor=[UIColor whiteColor];

    _miaoSuText=[UITextView new];
    [beijingView addSubview:_miaoSuText];
    [_miaoSuText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    if (_abc==1) {
        _miaoSuText.text=@"请写下对自己的评价，200字以内";

    }
    if (_abc==2) {
        _miaoSuText.text=[_typeDic objectForKey:@"positionDesc"];
    }

       _miaoSuText.textColor=ColorWithRGB(150, 150, 150);
    _miaoSuText.font=[UIFont systemFontOfSize:15];
    _miaoSuText.delegate=self;
    
   
}
-(void)creatXiangView:(UIView *)View{
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSDictionary *seller=[userDic objectForKey:@"seller"];
    
    UILabel *jiBenLabel=[UILabel new];
    [View addSubview:jiBenLabel];
    [jiBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*40);
        make.width.mas_equalTo(65);
    }];
    jiBenLabel.text=@"公司详情";
    jiBenLabel.textColor=ColorWithRGB(100, 100, 100);
    jiBenLabel.font=[UIFont systemFontOfSize:15];
    
    UIImageView *imgeView=[UIImageView new];
    [View addSubview:imgeView];
    [imgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(jiBenLabel.mas_centerY).mas_equalTo(-5);
        make.width.height.mas_equalTo(6);
        make.left.mas_equalTo(jiBenLabel.mas_right);
    }];
    imgeView.image=[UIImage imageNamed:@"-"];

    UIView *nameView=[UIView new];
    [View addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jiBenLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*90);
    }];
    nameView.backgroundColor=[UIColor whiteColor];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    nameLabel.text=[userBasic objectForKey:@"nickName"];
    nameLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];

    UILabel *xingZhiLabel=[UILabel new];
    [View addSubview:xingZhiLabel];
    [xingZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    xingZhiLabel.text=[NSString stringWithFormat:@"性质：%@",[seller objectForKey:@"sellerTypeText"]];
    xingZhiLabel.font=[UIFont systemFontOfSize:15];
    xingZhiLabel.textColor=ColorWithRGB(100, 100, 100);
    
    UILabel *hangYeLabel=[UILabel new];
    [View addSubview:hangYeLabel];
    [hangYeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xingZhiLabel.mas_bottom);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(_mainHeight*30);
    }];
    hangYeLabel.text=[NSString stringWithFormat:@"行业：%@",[seller objectForKey:@"isGovEntityText"]];
    hangYeLabel.font=[UIFont systemFontOfSize:15];
    hangYeLabel.textColor=ColorWithRGB(100, 100, 100);
    
    
    

}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请写下对自己的评价，200字以内"]) {
        textView.text=@"";
    }
    textView.textColor=ColorWithRGB(100, 100, 100);
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text=@"请写下对自己的评价，200字以内";
        textView.textColor=ColorWithRGB(150, 150, 150);
    }
    
    
}

-(void)creatXiangQing:(UITapGestureRecognizer *)tap{
     [_zhiWeiLabel2 resignFirstResponder];
     [_diZhiText resignFirstResponder];
     [_nameText resignFirstResponder];
     [_phoneText resignFirstResponder];
     [_miaoSuText resignFirstResponder];
    
    _yaoQiuView=[yaoQiuSelectView new];
    [self addSubview:_yaoQiuView];
    [_yaoQiuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_yaoQiuView creatView];
     [_yaoQiuView.quXiao addTarget:self action:@selector(queDin2:) forControlEvents:UIControlEventTouchUpInside];


}
-(IBAction)queDin2:(id)sender{
    [_yaoQiuView removeFromSuperview];
    _education=_yaoQiuView.education;
    _employNum=_yaoQiuView.employNum;
    _workExperience=_yaoQiuView.workExperience;
    if (_yaoQiuView.workExperience==0) {
          _yaoQiuText.text=[NSString stringWithFormat:@"招%@人/经验不限/%@",_yaoQiuView.employNum,_yaoQiuView.education];
    }else{
        _yaoQiuText.text=[NSString stringWithFormat:@"招%@人/%@年工作经验/%@",_yaoQiuView.employNum,_yaoQiuView.workExperience,_yaoQiuView.education];
    }
    
    
}


-(void)cretSelectDic2:(UITapGestureRecognizer *)tap{
    [_zhiWeiLabel2 resignFirstResponder];
    [_diZhiText resignFirstResponder];
    [_nameText resignFirstResponder];
    [_phoneText resignFirstResponder];
    [_miaoSuText resignFirstResponder];
    if ([_yangYeLabel.text isEqualToString:@"请选择"]) {
        [ZQTools svpInfo:@"请先选择期望行业"];
        return ;
    }
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"expectedJob",@"code",_parentId,@"parentId",@1,@"page",@100,@"rows", nil];
    
    NSLog(@"%@",dic);
    
    
    
    [ZQTools AFNGetDataUrl:@"dict/queryDictbyPage" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        NSArray *typeArr=[responseObject objectForKey:@"rows"];
        if (typeArr.count!=0) {
            _tan=[tanKuanView new];
            [self addSubview:_tan];
            [_tan mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.top.mas_equalTo(0);
            }];
            _tan.typeArr=[responseObject objectForKey:@"rows"];
            [_tan cretView];
            [_tan.quXiao addTarget:self action:@selector(queDin3:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
    } anderrorBlock:nil];
    
}

-(void)cretSelectDic:(UITapGestureRecognizer *)tap{
    
    [_zhiWeiLabel2 resignFirstResponder];
    [_diZhiText resignFirstResponder];
    [_nameText resignFirstResponder];
    [_phoneText resignFirstResponder];
    [_miaoSuText resignFirstResponder];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"expectedIndustry",@"code", nil];
    [ZQTools AFNGetDataUrl:@"dict/findAllDict" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _tan=[tanKuanView new];
        [self addSubview:_tan];
        [_tan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(0);
        }];
        _tan.typeArr=[responseObject objectForKey:@"rows"];
        [_tan cretView];
        [_tan.quXiao addTarget:self action:@selector(queDin:) forControlEvents:UIControlEventTouchUpInside];
        
    } anderrorBlock:nil];
    
}
-(IBAction)queDin3:(id)sender{
    [_tan removeFromSuperview];
    _zhiWeiLabel2.text=[_tan.typeDic objectForKey:@"displayValue"];
    _expectedFunction=[_tan.typeDic objectForKey:@"realValue"];
}


-(IBAction)queDin:(id)sender{
    [_tan removeFromSuperview];
    _yangYeLabel.text=[_tan.typeDic objectForKey:@"displayValue"];
    _expectedIndustry=[_tan.typeDic objectForKey:@"realValue"];
    _parentId=[_tan.typeDic objectForKey:@"idDict"];

}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    if ((textView.text.length - range.length + text.length) > 200)
    {
        NSString *substring = [text substringToIndex:200 - (textView.text.length - range.length)];
        NSMutableString *lastString = [textView.text mutableCopy];
        [lastString replaceCharactersInRange:range withString:substring];
        textView.text = [lastString copy];
        return NO;
    }
    else
    {
        return YES;
    }
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
