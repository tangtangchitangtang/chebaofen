//
//  modifyLoginView.h
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BaseView.h"

@interface modifyLoginView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *oldText,*newsText,*newsText1;
@property(nonatomic,strong)NSDictionary *userDic;
-(void)creatView;

@end
