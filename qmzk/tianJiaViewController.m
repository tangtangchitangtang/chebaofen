
//
//  tianJiaViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "tianJiaViewController.h"
#import "tianJiaView.h"
@interface tianJiaViewController ()
@property(nonatomic,strong)tianJiaView *aView;
@end

@implementation tianJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"添加银行卡";
    self.navigationController.navigationBar.hidden=NO;
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(popVc)];
    
    _aView=[tianJiaView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;
}
-(void)popVc{
    if (_aView.abc==1) {
        _aView.abc=0;
        NSArray *subViews = [_aView subviews];
        if([subViews count] != 0) {
            [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
        [_aView creatView];

    }
    else
    {
        self.navigationController.navigationBar.hidden=YES;
        [self.navigationController popViewControllerAnimated:YES];
    
    }
    
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
