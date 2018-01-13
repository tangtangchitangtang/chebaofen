
//
//  shangPingViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/29.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shangPingViewController.h"

#import "xiuGaiViewController.h"
#import "sahngPingView.h"
@interface shangPingViewController ()

@property(nonatomic,strong)sahngPingView *aView;

@end

@implementation shangPingViewController

- (void)viewDidLoad {
       [super viewDidLoad];   
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"商品分类";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(pushToTianJia)];
    _aView=[sahngPingView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    _aView.abc=1;
    
    [_aView creatView];
    _aView.page1=1;
    _aView.page2=1;
    _aView.page3=1;
    _aView.viewController=self;
    _aView.tableArr1=[NSMutableArray arrayWithCapacity:0];
    _aView.tableArr2=[NSMutableArray arrayWithCapacity:0];
    _aView.tableArr3=[NSMutableArray arrayWithCapacity:0];
    [self creatLoginView];
    
}

-(void)creatLoginView{
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSNumber *idSeller=[userBasic objectForKey:@"idUserBasic"];
   
    if (_aView.abc==1) {
        NSNumber * page =  [NSNumber numberWithInt:_aView.page1];
        NSNumber * rows =  [NSNumber numberWithInt:_rows];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",idSeller,@"userBasicId",nil];
        
        [ZQTools AFNGetDataUrl:@"mgoods/findAllMgoods" Dict:dic andTableView:_aView.allTabelView andView:self.view andSuccessBlock:^(id responseObject) {
            
            NSArray *typeArr=[responseObject objectForKey:@"rows"];
            [_aView.tableArr1 addObjectsFromArray:typeArr];
            _aView.total1=[[responseObject objectForKey:@"total"] intValue];
            [_aView.allTabelView reloadData];
            int rowsInt=rows.intValue;
            if (rowsInt*_aView.page1<_aView.total1) {
                _aView.allTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _aView.page1+=1;
                    [self creatLoginView];
                }];
            }
            else{
                _aView.allTabelView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
    }
}

-(void)pushToTianJia{
    xiuGaiViewController *xiuGai=[[xiuGaiViewController alloc] init];
    xiuGai.abc=1;
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
