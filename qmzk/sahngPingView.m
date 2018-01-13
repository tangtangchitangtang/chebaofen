
//
//  sahngPingView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "sahngPingView.h"
#import "shangPingCell.h"
#import "shangPingXiangQingViewController.h"
@implementation sahngPingView

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
        make.centerX.mas_equalTo(-_mainW/10*3);
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
    
    _chuShouBtn=[UILabel new];
    [topView addSubview:_chuShouBtn];
    [_chuShouBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];
    _chuShouBtn.text=@"出售中";
    _chuShouBtn.font=[UIFont fontWithName:@"Helvetica" size:15];
    _chuShouBtn.userInteractionEnabled=YES;
    _chuShouBtn.tag=2;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_chuShouBtn addGestureRecognizer:tapGesture2];
    
    
    _chuShouLabel=[UIView new];
    [topView addSubview:_chuShouLabel];
    [_chuShouLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-_mainHeight*4);
        make.centerX.mas_equalTo(_chuShouBtn);
        make.height.width.mas_equalTo(5);
    }];
    _chuShouLabel.layer.cornerRadius=2.5;
    
    
    _xiaJiaBtn=[UILabel new];
    [topView addSubview:_xiaJiaBtn];
    [_xiaJiaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_mainW/10*3);
    }];
    _xiaJiaBtn.text=@"已下架";
    _xiaJiaBtn.font=[UIFont fontWithName:@"Helvetica" size:15];
    _xiaJiaBtn.tag=3;
    _xiaJiaBtn.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_xiaJiaBtn addGestureRecognizer:tapGesture3];
    
    _xiaJiaLabel=[UIView new];
    [topView addSubview:_xiaJiaLabel];
    [_xiaJiaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-_mainHeight*4);
        make.centerX.mas_equalTo(_xiaJiaBtn);
        make.height.width.mas_equalTo(5);
    }];
    _xiaJiaLabel.layer.cornerRadius=2.5;
    
   
    
    
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(_mainHeight*6);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(_mainW*3, 0);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces = NO;
    _scrollView.delegate=self;
    _scrollView.tag=10;
    
    
    _allTabelView=[UITableView new];
    [_scrollView addSubview:_allTabelView];
    [_allTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-64-52*_mainHeight);
    }];
    _allTabelView.tag=1;
    _allTabelView.delegate=self;
    _allTabelView.dataSource=self;
    
    _chuShouTableView=[UITableView new];
    [_scrollView addSubview:_chuShouTableView];
    [_chuShouTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-64-52*_mainHeight);
    }];
    _chuShouTableView.tag=2;
    _chuShouTableView.delegate=self;
    _chuShouTableView.dataSource=self;
    
    _xiaJiaTabkeView=[UITableView new];
    [_scrollView addSubview:_xiaJiaTabkeView];
    [_xiaJiaTabkeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW*2);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-64-52*_mainHeight);
    }];
    _xiaJiaTabkeView.tag=3;
    _xiaJiaTabkeView.delegate=self;
    _xiaJiaTabkeView.dataSource=self;
    
    
   
    _allLabel.backgroundColor=_backgroundColor;
    _chuShouLabel.backgroundColor=_backgroundColor;
    _xiaJiaLabel.backgroundColor=_backgroundColor;
    if (_abc==1) {
        _abc=1;
        
        _scrollView.contentOffset=CGPointMake(0, 0);
        _allBtn.textColor=_backgroundColor;
        _chuShouBtn.textColor=ColorWithRGB(50, 50, 50);
        _xiaJiaBtn.textColor=ColorWithRGB(50, 50, 50);
      
        _allLabel.hidden=NO;
        _chuShouLabel.hidden=YES;
        _xiaJiaLabel.hidden=YES;
        
    }
    if (_abc==2) {
        _abc=2;
        _scrollView.contentOffset=CGPointMake(_mainW, 0);
        
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _chuShouBtn.textColor=_backgroundColor;
        _xiaJiaBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=YES;
        _chuShouLabel.hidden=NO;
        _xiaJiaLabel.hidden=YES;
    }
    if (_abc==3) {
        _abc=3;
        _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _chuShouBtn.textColor=ColorWithRGB(50, 50, 50);
        _xiaJiaBtn.textColor=_backgroundColor;
        _allLabel.hidden=YES;
        _chuShouLabel.hidden=YES;
        _xiaJiaLabel.hidden=NO;
        
    }
        
    
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
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    shangPingCell *cell=[[shangPingCell alloc] init];
    
    if (tableView.tag==1) {
        cell.typeDic=_tableArr1[indexPath.row];
    }else if (tableView.tag==2) {
        cell.typeDic=_tableArr2[indexPath.row];
    }else if (tableView.tag==3) {
        cell.typeDic=_tableArr3[indexPath.row];
    }
    [cell creatView];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
    NSNumber *idGoods=[typeDic objectForKey:@"idGoods"];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idGoods,@"goodsId", nil];
    [ZQTools AFNGetDataUrl:@"mgoods/findAllMgoodsDetail" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
        
        shangPingXiangQingViewController *xiangQing=[[shangPingXiangQingViewController alloc] init]; 
        xiangQing.typeDic=responseObject;
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
            _chuShouBtn.textColor=ColorWithRGB(50, 50, 50);
            _xiaJiaBtn.textColor=ColorWithRGB(50, 50, 50);
            
            _allLabel.hidden=NO;
            _chuShouLabel.hidden=YES;
            _xiaJiaLabel.hidden=YES;
            
        }
        if (pages==1) {
            _abc=2;
            _allBtn.textColor=ColorWithRGB(50, 50, 50);
            _chuShouBtn.textColor=_backgroundColor;
            _xiaJiaBtn.textColor=ColorWithRGB(50, 50, 50);
            
            _allLabel.hidden=YES;
            _chuShouLabel.hidden=NO;
            _xiaJiaLabel.hidden=YES;
        }
        if (pages==2) {
            _abc=3;
            _allBtn.textColor=ColorWithRGB(50, 50, 50);
            _chuShouBtn.textColor=ColorWithRGB(50, 50, 50);
            _xiaJiaBtn.textColor=_backgroundColor;
            _allLabel.hidden=YES;
            _chuShouLabel.hidden=YES;
            _xiaJiaLabel.hidden=NO;
            
        }
        
    }
}


-(void)selectZhuangTai:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag==1) {
        _abc=1;
        
        _scrollView.contentOffset=CGPointMake(0, 0);
        _allBtn.textColor=_backgroundColor;
        _chuShouBtn.textColor=ColorWithRGB(50, 50, 50);
        _xiaJiaBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=NO;
        _chuShouLabel.hidden=YES;
        _xiaJiaLabel.hidden=YES;
        
    }
    if (tap.view.tag==2) {
        _abc=2;
        _scrollView.contentOffset=CGPointMake(_mainW, 0);
        
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _chuShouBtn.textColor=_backgroundColor;
        _xiaJiaBtn.textColor=ColorWithRGB(50, 50, 50);
        
        _allLabel.hidden=YES;
        _chuShouLabel.hidden=NO;
        _xiaJiaLabel.hidden=YES;
    }
    if (tap.view.tag==3) {
        _abc=3;
        _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
        _allBtn.textColor=ColorWithRGB(50, 50, 50);
        _chuShouBtn.textColor=ColorWithRGB(50, 50, 50);
        _xiaJiaBtn.textColor=_backgroundColor;
        _allLabel.hidden=YES;
        _chuShouLabel.hidden=YES;
        _xiaJiaLabel.hidden=NO;
        
    }
    [self LoginDic1];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag==10) {
        [self LoginDic1];
        
    }
}
-(void)LoginDic1{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSNumber *idSeller=[userBasic objectForKey:@"idUserBasic"];
    
    if (_abc==1) {
        if (_tableArr1.count!=0) {
            return;
        }
        NSNumber * page =  [NSNumber numberWithInt:_page1];
        NSNumber * rows =  [NSNumber numberWithInt:_rows];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",idSeller,@"userBasicId",nil];

        [ZQTools AFNGetDataUrl:@"mgoods/findAllMgoods" Dict:dic andTableView:_allTabelView andView:self andSuccessBlock:^(id responseObject) {
            
            NSArray *typeArr=[responseObject objectForKey:@"rows"];
            [_tableArr1 addObjectsFromArray:typeArr];
            _total1=[[responseObject objectForKey:@"total"] intValue];
            [_allTabelView reloadData];
            int rowsInt=rows.intValue;
            if (rowsInt*_page1<_total1) {
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
        if (_tableArr2.count!=0) {
            return;
        }
        NSNumber * page =  [NSNumber numberWithInt:_page2];
        NSNumber * rows =  [NSNumber numberWithInt:_rows];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",@0,@"state",idSeller,@"userBasicId",nil];
        [ZQTools AFNGetDataUrl:@"mgoods/findAllMgoods" Dict:dic andTableView:_chuShouTableView andView:self andSuccessBlock:^(id responseObject) {
            
            NSArray *typeArr=[responseObject objectForKey:@"rows"];
            [_tableArr2 addObjectsFromArray:typeArr];
            _total2=[[responseObject objectForKey:@"total"] intValue];
            [_chuShouTableView reloadData];
            int rowsInt=rows.intValue;
            if (rowsInt*_page2<_total2) {
                _chuShouTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _page2+=1;
                    [self LoginDic1];
                }];
            }
            else{
                _chuShouTableView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
    }
    if (_abc==3) {
        if (_tableArr3.count!=0) {
            return;
        }
        NSNumber * page =  [NSNumber numberWithInt:_page3];
        NSNumber * rows =  [NSNumber numberWithInt:_rows];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",@1,@"state",idSeller,@"userBasicId",nil];
        
        [ZQTools AFNGetDataUrl:@"mgoods/findAllMgoods" Dict:dic andTableView:_xiaJiaTabkeView andView:self andSuccessBlock:^(id responseObject) {
            
            NSArray *typeArr=[responseObject objectForKey:@"rows"];
            [_tableArr3 addObjectsFromArray:typeArr];
            _total3=[[responseObject objectForKey:@"total"] intValue];
            [_xiaJiaTabkeView reloadData];
            int rowsInt=rows.intValue;
            if (rowsInt*_page3<_total3) {
                _xiaJiaTabkeView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _page3+=1;
                    [self LoginDic1];
                }];
            }
            else{
                _xiaJiaTabkeView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
    }
}


#pragma mark - 补全分隔线左侧缺失
- (void)viewDidLayoutSubviews {
    if ([self.allTabelView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.allTabelView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.allTabelView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.allTabelView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([self.chuShouTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.chuShouTableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.chuShouTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.chuShouTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    if ([self.xiaJiaTabkeView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.xiaJiaTabkeView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.xiaJiaTabkeView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.xiaJiaTabkeView setLayoutMargins:UIEdgeInsetsZero];
    }

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}



@end
