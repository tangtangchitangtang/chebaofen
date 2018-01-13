
//
//  duiHuanViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "duiHuanViewController.h"
#import "duiHuanView.h"
@interface duiHuanViewController ()
@property(nonatomic,strong)duiHuanView *aView;

@end

@implementation duiHuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.navigationBar.hidden=NO;
    self.title=@"兑换";

    _aView=[duiHuanView new];
    _aView.viewController = self;
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.abc=_abc;
    [_aView creatView];
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
