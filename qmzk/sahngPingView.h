//
//  sahngPingView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface sahngPingView : BaseView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *allBtn,*chuShouBtn,*xiaJiaBtn;
@property(nonatomic,strong)UIView *allLabel,*chuShouLabel,*xiaJiaLabel;
@property(nonatomic,strong)UITableView *allTabelView,*chuShouTableView,*xiaJiaTabkeView;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)NSMutableArray *tableArr1,*tableArr2,*tableArr3;
@property(nonatomic,assign)int total1,total2,total3;
@property(nonatomic,assign) int page1,page2,page3;
-(void)creatView;
@end
