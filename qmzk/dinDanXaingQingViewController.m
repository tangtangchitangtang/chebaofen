

//
//  dinDanXaingQingViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "dinDanXaingQingViewController.h"
#import "dinDanXaingQingView.h"

@interface dinDanXaingQingViewController ()
@property(nonatomic,strong)dinDanXaingQingView *aView;

@end

@implementation dinDanXaingQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _aView=[dinDanXaingQingView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.mas_equalTo(0);
    }];
    _aView.tableDic=_dic;
//    if (_abc==1) {
        [_aView creatView1];
//    }
//    if (_abc==2) {
//        [_aView creatView2];
//    }
//    if (_abc==3||_abc==4) {
//        [_aView creatView3];
//    }
//    if ( _abc==5) {
//        [_aView creatView5];
//    }
//    if ( _abc==6) {
//        [_aView creatView4];
//    }
    _aView.viewController=self;
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"订单详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)popVc
{
     [self.navigationController popViewControllerAnimated:YES];
}
@end
