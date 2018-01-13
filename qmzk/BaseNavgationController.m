//
//  BaseNavgationController.m
//  jiedian
//
//  Created by 美街美店 on 16/5/5.
//  Copyright © 2016年 com.jiedian.www. All rights reserved.
//

#import "BaseNavgationController.h"


@interface BaseNavgationController ()

@end

@implementation BaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置navgition取消半透明效果
//    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = _navColor;
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear: animated];
//    
//    
//    if([self.restorationIdentifier isEqualToString:@"danceTeamNav"])
//    {
//    
//        
//        
//        if(self.viewControllers.count<=2)
//        {
//        
//            
//            //进入舞队
//            BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
//            
//            [tab.tabbarView danceTeamButtonClick:tab.tabbarView.danceTeamButton];
//        
//        }
//        
//
//        
//    }
//
//
//}
@end
