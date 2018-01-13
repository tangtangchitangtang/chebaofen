
//
//  shouYeViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "shouYeViewController.h"
#import "sheZhiViewController.h"
#import "shouYeView.h"
@interface shouYeViewController ()
@property(nonatomic,strong)shouYeView *aView;

@end

@implementation shouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 }
-(void)viewWillAppear:(BOOL)animated{
    
    _aView=[shouYeView new];
    [self wr_setNavBarBackgroundAlpha:0];
    
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;
    
    UIView * viewBackInNavi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    viewBackInNavi.backgroundColor=[UIColor clearColor];
    viewBackInNavi.userInteractionEnabled=YES;
    //重做按钮
    UIButton *myRightRePaintBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [myRightRePaintBtn addTarget:self action:@selector(pushToSeZhi:) forControlEvents:UIControlEventTouchUpInside];
    [myRightRePaintBtn setBackgroundColor:[UIColor clearColor]];
    [myRightRePaintBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [myRightRePaintBtn setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    myRightRePaintBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [viewBackInNavi addSubview:myRightRePaintBtn];
    
    
    UIBarButtonItem * right=[[UIBarButtonItem alloc]initWithCustomView:viewBackInNavi];
    //将整个viewBackInNavi右移10
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    negativeSpacer.width =-10;//负数为右移，正数为左移
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,right, nil];

}
-(IBAction)pushToSeZhi:(UIButton *)tap{
    sheZhiViewController *geRen=[[sheZhiViewController alloc] init];
    [ZQTools pushNextViewController:self andRootController:geRen];
    
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
