//
//  zhaoPingView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface zhaoPingView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,assign)int total;
@property(nonatomic,assign) int page;
@property(nonatomic,strong)BaseTableView *tableView;
-(void)creatView;
@end
