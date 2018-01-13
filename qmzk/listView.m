//
//  listView.m
//  qmzk
//
//  Created by 浪尖渝力 on 2018/1/10.
//  Copyright © 2018年 www.fuyuan.qmzk. All rights reserved.
//

#import "listView.h"
#import "listTableViewCell.h"
@implementation listView

-(void)creatView{
    _tabView=[BaseTableView new];
    [self addSubview:_tabView];
    [_tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(64);
    }];
    _tabView.delegate=self;
    _tabView.dataSource=self;
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
    listTableViewCell *cell=[[listTableViewCell alloc] init];
    
    
    cell.dic=_tableArr[indexPath.row];
   
    [cell setFrame:CGRectMake(0, 0, _mainW, [cell creatView])];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
@end
