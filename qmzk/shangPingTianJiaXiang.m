//
//  shangPingTianJiaXiang.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/12.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shangPingTianJiaXiang.h"

@implementation shangPingTianJiaXiang
-(void)creatView{
    
    self.backgroundColor=_LightGrey;
    
    UIView *nameView=[UIView new];
    [self addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(_mainHeight*200);
    }];
    
    _fuJiaText=[UITextView new];
    [nameView addSubview:_fuJiaText];
    [_fuJiaText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(0);
    }];
    _fuJiaText.tag=2;
    _fuJiaText.text=@"150字以内";
    _fuJiaText.font=[UIFont fontWithName:@"Helvetica" size:15];
    _fuJiaText.textColor=ColorWithRGB(150, 150, 150);
    _fuJiaText.delegate=self;

}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if (textView.tag==1) {
        if ([textView.text isEqualToString:@"请写下对自己的评价，200字以内"]) {
            textView.text=@"";
        }
        textView.textColor=ColorWithRGB(50, 50, 50);
    }
    
    if (textView.tag==2) {
        if ([textView.text isEqualToString:@"150字以内"]) {
            textView.text=@"";
        }
        textView.textColor=ColorWithRGB(50, 50, 50);
    }
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.tag==1) {
        if ([textView.text isEqualToString:@""]) {
            textView.text=@"150字以内";
        }
        textView.textColor=ColorWithRGB(150, 150, 150);
    }
    if (textView.tag==2) {
        if ([textView.text isEqualToString:@""]) {
            textView.text=@"擅长技能、获奖项、技能资格证书明目。200字以内";
        }
        textView.textColor=ColorWithRGB(150, 150, 150);
    }
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    if ((textView.text.length - range.length + text.length) > 150)
    {
        NSString *substring = [text substringToIndex:150 - (textView.text.length - range.length)];
        NSMutableString *lastString = [textView.text mutableCopy];
        [lastString replaceCharactersInRange:range withString:substring];
        textView.text = [lastString copy];
        return NO;
    }
    else
    {
        return YES;
    }
}

@end
