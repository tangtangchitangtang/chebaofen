//
//  Toast.h
//  Toast
//
//  Created by 李立 on 16/6/22.
//  Copyright © 2016年 李立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Toast : UIWindow

/**
 *  创建一个Toast
 *
 *  @return 返回当前toast
 */
+ (instancetype)toast;

/**
 *  显示toast
 *
 *  @param text 需要显示的文字
 */
- (void)makeText:(NSString *)text;



@end
