//
//  chaKanView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface chaKanView : BaseView
@property(nonatomic,strong)NSDictionary *typeDic;
@property(nonatomic,strong) UIScrollView *scrollView;
-(void)creatView;
@end
