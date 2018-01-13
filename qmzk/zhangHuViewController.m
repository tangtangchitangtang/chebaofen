
//
//  zhangHuViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "zhangHuViewController.h"
#import "zhangHuView.h"
@interface zhangHuViewController ()

@property(nonatomic,strong)zhangHuView *aView;

@end

@implementation zhangHuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wr_setNavBarBackgroundAlpha:0];
    
    _aView=[zhangHuView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;
    [self cresatLoginView];
}

-(void)cresatLoginView{
    
    
    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *sellerId=[dic objectForKey:@"sellerId"];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:sellerId,@"sellerId", nil];
    [ZQTools AFNGetDataUrl:@"seller/wallet" Dict:dic2 andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        
        _aView.yuELabel2.text=[NSString stringWithFormat:@"%.2f",[[responseObject objectForKey:@"availMoney"] doubleValue]];
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
