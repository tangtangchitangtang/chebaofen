
//
//  tanKuanView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/8.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "tanKuanView.h"

@implementation tanKuanView

-(void)cretView{
    
    _typeDic=_typeArr[0];
    
    UIView *beijingView=[UIView new];
    [self addSubview:beijingView];
    [beijingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    beijingView.backgroundColor=[UIColor whiteColor];
    
    _picker=[UIPickerView new];
    _picker.dataSource=self;
    _picker.delegate=self;
    [beijingView addSubview:_picker];
    [_picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.4);
    }];
    _picker.backgroundColor=[UIColor whiteColor];
    
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
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// 根据列提供行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _typeArr.count;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    NSDictionary *dic=_typeArr[row];
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _mainW, 44)];
    
    lab.font=[UIFont fontWithName:lab.text size:20];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.text=[dic objectForKey:@"displayValue"];
    return lab;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
     _typeDic=_typeArr[row];
    
   
}
-(IBAction)quXiao:(id)sender{

    [self removeFromSuperview];
    _typeDic=nil;
}

@end
