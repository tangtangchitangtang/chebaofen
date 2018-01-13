//
//  duiHuanView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface duiHuanView : BaseView<UITextFieldDelegate>
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)UITextField *duiHuanTextView;
-(void)creatView;
@end
