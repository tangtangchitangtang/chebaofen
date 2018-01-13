//
//  dinDanXaingQingView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface dinDanXaingQingView : BaseView<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *tableArr;
@property(nonatomic,strong)NSDictionary *tableDic;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITextView *textView;
-(void)creatView1;
-(void)creatView2;
-(void)creatView3;
-(void)creatView4;
#pragma mark————————————退款中
-(void)creatView5;



@end
