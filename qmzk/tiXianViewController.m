
//
//  tiXianViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "tiXianViewController.h"
#import "tiXianView.h"
@interface tiXianViewController ()
@property(nonatomic,strong)tiXianView *aView;

@end

@implementation tiXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"提现";

    _aView=[tiXianView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
//    _aView.dic=_dic;
    [_aView creatView2];
    _aView.viewController=self;
//    [self cresatLoginView];

 }
-(void)cresatLoginView{
    
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idUserBasic,@"userBasicId", nil];
    [ZQTools AFNGetDataUrl:@"seller/selectAccountBalance" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        _aView.keYongLabel.text=[NSString stringWithFormat:@"可用余额 %.2f元",[responseObject doubleValue]];
    } anderrorBlock:nil];
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
