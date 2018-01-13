//
//  AppDelegate.m
//  qmzk
//
//  Created by Mac on 2017/5/23.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "loginViewController.h"
#import "shouYeViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
@interface AppDelegate ()<UIApplicationDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
#pragma mark——————————————百度推送
    
    // iOS10 下需要使用新的 API
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
//#ifdef NSFoundationVersionNumber_iOS_9_x_Max
//        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
//        
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound + UNAuthorizationOptionBadge)
//                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
//                                  // Enable or disable features based on authorization.
//                                  if (granted) {
//                                      [application registerForRemoteNotifications];
//                                  }
//                              }];
//#endif
//    }
//    else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
//        UIUserNotificationType myTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
//        
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:myTypes categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    }else {
//        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound;
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
//    }
//    
//    
//    
//    
//    // 在 App 启动时注册百度云推送服务，需要提供 Apikey
//    
//    [BPush registerChannel:launchOptions apiKey:_BDpushKey pushMode:BPushModeDevelopment withFirstAction:@"打开" withSecondAction:@"关闭" withCategory:nil useBehaviorTextInput:YES isDebug:YES];
//    
//    
//    
//    
//    
//    BMKMapManager *mapManager = [[BMKMapManager alloc]init];
//    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
//    [mapManager start:@"lckv4MaRkDAIHAr2Okw1vbb7T39GYTq5"  generalDelegate:nil];
//    
//    
//    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
//    if (dic==nil) {
//        loginViewController *wodeView=[[loginViewController alloc] init];
//        UINavigationController *nav1= [[UINavigationController alloc] initWithRootViewController:wodeView];
//        self.window.rootViewController=nav1;
//    }
//    else{
//        shouYeViewController *wodeView=[[shouYeViewController alloc] init];
//        UINavigationController *nav1= [[UINavigationController alloc] initWithRootViewController:wodeView];
//        self.window.rootViewController=nav1;
//    }

    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
