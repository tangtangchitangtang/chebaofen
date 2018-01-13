//
//  shouCangViewCell.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface shouCangViewCell : BaseTableViewCell
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)UIButton *shanChuBtn;
-(void)creatView;

@end
