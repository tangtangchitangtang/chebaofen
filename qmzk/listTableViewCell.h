//
//  listTableViewCell.h
//  qmzk
//
//  Created by 浪尖渝力 on 2018/1/10.
//  Copyright © 2018年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface listTableViewCell : BaseTableViewCell
@property(nonatomic,strong)NSDictionary *dic;
-(float)creatView;
@end
