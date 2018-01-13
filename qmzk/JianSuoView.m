//
//  JianSuoView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/18.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "JianSuoView.h"
#import "dingDangCell.h"
#import "dinDanXaingQingViewController.h"
@implementation JianSuoView

-(void)creatView{
    _allTabelView =[BaseTableView new];
    [self addSubview:_allTabelView];
    [_allTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _allTabelView.delegate=self;
    _allTabelView.dataSource=self;

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
    dingDangCell *cell=[[dingDangCell alloc] init];
    cell.tableDic=_tableArr[indexPath.row];
    [cell creatView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary *typeDic=_tableArr[indexPath.row];

    NSNumber *orderId=[typeDic objectForKey:@"orderId"];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:orderId,@"orderId", nil];
    [ZQTools AFNGetDataUrl:@"order/queryOrderDetail" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
        NSNumber *orderState=[responseObject objectForKey:@"orderState"];
        
        
        dinDanXaingQingViewController *xiangQing=[[dinDanXaingQingViewController alloc] init];
        xiangQing.dic=responseObject;
        xiangQing.abc=orderState.intValue;
        [ZQTools pushNextViewController:self.viewController andRootController:xiangQing];
        
    } anderrorBlock:nil];
    
    
    
    
}

@end
