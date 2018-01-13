//
//  gengXinViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/22.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "gengXinViewController.h"
#import "gengXingView.h"

@interface gengXinViewController ()
@property(nonatomic,strong)gengXingView *aView;
@end

@implementation gengXinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"版本更新";
    _aView=[gengXingView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
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
