//
//  changYongShiJianSelect.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/13.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "changYongShiJianSelect.h"

@implementation changYongShiJianSelect
-(void)creatView{
    UIView *beijingView=[UIView new];
    [self addSubview:beijingView];
    [beijingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    beijingView.backgroundColor=[UIColor whiteColor];
    
    _datePicker=[UIDatePicker new];
    [beijingView addSubview:_datePicker];
    [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文
    _datePicker.locale = locale;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:+3];//设置最大时间为：当前时间推后50年
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [comps setYear:0];//设置最小时间为：当前时间前推18年
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [_datePicker setMaximumDate:maxDate];
    [_datePicker setMinimumDate:minDate];


    UIButton *queDing=[UIButton new];
    [beijingView addSubview:queDing];
    [queDing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(50);
    }];
    [queDing setTitle:@"取消" forState:UIControlStateNormal];
    queDing.titleLabel.font=[UIFont systemFontOfSize:22];
    [queDing setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [queDing addTarget:self action:@selector(quXiao:) forControlEvents:UIControlEventAllEvents];
    
    _quXiao=[UIButton new];
    [beijingView addSubview:_quXiao];
    [_quXiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.mas_equalTo(queDing);
        make.right.mas_equalTo(-10);
    }];
    _quXiao.tag=3;
    [_quXiao setTitle:@"确定" forState:UIControlStateNormal];
    _quXiao.titleLabel.font=[UIFont systemFontOfSize:22];
    [_quXiao setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}
    
-(IBAction)quXiao:(id)sender{
    
    [self removeFromSuperview];
}

@end
