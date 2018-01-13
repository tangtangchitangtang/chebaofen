//
//  DingDanView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface DingDanView : BaseView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *allBtn,*daiFuBtn,*duiHuanBtn;
@property(nonatomic,strong)UIView *allLabel,*daiFuLabel,*duiHuanLabel;
@property(nonatomic,strong)BaseTableView *allTabelView,*daiFuTableView,*duiHuanTabkeView;
@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,assign)int abc;

@property(nonatomic,strong)NSMutableArray *tableArr1,*tableArr2,*tableArr3;

@property(nonatomic,assign)NSNumber *total1,*total2,*total3;
@property(nonatomic,assign) int page1,page2,page3;

-(void)creatView;
@end
