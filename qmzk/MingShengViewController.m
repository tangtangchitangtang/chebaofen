
//
//  MingShengViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "MingShengViewController.h"
#import "mingShengView.h"
#import "AddLifeCircle.h" //发布界面

@interface MingShengViewController ()
@property(nonatomic,strong)mingShengView *aView;

@end

@implementation MingShengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(creatFaBu:)];
    self.title=@"政务民生";
    _aView=[mingShengView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;

}
-(IBAction)creatFaBu:(id)sender{

    AddLifeCircle *vc = [ZQTools addVc_vcClassName:@"AddLifeCircle"];
    vc.type  = 3;
    [ZQTools pushNextViewController:self andRootController:vc];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
