//
//  wangJiView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface wangJiView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *phoneText;
@property(nonatomic,strong)UITextField *yanZhengText;
@property(nonatomic,strong)UITextField *pwdText,*pwdText2;
@property(nonatomic,strong)UIButton *yanZhenMaBtn;
@property(nonatomic,assign)int timeTick;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UIButton *baoCunBtn,*queRen;

-(void)creatView;
-(void)creatView2;
@end
