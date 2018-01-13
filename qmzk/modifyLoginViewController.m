//
//  modifyLoginViewController.m
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "modifyLoginViewController.h"
#import "modifyLoginView.h"
@interface modifyLoginViewController ()
@property(nonatomic,strong)modifyLoginView *aView;
@end

@implementation modifyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"修改登录密码";
    _aView=[modifyLoginView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;
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
