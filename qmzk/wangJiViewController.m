
//
//  wangJiViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "wangJiViewController.h"
#import "loginViewController.h"
#import "wangJiView.h"
@interface wangJiViewController ()
@property(nonatomic,strong)NSString *base,*phoneStr;
@property(nonatomic,strong)wangJiView *aView;


@end

@implementation wangJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"忘记密码";
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(popVc)];
    
    _aView=[wangJiView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    [_aView.baoCunBtn addTarget:self action:@selector(xiaYiBuBtn:) forControlEvents:UIControlEventTouchUpInside];
    _aView.viewController=self;
}
-(IBAction)xiaYiBuBtn:(UIButton *)sender{
    
    _phoneStr=_aView.phoneText.text;
    NSString *codeStr=_aView.yanZhengText.text;
    
    if ([_phoneStr isEqualToString:@""]||![ZQTools phoneValiMobile:_phoneStr]) {
        [ZQTools svpInfo:@"手机号错误"];
        return;
    }
    if ([codeStr isEqualToString:@""]) {
        [ZQTools svpInfo:@"验证码不能为空"];
        return;
    }
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:_phoneStr,@"phone",codeStr,@"smscode", nil];
    [ZQTools AFNGetDataUrl:@"userBasic/updatePasswordBySMS" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        NSLog(@"%@",responseObject);
        _base=responseObject;
        NSArray *subViews = [_aView subviews];
        if([subViews count] != 0) {
            [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
        self.title=@"确认密码";
        [_aView creatView2];
        [_aView.queRen addTarget:self action:@selector(quRenBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    } anderrorBlock:nil];
    
    
}
-(IBAction)quRenBtn:(UIButton *)sender{
    
    NSString *pwdStr1=_aView.pwdText.text;
    NSString *pwdStr2=_aView.pwdText2.text;
    if ([pwdStr1 isEqualToString:@""]||[pwdStr2 isEqualToString:@""]) {
        [ZQTools svpInfo:@"密码不能为空"];
        return;
    }
    if (![pwdStr1 isEqualToString:pwdStr2]) {
        [ZQTools svpInfo:@"两次输入的密码不一致"];
        return;
    }
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:pwdStr1,@"newPassword",pwdStr2,@"confirmPassword",_phoneStr,@"phone",_base,@"base", nil];
    [ZQTools AFNGetDataUrl:@"userBasic/updatePassword" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        NSFileManager *defaultManager = [NSFileManager defaultManager];
        if ([defaultManager removeItemAtPath:_userModelFile error:nil]) {
            loginViewController *login=[[loginViewController alloc] init];
            [ZQTools pushNextViewController:self andRootController:login];
        }
        
        
    } anderrorBlock:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
