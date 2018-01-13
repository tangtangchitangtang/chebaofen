//
//  listView.h
//  qmzk
//
//  Created by 浪尖渝力 on 2018/1/10.
//  Copyright © 2018年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface listView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,strong)BaseTableView *tabView;
-(void)creatView;

@end
