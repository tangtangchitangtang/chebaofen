//
//  xiTongViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/18.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "xiTongViewController.h"
#import "xiTongView.h"
@interface xiTongViewController ()
@property(nonatomic,strong)xiTongView *aView;
@end

@implementation xiTongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"消息";
    self.navigationController.navigationBar.hidden=NO;
    
    _aView=[xiTongView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.tableArr=[NSMutableArray arrayWithCapacity:0];
    _aView.page=1;
    [_aView creatView];
    [self creatloginView];
}-(void)creatloginView{
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSString *reviewsUserId=[userBasic objectForKey:@"idUserBasic"];
    
    NSNumber * page =  [NSNumber numberWithInt:_aView.page];
    NSNumber * rows =  [NSNumber numberWithInt:_rows];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",reviewsUserId,@"receiveUserId",nil];
    
    [ZQTools AFNGetDataUrl:@"push/queryPushMsgByCondition" Dict:dic andTableView:_aView.allTabelView andView:self.view andSuccessBlock:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        NSArray *typeArr=[responseObject objectForKey:@"rows"];
        [_aView.tableArr addObjectsFromArray:typeArr];
        _aView.total=[[responseObject objectForKey:@"total"] intValue];
        [_aView.allTabelView reloadData];
        int rowsInt=rows.intValue;
        if (rowsInt*_aView.page<_aView.total) {
            _aView.allTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                _aView.page+=1;
                [self creatloginView];
            }];
        }
        else{
            _aView.allTabelView.mj_footer.hidden=YES;
        }
        
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
