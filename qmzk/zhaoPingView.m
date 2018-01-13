
//
//  zhaoPingView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "zhaoPingView.h"
#import "zhaoPingCell.h"
#import "chaKanViewController.h"
@implementation zhaoPingView

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
    zhaoPingCell *cell=[[zhaoPingCell alloc] init];
    cell.typeDic=_tableArr[indexPath.row];
    [cell creatView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *idEmploy=[_tableArr[indexPath.row] objectForKey:@"idEmploy"];
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *seller=[userDic objectForKey:@"seller"];
    NSNumber *sellerId=[seller objectForKey:@"idSeller"];

    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idEmploy,@"idEmploy",sellerId,@"currentUserId", nil];
    [ZQTools AFNGetDataUrl:@"recruit/queryRecruitDetail" Dict:dic andTableView:_tableView andView:self andSuccessBlock:^(id responseObject) {
        chaKanViewController *chaKan=[[chaKanViewController alloc] init];
        chaKan.typeDic=responseObject;
        [ZQTools pushNextViewController:self.viewController andRootController:chaKan];
    } anderrorBlock:nil];
   
}

@end
