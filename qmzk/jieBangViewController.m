//
//  jieBangViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/20.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "jieBangViewController.h"
#import "jieBangView.h"
@interface jieBangViewController ()
@property(nonatomic,strong)jieBangView *aView;
@end

@implementation jieBangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"银行卡";
    
    _aView=[jieBangView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.dci=_dic;
    [_aView creatView];
    _aView.viewController=self;;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
