
//
//  HHTimeView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/11.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "HHTimeView.h"

@implementation HHTimeView

-(void)creatView{
    NSArray *beginTimeArr=[_beginTime componentsSeparatedByString:@":"];
    NSArray *endTimArr=[_endTime componentsSeparatedByString:@":"];

    
    UIView *beijingView=[UIView new];
    [self addSubview:beijingView];
    [beijingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    beijingView.backgroundColor=[UIColor whiteColor];
    
    _nianPicker1=[UIPickerView new];
    _nianPicker1.dataSource=self;
    _nianPicker1.delegate=self;
    _nianPicker1.tag=1;
    [beijingView addSubview:_nianPicker1];
    [_nianPicker1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(_mainW/5);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _nianPicker1.backgroundColor=[UIColor whiteColor];
    
    _yuePicker1=[UIPickerView new];
    _yuePicker1.dataSource=self;
    _yuePicker1.delegate=self;
    _yuePicker1.tag=2;
    [beijingView addSubview:_yuePicker1];
    [_yuePicker1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nianPicker1.mas_right);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(_mainW/5);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _yuePicker1.backgroundColor=[UIColor whiteColor];
    
    UILabel*xianLabel=[UILabel new];
    [beijingView addSubview:xianLabel];
    [xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(10);
    }];
    xianLabel.backgroundColor=[UIColor blackColor];
    
    
    _yuePicker2=[UIPickerView new];
    _yuePicker2.dataSource=self;
    _yuePicker2.delegate=self;
    _yuePicker2.tag=4;
    [beijingView addSubview:_yuePicker2];
    [_yuePicker2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(_mainW/5);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _yuePicker2.backgroundColor=[UIColor whiteColor];
    
    _nianPicker2=[UIPickerView new];
    _nianPicker2.dataSource=self;
    _nianPicker2.delegate=self;
    _nianPicker2.tag=3;
    [beijingView addSubview:_nianPicker2];
    [_nianPicker2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_yuePicker2.mas_left);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(_mainW/5);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _nianPicker2.backgroundColor=[UIColor whiteColor];
    
    int select1=[beginTimeArr[0] intValue];
    int select2=[beginTimeArr[1] intValue];
    int select3=[endTimArr[0] intValue];
    int select4=[endTimArr[1] intValue];
    
    _nianStr1=beginTimeArr[0];
    _yueStr1=beginTimeArr[1];
    _nianStr2=endTimArr[0];
    _yueStr2=endTimArr[1];
    
    [_nianPicker1 selectRow:select1  inComponent:0 animated:YES];
    [_yuePicker1 selectRow:select2  inComponent:0 animated:YES];
    [_nianPicker2 selectRow:select3  inComponent:0 animated:YES];
    [_yuePicker2 selectRow:select4  inComponent:0 animated:YES];



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
}- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// 根据列提供行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
        return 24;
    }
    if (pickerView.tag==2) {
        return 60;
    }
    if (pickerView.tag==3) {
        return 24;
    }
    if (pickerView.tag==4) {
        return 60;
    }
    return 0;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _mainW/5, 44)];
    
    lab.font=[UIFont fontWithName:lab.text size:20];
    lab.textAlignment=NSTextAlignmentCenter;
    if (row<10) {
        lab.text=[NSString stringWithFormat:@"0%d",(int)row];
    }else{
        lab.text=[NSString stringWithFormat:@"%d",(int)row];
    }
    
    
    return lab;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (pickerView.tag==1) {
        if (row<10) {
            _nianStr1=[NSString stringWithFormat:@"0%d",(int)row];
        }else{
            _nianStr1=[NSString stringWithFormat:@"%d",(int)row];
        }
    }
    if (pickerView.tag==2) {
        if (row<10) {
            _yueStr1=[NSString stringWithFormat:@"0%d",(int)row];
        }else{
            _yueStr1=[NSString stringWithFormat:@"%d",(int)row];
        }

    }
    if (pickerView.tag==3) {
        if (row<10) {
            _nianStr2=[NSString stringWithFormat:@"0%d",(int)row];
        }else{
            _nianStr2=[NSString stringWithFormat:@"%d",(int)row];
        }
    }
    if (pickerView.tag==4) {
        if (row<10) {
            _yueStr2=[NSString stringWithFormat:@"0%d",(int)row];
        }else{
            _yueStr2=[NSString stringWithFormat:@"%d",(int)row];
        }

    }
    
    
}
-(IBAction)quXiao:(id)sender{
    
    [self removeFromSuperview];
}

@end
