//
//  yaoQiuSelectView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/13.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "yaoQiuSelectView.h"

@implementation yaoQiuSelectView

-(void)creatView{
    _employNum=@1;
    _workExperience=@0;
    _education=@"不限";
    
    _typeArr=[NSArray arrayWithObjects:@"不限",@"高中及以下",@"大专",@"本科",@"研究生及以上", nil];
    
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
        make.width.mas_equalTo(_mainW/4);
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
        make.width.mas_equalTo(_mainW/4);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _yuePicker1.backgroundColor=[UIColor whiteColor];
    
   
    

    _nianPicker2=[UIPickerView new];
    _nianPicker2.dataSource=self;
    _nianPicker2.delegate=self;
    _nianPicker2.tag=3;
    [beijingView addSubview:_nianPicker2];
    [_nianPicker2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_yuePicker1.mas_right);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(_mainW/2);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _nianPicker2.backgroundColor=[UIColor whiteColor];   
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
        return 1000;
    }
    if (pickerView.tag==2) {
        return 20;
    }
    if (pickerView.tag==3) {
        return _typeArr.count;
    }
    
    return 0;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _mainW/3, 44)];
    
    lab.font=[UIFont fontWithName:lab.text size:17];

    if (pickerView.tag==1) {
        lab.textAlignment=NSTextAlignmentCenter;
        lab.text=[NSString stringWithFormat:@"%d人",(int)row+1];
    }
    if (pickerView.tag==2) {
        lab.textAlignment=NSTextAlignmentCenter;
        if (row==0) {
             lab.text=[NSString stringWithFormat:@"不限"];
        }else{
             lab.text=[NSString stringWithFormat:@"%d年",(int)row];
        }
    }
    if (pickerView.tag==3) {
        lab.textAlignment=NSTextAlignmentLeft;

        lab.text=_typeArr[row];
    }
    
    return lab;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (pickerView.tag==1) {
        _employNum=[NSNumber numberWithInteger:row+1];
    }
    if (pickerView.tag==2) {
        _workExperience=[NSNumber numberWithInteger:row];
    }
    if (pickerView.tag==3) {
        _education=_typeArr[row];
    }
   
    
    
}
-(IBAction)quXiao:(id)sender{
    
    [self removeFromSuperview];
}


@end
