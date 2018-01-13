//
//  loginViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "loginViewController.h"
#import "loginView.h"
@interface loginViewController ()

@property(nonatomic,strong)loginView *aView;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    _aView=[loginView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
