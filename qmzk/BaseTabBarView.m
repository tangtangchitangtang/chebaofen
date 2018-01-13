//
//  BaseTabBarView.m
//  GCW
//
//  Created by Mac on 2017/2/20.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "BaseTabBarView.h"

 

@interface BaseTabBarView ()



@end


@implementation BaseTabBarView


#pragma mark——————————————————初始化
+ (instancetype)addBaseTabBarView
{
    BaseTabBarView *view = [[[NSBundle mainBundle]loadNibNamed:@"BaseTabBarView" owner:nil options:nil] lastObject];
    
    
    //默认选中首页
   
 
    
    return view;

}






-  (void)setTabBarVc:(UITabBarController *)tabBarVc
{

    _tabBarVc = tabBarVc;
}

 

@end
