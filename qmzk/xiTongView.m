
//
//  xiTongView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/18.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "xiTongView.h"
#import "xiTongCell.h"
@implementation xiTongView

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
    xiTongCell *cell=[[xiTongCell alloc] init];
    cell.tableDic=_tableArr[indexPath.row];
     [cell setFrame:CGRectMake(0, 0, _mainW, [cell creawtView])];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


@end
