//
//  commentView.h
//  qmzk
//
//  Created by 浪尖渝力 on 2018/1/11.
//  Copyright © 2018年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface commentView : BaseView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)BaseTableView *tableView;
@property(nonatomic,strong)NSNumber *totalPages;
@property(nonatomic,strong)NSMutableArray *tableArr;
-(void)creatView;
@end
