//
//  guanLiViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "guanLiViewController.h"
#import "guanLiView.h"
@interface guanLiViewController ()
@property(nonatomic,strong)guanLiView *aView;
@end

@implementation guanLiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"评论";
    
    _aView=[guanLiView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    _aView.abc=1;
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
