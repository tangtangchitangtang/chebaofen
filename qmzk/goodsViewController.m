//
//  goodsViewController.m
//  qmzk
//
//  Created by 浪尖渝力 on 2018/1/10.
//  Copyright © 2018年 www.fuyuan.qmzk. All rights reserved.
//

#import "goodsViewController.h"
#import "goodsView.h"

@interface goodsViewController ()
@property(nonatomic,strong)goodsView *aView;
@end

@implementation goodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"商品余数";
    _aView=[goodsView new];
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
