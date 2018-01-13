//
//  userViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "userViewController.h"
#import "userView.h"
@interface userViewController ()
@property(nonnull,strong)userView *aView;
@end

@implementation userViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _aView=[userView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"账户安全";

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
