
//
//  zhaoPingViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "zhaoPingViewController.h"
#import "faBuQiuZhiViewController.h"
#import "zhaoPingView.h"
@interface zhaoPingViewController ()
@property(nonatomic,strong)zhaoPingView *aView;
@end

@implementation zhaoPingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"我要招聘";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(creatFaBu)];
    
    _aView=[zhaoPingView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.page=1;
    _aView.tableArr=[NSMutableArray arrayWithCapacity:0];
    [_aView creatView];
    _aView.viewController=self;
    [self creatLogingView];
}

-(void)creatLogingView{
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSString *reviewsUserId=[userBasic objectForKey:@"idUserBasic"];
    NSNumber * page =  [NSNumber numberWithInt:_aView.page];
    NSNumber * rows =  [NSNumber numberWithInt:_rows];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",reviewsUserId,@"sellerId",nil];
    [ZQTools AFNGetDataUrl:@"recruit/queryRecruitByCondition" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        
        NSArray *typeArr=[responseObject objectForKey:@"rows"];
        [_aView.tableArr addObjectsFromArray:typeArr];
        _aView.total=[[responseObject objectForKey:@"total"] intValue];
        [_aView.tableView reloadData];
        int rowsInt=rows.intValue;
        if (rowsInt*_aView.page<_aView.total) {
            _aView.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                _aView.page+=1;
                [self creatLogingView];
            }];
        }
        else{
            _aView.tableView.mj_footer.hidden=YES;
        }

    } anderrorBlock:nil];


}
-(void)creatFaBu{
    
    faBuQiuZhiViewController *fabu=[[faBuQiuZhiViewController alloc] init];
    fabu.abc=1;
    [ZQTools pushNextViewController:self andRootController:fabu];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
