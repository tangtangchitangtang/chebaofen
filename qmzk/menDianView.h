//
//  menDianView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"
#import "HHTimeView.h"
@interface menDianView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)NSNumber *longtitude,*latitude;
@property(nonatomic,strong) UIImageView *LogoImageView,*iamgeView;
@property(nonatomic,strong)NSString *businessBeginHour,*businessEndHour,*businessBeginMinute,*busiinessEndMinute;

@property(nonatomic,strong)HHTimeView *timeView;
@property(nonatomic,strong)UITextField *phoneLable;
@property(nonatomic,strong)UILabel *diZhiLabel,*timeLabel;
@property(nonatomic,strong)NSDictionary *dic;
-(void)creatView;
@end
