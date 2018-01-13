//
//  dingDangCell.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface dingDangCell : BaseTableViewCell
@property(nonatomic,strong)NSDictionary *tableDic;
@property(nonatomic,assign)int abc;
-(void)creatView;

@end
