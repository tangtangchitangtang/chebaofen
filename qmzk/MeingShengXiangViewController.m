//
//  MeingShengXiangViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "MeingShengXiangViewController.h"
#import "MingShengXiangView.h"
@interface MeingShengXiangViewController ()
@property(nonatomic,strong)MingShengXiangView *aView;
@end

@implementation MeingShengXiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden=NO;
    
    self.title=@"详情";

    
    _aView=[MingShengXiangView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];

    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:_titileID,@"id",idUserBasic,@"currentUserId",nil];
    
    [ZQTools AFNGetDataUrl:@"government/queryGovernmentDetail" Dict:dict andTableView:nil andView:self.view andSuccessBlock:^(id responseObject){
       _aView.dic=responseObject;
        [_aView creatView];
        
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
