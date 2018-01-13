//
//  shangPingXiangQingViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shangPingXiangQingViewController.h"
#import "shangPingXiangQingView.h"
#import "xiuGaiViewController.h"
@interface shangPingXiangQingViewController ()
@property(nonatomic,strong)shangPingXiangQingView *aView;
@end

@implementation shangPingXiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"详情";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(pushToTianJia)];
    
    _aView=[shangPingXiangQingView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.typeDic=_typeDic;
    [_aView creatView];
   
}
-(void)pushToTianJia{
    xiuGaiViewController *xiuGai=[[xiuGaiViewController alloc] init];
    xiuGai.dic=_typeDic;
    xiuGai.abc=2;
    [ZQTools pushNextViewController:self andRootController:xiuGai];
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
