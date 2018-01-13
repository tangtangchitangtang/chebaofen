//
//  BaseTabBarView.h
//  GCW
//
//  Created by Mac on 2017/2/20.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "BaseView.h"
#import "ImageCenterButton.h"

@interface BaseTabBarView : BaseView



 


#pragma mark——————————————————初始化
+ (instancetype)addBaseTabBarView;


//传入tabbarvc  用于点击事件
@property (nonatomic,strong)UITabBarController *tabBarVc;

 

@end
