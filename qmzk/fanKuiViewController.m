
//
//  fanKuiViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/22.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "fanKuiViewController.h"
#import "fanKuiView.h"
@interface fanKuiViewController ()
@property(nonatomic,strong)fanKuiView *aView;
@end

@implementation fanKuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"意见反馈";
    _aView=[fanKuiView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
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
