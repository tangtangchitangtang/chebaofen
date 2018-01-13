//
//  tongYongCell.h
//  yiyou
//
//  Created by tangtangchitangtang on 2017/8/9.
//  Copyright © 2017年 tangtangchitangtang. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface tongYongCell : BaseTableViewCell
@property(nonatomic,strong)UIViewController *viewController; 
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,assign)NSInteger index;

-(CGFloat)creatView;

@end
