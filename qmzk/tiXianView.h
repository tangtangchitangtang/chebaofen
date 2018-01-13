//
//  tiXianView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface tiXianView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *keYongLabel;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)UITextField *numText;
-(void)creatView;
-(void)creatView2;
@end
