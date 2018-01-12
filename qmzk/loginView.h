//
//  loginView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface loginView : BaseView<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)UITextField *pwdText;
-(void)creatView;
@end
