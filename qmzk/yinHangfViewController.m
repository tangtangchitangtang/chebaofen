
//
//  yinHangfViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "yinHangfViewController.h"
#import "tianJiaViewController.h"
#import "yinHangView.h"
@interface yinHangfViewController ()
@property(nonatomic,strong)yinHangView *aView;


@end

@implementation yinHangfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"银行卡";
    _aView=[yinHangView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.tableArr=[NSMutableArray arrayWithCapacity:0];
    _aView.abc=_abc;
    [_aView creatView];
    _aView.viewController=self;
    [self loginView];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(pushToTianJia)];

}

-(void)loginView{
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:idUserBasic,@"userId",nil];
    
    [ZQTools AFNGetDataUrl:@"userBasic/findBindingBank" Dict:dict andTableView:nil andView:self.view andSuccessBlock:^(id responseObject){
        [_aView.tableArr addObjectsFromArray:responseObject];
        [_aView.tableView reloadData];
    } anderrorBlock:nil];

    


}
-(void)pushToTianJia{

    tianJiaViewController *tianJia=[[tianJiaViewController alloc] init];
    [ZQTools pushNextViewController:self andRootController:tianJia];

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
