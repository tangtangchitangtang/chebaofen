//
//  yaoQiuSelectView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/13.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface yaoQiuSelectView : BaseView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSArray *typeArr;
@property(nonatomic,strong)UIPickerView *nianPicker1,*yuePicker1,*nianPicker2;
@property(nonatomic,strong)UIButton *quXiao;
@property(nonatomic,strong)NSNumber *employNum,*workExperience;
@property(nonatomic,strong)NSString *education;
-(void)creatView;
@end
