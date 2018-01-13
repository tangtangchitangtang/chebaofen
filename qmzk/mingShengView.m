
//
//  mingShengView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "mingShengView.h"
#import "shouCangViewCell.h"
#import "MeingShengXiangViewController.h"
@implementation mingShengView
-(void)creatView{
    _tabeView=[BaseTableView new];
    [self addSubview:_tabeView];
    [_tabeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _page=@1;
    _tabeView.delegate=self;
    _tabeView.dataSource=self;
    
    _tableArr=[NSMutableArray arrayWithCapacity:0];
    [self creatLogin];
  
}
-(void)creatLogin{
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rows],@"rows",_page, @"page",idUserBasic,@"userId",nil];
    
    [ZQTools AFNGetDataUrl:@"government/queryGovernmentByCondition" Dict:dict andTableView:nil andView:self andSuccessBlock:^(id responseObject){
        NSArray *typeArr=[responseObject objectForKey:@"rows"];
        [_tableArr addObjectsFromArray:typeArr];
        _total=[responseObject objectForKey:@"total"];
        [_tabeView reloadData];
        if (_rows*_page.intValue<_total.intValue) {
            _tabeView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                _page=[NSNumber numberWithInt:_page.intValue+1];
                [self creatLogin];
            }];
        }
        else{
            _tabeView.mj_footer.hidden=YES;
        }
        
        
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
    shouCangViewCell *cell=[[shouCangViewCell alloc] init];
    cell.abc=(int)indexPath.row;
    cell.dic=_tableArr[indexPath.row];
    [cell creatView];
    [cell.shanChuBtn addTarget:self action:@selector(shanChuBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic=_tableArr[indexPath.row];
    NSNumber *aid=[dic objectForKey:@"id"];
    MeingShengXiangViewController *viewCon=[[MeingShengXiangViewController alloc]init];
    viewCon.titileID=aid;
    [ZQTools pushNextViewController:self.viewController andRootController:viewCon];



}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(IBAction)shanChuBtn:(UIButton *)sender{
    NSDictionary *dic=_tableArr[sender.tag];
    NSNumber *aid=[dic objectForKey:@"id"];
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:aid, @"id",nil];
    [ZQTools AFNGetDataUrl:@"government/removeGovernment" Dict:dict andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        [self.tableArr removeObjectAtIndex:sender.tag];
        [self.tabeView reloadData];
    } anderrorBlock:nil];


}

@end
