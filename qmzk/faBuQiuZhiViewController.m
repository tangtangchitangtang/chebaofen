
//
//  faBuQiuZhiViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "faBuQiuZhiViewController.h"
#import "faBuQiuZhiView.h"

@interface faBuQiuZhiViewController ()
@property(nonatomic,strong)faBuQiuZhiView *aView;

@end

@implementation faBuQiuZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"我的发布";
    
    _aView=[faBuQiuZhiView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.typeDic=_dic;
    _aView.abc=_abc;
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
