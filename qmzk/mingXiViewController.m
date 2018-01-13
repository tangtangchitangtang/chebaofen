//
//  mingXiViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "mingXiViewController.h"
#import "mingMiView.h"

@interface mingXiViewController ()
@property(nonatomic,strong)mingMiView *aView;

@end

@implementation mingXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"明细";
    
    _aView=[mingMiView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
     _aView.page=0;
    _aView.tableArr=[NSMutableArray arrayWithCapacity:0];
    [_aView creatView];
    _aView.viewController=self;
    [self creatLoginView];
}
-(void)creatLoginView{
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *sellerId=[dic2 objectForKey:@"sellerId"];
    
    NSNumber *page=[NSNumber numberWithInt:_aView.page];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:sellerId,@"sellerId",page,@"page", nil];
    [ZQTools AFNGetDataUrl:@"seller/payList" Dict:dic andTableView:_aView.tableView andView:self.view andSuccessBlock:^(id responseObject) {
        NSArray *typeArr=[responseObject objectForKey:@"content"];
        [_aView.tableArr addObjectsFromArray:typeArr];
        _aView.total=[[responseObject objectForKey:@"totalPages"] intValue];
        [_aView.tableView reloadData];
        if (_aView.page<_aView.total) {
            _aView.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                _aView.page+=1;
                [self creatLoginView];
            }];
        }
        else{
            _aView.tableView.mj_footer.hidden=YES;
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
