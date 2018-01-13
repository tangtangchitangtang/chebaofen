//
//  mingShengView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mingShengView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSNumber *page,*total;
@property(nonatomic,strong)NSMutableArray *tableArr;
@property(nonatomic,strong)BaseTableView *tabeView;
-(void)creatView;
@end
