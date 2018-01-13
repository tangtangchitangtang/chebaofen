//
//  SameCityAddHeaderView.h
//  qmzk
//
//  Created by Mac on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface SameCityAddHeaderView : BaseView


@property (nonatomic,strong)UIViewController *inVc;     //所在vc


@property (nonatomic,strong)NSMutableArray *imgArr;     //图片数组

+ (instancetype)addSameCityAddHeaderView;               //初始化

@end
