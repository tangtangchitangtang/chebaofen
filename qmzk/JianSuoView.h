//
//  JianSuoView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/18.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface JianSuoView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)BaseTableView *allTabelView;
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,assign)int total;
@property(nonatomic,assign) int page;
-(void)creatView;
@end
