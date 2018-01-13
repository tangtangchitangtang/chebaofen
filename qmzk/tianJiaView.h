//
//  tianJiaView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface tianJiaView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)UITextField *numText;
@property(nonatomic,strong)UITextField *phoneText;
@property(nonatomic,strong)UITextField *yanZhengText;
@property(nonatomic,strong)UIButton *yanZhenMaBtn;
@property(nonatomic,assign)int timeTick;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign) int abc;
-(void)creatView;
@end
