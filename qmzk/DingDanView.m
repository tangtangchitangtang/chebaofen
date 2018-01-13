//
//  DingDanView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "DingDanView.h"
#import "dinDanXaingQingViewController.h"
#import "duiHuanViewController.h"
#import "dingDangCell.h"
@implementation DingDanView
-(void)creatView{
    self.backgroundColor=_LightGrey;
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*45);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    _allBtn=[UILabel new];
    [topView addSubview:_allBtn];
    [_allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(-_mainW/4);
    }];
    _allBtn.text=@"全部";
    _allBtn.font=[UIFont fontWithName:@"Helvetica" size:15 ];
    
    _allBtn.userInteractionEnabled=YES;
    _allBtn.tag=1;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_allBtn addGestureRecognizer:tapGesture];
    
    _allLabel=[UIView new];
    [topView addSubview:_allLabel];
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_mainHeight*-4);
        make.centerX.mas_equalTo(_allBtn);
        make.height.width.mas_equalTo(5);
    }];
    _allLabel.layer.cornerRadius=2.5;
    
    _daiFuBtn=[UILabel new];
    [topView addSubview:_daiFuBtn];
    [_daiFuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];
    _daiFuBtn.text=@"待付款";
    _daiFuBtn.font=[UIFont fontWithName:@"Helvetica" size:15];
    _daiFuBtn.userInteractionEnabled=YES;
    _daiFuBtn.tag=2;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_daiFuBtn addGestureRecognizer:tapGesture2];
    
    
    _daiFuLabel=[UIView new];
    [topView addSubview:_daiFuLabel];
    [_daiFuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-_mainHeight*4);
        make.centerX.mas_equalTo(_daiFuBtn);
        make.height.width.mas_equalTo(5);
    }];
    _daiFuLabel.layer.cornerRadius=2.5;

    
    _duiHuanBtn=[UILabel new];
    [topView addSubview:_duiHuanBtn];
    [_duiHuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_mainW/4);
    }];
    _duiHuanBtn.text=@"已完成";
    _duiHuanBtn.font=[UIFont fontWithName:@"Helvetica" size:15];
    _duiHuanBtn.tag=3;
    _duiHuanBtn.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_duiHuanBtn addGestureRecognizer:tapGesture3];
    
    _duiHuanLabel=[UIView new];
    [topView addSubview:_duiHuanLabel];
    [_duiHuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-_mainHeight*4);
        make.centerX.mas_equalTo(_duiHuanBtn);
        make.height.width.mas_equalTo(5);
    }];
    _duiHuanLabel.layer.cornerRadius=2.5;

    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*6);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-_mainHeight*53);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(_mainW*3, 0);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces = NO;
    _scrollView.delegate=self;
    _scrollView.tag=10;

    
    _allTabelView=[BaseTableView new];
    [_scrollView addSubview:_allTabelView];
    [_allTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-64-102*_mainHeight);
    }];
    _allTabelView.tag=1;
    _allTabelView.delegate=self;
    _allTabelView.dataSource=self;
    
    _daiFuTableView=[BaseTableView new];
    [_scrollView addSubview:_daiFuTableView];
    [_daiFuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-64-102*_mainHeight);
    }];
    _daiFuTableView.tag=2;
    _daiFuTableView.delegate=self;
    _daiFuTableView.dataSource=self;
    
    _duiHuanTabkeView=[BaseTableView new];
    [_scrollView addSubview:_duiHuanTabkeView];
    [_duiHuanTabkeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW*2);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-64-102*_mainHeight);
    }];
    _duiHuanTabkeView.tag=3;
    _duiHuanTabkeView.delegate=self;
    _duiHuanTabkeView.dataSource=self;
    
    

    
     _allLabel.backgroundColor=_backgroundColor;
     _daiFuLabel.backgroundColor=_backgroundColor;
     _duiHuanLabel.backgroundColor=_backgroundColor;
    
    if (_abc==1) {
        _abc=1;
        
        _scrollView.contentOffset=CGPointMake(0, 0);
        _allBtn.textColor=_backgroundColor;
        _daiFuBtn.textColor=ColorWithRGB(50, 50, 50);
        _duiHuanBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=NO;
        _daiFuLabel.hidden=YES;
        _duiHuanLabel.hidden=YES;

    }
    if (_abc==2) {
        _abc=2;
        _scrollView.contentOffset=CGPointMake(_mainW, 0);
        
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _daiFuBtn.textColor=_backgroundColor;
        _duiHuanBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=YES;
        _daiFuLabel.hidden=NO;
        _duiHuanLabel.hidden=YES;
    }
    if (_abc==3) {
         _abc=3;
        _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _daiFuBtn.textColor=ColorWithRGB(50, 50, 50);
        _duiHuanBtn.textColor=_backgroundColor;
        _allLabel.hidden=YES;
        _daiFuLabel.hidden=YES;
        _duiHuanLabel.hidden=NO;
        
    }

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if (tableView.tag==1) {
        return _tableArr1.count;
    }else if (tableView.tag==2) {
        return _tableArr2.count;
    }else if (tableView.tag==3) {
        return _tableArr3.count;
//    }else if (tableView.tag==4) {
//        return _tableArr4.count;
//    }else if (tableView.tag==5) {
//        return _tableArr5.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    dingDangCell *cell=[[dingDangCell alloc] init];

    if (tableView.tag==1) {
        cell.tableDic=_tableArr1[indexPath.row];
    }else if (tableView.tag==2) {
        cell.tableDic=_tableArr2[indexPath.row];
    }else if (tableView.tag==3) {
        cell.tableDic=_tableArr3[indexPath.row];
    }

    [cell creatView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    NSDictionary *typeDic;
    
    
    if (tableView.tag==1) {
        typeDic=_tableArr1[indexPath.row];
    }else if (tableView.tag==2) {
        typeDic=_tableArr2[indexPath.row];
    }else if (tableView.tag==3) {
        typeDic=_tableArr3[indexPath.row];
    }
    NSNumber *orderId=[typeDic objectForKey:@"morderId"];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:orderId,@"orderId", nil];
    [ZQTools AFNGetDataUrl:@"upkeep/redeem" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
        NSNumber *orderState=[responseObject objectForKey:@"orderState"];
        
        
        dinDanXaingQingViewController *xiangQing=[[dinDanXaingQingViewController alloc] init];
        xiangQing.dic=responseObject;
        [ZQTools pushNextViewController:self.viewController andRootController:xiangQing];
        
    } anderrorBlock:nil];
        
    


}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag==10) {
        
        CGPoint points=scrollView.contentOffset;
        int pages=points.x/_mainW;
        if (pages==0) {
            _abc=1;
            _allBtn.textColor=_backgroundColor;
            _daiFuBtn.textColor=ColorWithRGB(50, 50, 50);
            _duiHuanBtn.textColor=ColorWithRGB(50, 50, 50);
            
            _allLabel.hidden=NO;
            _daiFuLabel.hidden=YES;
            _duiHuanLabel.hidden=YES;
            
        }
        if (pages==1) {
            _abc=2;
            _allBtn.textColor=ColorWithRGB(50, 50, 50);
            _daiFuBtn.textColor=_backgroundColor;
            _duiHuanBtn.textColor=ColorWithRGB(50, 50, 50);
            
            _allLabel.hidden=YES;
            _daiFuLabel.hidden=NO;
            _duiHuanLabel.hidden=YES;
        }
        if (pages==2) {
            _abc=3;
            _allBtn.textColor=ColorWithRGB(50, 50, 50);
            _daiFuBtn.textColor=ColorWithRGB(50, 50, 50);
            _duiHuanBtn.textColor=_backgroundColor;
            _allLabel.hidden=YES;
            _daiFuLabel.hidden=YES;
            _duiHuanLabel.hidden=NO;
            
        }


    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag==10) {
        [self LoginDic1];
        
    }
    
    
}

-(void)selectZhuangTai:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag==1) {
        _abc=1;
        
        _scrollView.contentOffset=CGPointMake(0, 0);
        _allBtn.textColor=_backgroundColor;
        _daiFuBtn.textColor=ColorWithRGB(50, 50, 50);
        _duiHuanBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=NO;
        _daiFuLabel.hidden=YES;
        _duiHuanLabel.hidden=YES;
        
    }
    if (tap.view.tag==2) {
        _abc=2;
        _scrollView.contentOffset=CGPointMake(_mainW, 0);
        
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _daiFuBtn.textColor=_backgroundColor;
        _duiHuanBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=YES;
        _daiFuLabel.hidden=NO;
        _duiHuanLabel.hidden=YES;
    }
    if (tap.view.tag==3) {
        _abc=3;
        _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _daiFuBtn.textColor=ColorWithRGB(50, 50, 50);
        _duiHuanBtn.textColor=_backgroundColor;
        _allLabel.hidden=YES;
        _daiFuLabel.hidden=YES;
        _duiHuanLabel.hidden=NO;
        
    }

     [self LoginDic1];
}


-(void)LoginDic1{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *sellerId=[userDic objectForKey:@"sellerId"];
    if (_abc==1) {
        if (_tableArr1.count!=0&&_page1==0) {
            return;
        }
        NSNumber * page =  [NSNumber numberWithInt:_page1];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:page,@"page",sellerId,@"sellerId",@1,@"state",nil];
        
        [ZQTools AFNGetDataUrl:@"seller/orderList" Dict:dic andTableView:_allTabelView andView:self andSuccessBlock:^(id responseObject) {
            
            NSArray *typeArr=[responseObject objectForKey:@"content"];
            [_tableArr1 addObjectsFromArray:typeArr];
            _total1=[responseObject objectForKey:@"totalPages"];

            [_allTabelView reloadData];
            if (_page1<_total1.integerValue) {
                _allTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _page1+=1;
                    [self LoginDic1];
                }];
            }
            else{
                _allTabelView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
    }
    if (_abc==2) {
        if (_tableArr2.count!=0&&_page2==0) {
            return;
        }
        NSNumber * page =  [NSNumber numberWithInt:_page2];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:page,@"page",sellerId,@"sellerId",@2,@"state",nil];
        
        [ZQTools AFNGetDataUrl:@"seller/orderList" Dict:dic andTableView:_allTabelView andView:self andSuccessBlock:^(id responseObject) {
            
             NSArray *typeArr=[responseObject objectForKey:@"content"];
            [_tableArr2 addObjectsFromArray:typeArr];
            _total2=[responseObject objectForKey:@"totalPages"];
            [_daiFuTableView reloadData];
            if (_page2<_total2.intValue) {
                _daiFuTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _page2+=1;
                    [self LoginDic1];
                }];
            }
            else{
                _daiFuTableView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
        
        
    }
    if (_abc==3) {
        if (_tableArr3.count!=0&&_page3==0) {
            return;
        }
        NSNumber * page =  [NSNumber numberWithInt:_page2];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:page,@"page",sellerId,@"sellerId",@3,@"state",nil];
        
        [ZQTools AFNGetDataUrl:@"seller/orderList" Dict:dic andTableView:_allTabelView andView:self andSuccessBlock:^(id responseObject) {
            
             NSArray *typeArr=[responseObject objectForKey:@"content"];
            [_tableArr3 addObjectsFromArray:typeArr];
            _total3=[responseObject objectForKey:@"totalPages"];

            [_duiHuanTabkeView reloadData];
            if (_page3<_total3.intValue) {
                _duiHuanTabkeView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _page3+=1;
                    [self LoginDic1];
                }];
            }
            else{
                _duiHuanTabkeView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
    }

}

-(IBAction)creatDuiHuan:(id)sender{
    duiHuanViewController *duiHuan=[duiHuanViewController alloc];
    [ZQTools pushNextViewController:self.viewController andRootController:duiHuan];
}

@end
