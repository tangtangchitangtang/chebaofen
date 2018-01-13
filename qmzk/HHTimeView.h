//
//  HHTimeView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/11.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface HHTimeView : BaseView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSString *beginTime,*endTime;
@property(nonatomic,strong)UIPickerView *nianPicker1,*yuePicker1,*nianPicker2,*yuePicker2;
@property(nonatomic,strong)UIButton *quXiao;
@property(nonatomic,strong)NSString *nianStr1,*nianStr2,*yueStr1,*yueStr2;
-(void)creatView;
@end
