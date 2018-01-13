//
//  fanKuiView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/22.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface fanKuiView : BaseView<UITextViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UITextView *yiJianText;
@property(nonatomic,strong)UITextField *lianXiText;
-(void)creatView;
@end
