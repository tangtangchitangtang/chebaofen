//
//  BaseTabBarController.h
//  jiedian
//
//  Created by 美街美店 on 16/5/5.
//  Copyright © 2016年 com.jiedian.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabBarView.h" //自定义的tabbar
@interface BaseTabBarController : UITabBarController
#pragma mark——————————刷新未读消息
- (void)getUserNolookMassge;

@property (nonatomic,strong)BaseTabBarView *tabbarView;;

@end
