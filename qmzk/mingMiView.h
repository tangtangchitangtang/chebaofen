//
//  mingMiView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface mingMiView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,assign)int page,total;
@property(nonatomic,strong)BaseTableView *tableView;
-(void)creatView;
@end
