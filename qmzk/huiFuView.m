//
//  huiFuView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/20.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "huiFuView.h"

@implementation huiFuView
-(void)creastView{

    UIView *beijingView=[UIView new];
    [self addSubview:beijingView];
    [beijingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(0);
    }];
    beijingView.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.3];
    
    UIView *BaiSeview=[UIView new];
    [beijingView addSubview:BaiSeview];
    [BaiSeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100*_mainHeight);
    }];
    BaiSeview.backgroundColor=[UIColor whiteColor];
    
    
    _textView=[UITextView new];
    [BaiSeview addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*_mainHeight);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(_mainHeight*80);
    }];
    _textView.text=@"写入评论";
    _textView.delegate=self;
    _textView.backgroundColor=ColorWithRGB(220, 220, 220);
    _textView.returnKeyType=UIReturnKeyDone;
    _textView.font=[UIFont systemFontOfSize:15];
    
    UIView *view=[UIView new];
    [beijingView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(BaiSeview.mas_top);
    }];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shangChuView)];
    [view addGestureRecognizer:tapGesture];
    
//    [_textView becomeFirstResponder];
//    [_textView resignFirstResponder];
    
    //监听当键盘将要出现时
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //监听当键将要退出时
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];


}

-(IBAction)creatHuiFu:(id)sender{
   
   
    NSNumber *morderId=[_dic objectForKey:@"morderId"];
    NSString *answerContent=_textView.text;
    if ([answerContent isEqualToString:@"输入评论"]) {
        [ZQTools svpInfo:@"评论不能为空"];
        return;
    }
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:morderId,@"morderId",answerContent,@"sellerSay", nil];
    
    [ZQTools AFNPOSTDataUrl:@"seller/sellerSay" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
        NSMutableArray *tableArr=[NSMutableArray arrayWithCapacity:0];
        
        NSArray *arr= [NSKeyedUnarchiver unarchiveObjectWithFile:_userYouJiFile];
        
        [tableArr addObjectsFromArray:arr];
        [tableArr replaceObjectAtIndex:_index withObject:responseObject];
        [NSKeyedArchiver archiveRootObject:tableArr toFile:_userYouJiFile];
        
        NSNotification * notice = [NSNotification notificationWithName:@"dianZan" object:nil userInfo:nil];
        
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:notice];
        [self removeFromSuperview];
    } anderrorBlock:nil];
    
    
}

-(void)shangChuView{
    [self removeFromSuperview];
}
//当键盘出现
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    int height = keyboardRect.size.height;
    
    [UIView beginAnimations:@"showKeyboardAnimation" context:nil];
    [UIView setAnimationDuration:0.30];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y- height, self.frame.size.width, self.frame.size.height);
    [UIView commitAnimations];
    
}

//当键退出
- (void)keyboardWillHide:(NSNotification *)notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    int height = keyboardRect.size.height;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.30];
    CGRect rect = self.frame;
    rect.origin.y += height;
    self.frame = rect;
    [UIView commitAnimations];
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"写入评论"]) {
        textView.text=@"";
    }
    textView.textColor=ColorWithRGB(50, 50, 50);
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text=@"写入评论";
    }
    textView.textColor=ColorWithRGB(150, 150, 150);
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        
        [_textView resignFirstResponder];        //在这里做你响应return键的代码
        [self creatHuiFu:nil];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    if ((textView.text.length - range.length + text.length) > 200)
    {
        NSString *substring = [text substringToIndex:200 - (textView.text.length - range.length)];
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
