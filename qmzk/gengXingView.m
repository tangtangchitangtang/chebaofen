
//
//  gengXingView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/22.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "gengXingView.h"

@implementation gengXingView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    UIImageView *logImageView=[UIImageView new];
    [self addSubview:logImageView];
    [logImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64+_mainHeight*30);
        make.centerX.mas_equalTo(0);
        make.height.width.mas_equalTo(_mainWidth*100);
    }];
    logImageView.backgroundColor=[UIColor orangeColor];
    
    UILabel *banBenLabel=[UILabel new];
    [self addSubview:banBenLabel];
    [banBenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logImageView.mas_bottom).mas_equalTo(_mainHeight*10);
        make.centerX.mas_equalTo(0);
    }];
    banBenLabel.text=@"当前版本 V1.0.0";
    banBenLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    banBenLabel.textColor=ColorWithRGB(150, 150, 150);
    
    UIView *banBenView=[UIView new];
    [self addSubview:banBenView];
    [banBenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(banBenLabel.mas_bottom).mas_equalTo(30*_mainHeight);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(45*_mainHeight);
    }];
    banBenView.backgroundColor=[UIColor whiteColor];
    
    UILabel *label=[UILabel new];
    [banBenView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(_mainWidth*10);
    }];
    label.text=@"当前已是最新版本";
    label.font=[UIFont fontWithName:@"Helvetica" size:14];
    label.textColor=ColorWithRGB(50, 50, 50);
    
    UIImageView *jianTouIamgeView=[UIImageView new];
    [banBenView addSubview:jianTouIamgeView];
    [jianTouIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-_mainWidth*5);
        make.width.mas_equalTo(_mainWidth*25);
        make.height.mas_equalTo(_mainHeight*25);
    }];
    jianTouIamgeView.image=[UIImage imageNamed:@"矩形-16-拷贝-5"];
    
    
    UILabel *allDingDanLabel=[UILabel new];
    [banBenView addSubview:allDingDanLabel];
    [allDingDanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(jianTouIamgeView.mas_left);
    }];
    allDingDanLabel.text=@"去更新";
    allDingDanLabel.textColor=ColorWithRGB(150, 150, 150);
    allDingDanLabel.font=[UIFont systemFontOfSize:14];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(genXin:)];
    [banBenView addGestureRecognizer:tapGesture];
    
}
-(void)genXin:(UITapGestureRecognizer *)tap{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1.0.0.0",@"versionNum",@1,@"flag", nil];
    [ZQTools AFNGetDataUrl:@"common/updateApp" Dict:dict andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
        NSString *data=responseObject;
        if (![ZQTools charIsNil:data]) {
            _iosUrl=data;
            NSString *titlStr=@"当前版本号1.0.0.0，前往更新";
            [self alertTitle:titlStr];
        }
       
    } anderrorBlock:nil];
    
   

}
- (void)alertTitle:(NSString *)str{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"问答有新的版本发布" message:str preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    
    //添加确定到UIAlertController中
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:OKAction];
    
    [self.viewController presentViewController:alertController animated:YES completion:nil];
}

@end
