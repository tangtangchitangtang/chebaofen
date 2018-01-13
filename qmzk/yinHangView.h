//
//  yinHangView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface yinHangView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,strong)BaseTableView *tableView;
-(void)creatView;
@end
