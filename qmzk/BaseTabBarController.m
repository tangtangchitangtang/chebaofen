//
//  BaseTabBarController.m
//  jiedian
//
//  Created by 美街美店 on 16/5/5.
//  Copyright © 2016年 com.jiedian.www. All rights reserved.
//

#import "BaseTabBarController.h"


@interface BaseTabBarController ()


@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化item 点击后的效果
//    NSArray *arrImages = @[@"tab_homepage_btn_false",@"tab_daren_btn_false",@"tab_activity_btn_false",@"tab_mine_btn_false"];
//    
//    NSArray *arrSelectedImage=[[NSArray alloc]initWithObjects:@"tab_homepage_btn_true",@"tab_daren_btn_true",@"tab_activity_btn_true",@"tab_mine_btn_true",nil];

    
//    self.tabbarView.frame    = self.tabBar.bounds;
//    self.tabbarView.tabBarVc = self;
//    [self.tabBar addSubview:self.tabbarView];
//    
 
 
    
}






- (BaseTabBarView *)tabbarView
{
    if(_tabbarView==nil)
    {
        _tabbarView = [BaseTabBarView addBaseTabBarView];
    }
    
  return   _tabbarView;
}

@end
