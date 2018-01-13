
//
//  mingMiView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "mingMiView.h"
#import "mingXiCell.h"
#import "dinDanXaingQingViewController.h"
@implementation mingMiView

-(void)creatView{
    _tableView=[BaseTableView new];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _tableView.delegate=self;
    _tableView.dataSource=self;


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
    NSDictionary *tyoeDic=_tableArr[indexPath.row];
    mingXiCell *cell=[[mingXiCell alloc] init];
    cell.dic=tyoeDic;
   [cell creatView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary *typeDic=_tableArr[indexPath.row];

    NSNumber *orderId=[typeDic objectForKey:@"morderId"];
    
    int businessType=[[typeDic objectForKey:@"availMoney"] intValue];
    if (businessType==1||businessType==3) {
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:orderId,@"orderId", nil];
        [ZQTools AFNGetDataUrl:@"upkeep/redeem" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            dinDanXaingQingViewController *xiangQing=[[dinDanXaingQingViewController alloc] init];
            xiangQing.dic=responseObject;
            [ZQTools pushNextViewController:self.viewController andRootController:xiangQing];
            
        } anderrorBlock:nil];
    }
    
    
    
    
    
    
    
}

#pragma mark - 补全分隔线左侧缺失
- (void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
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
