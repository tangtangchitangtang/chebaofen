//
//  guanLiView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface guanLiView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *allBtn,*chuShouBtn,*xiaJiaBtn;
@property(nonatomic,strong)UIView *allLabel,*chuShouLabel,*xiaJiaLabel;
@property(nonatomic,strong)UITableView *allTabelView,*chuShouTableView,*xiaJiaTabkeView;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,assign)int abc;
-(void)creatView;
@end
