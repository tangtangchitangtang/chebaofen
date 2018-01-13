
//
//  dingDanViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/27.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "dingDanViewController.h"
#import "DingDanView.h"
#import "JianSuoView.h"
#import "SGScanningQRCodeVC.h"
#import "SGGenerateQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
#import "SGAlertView.h"
#import <Photos/Photos.h>
@interface dingDanViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)DingDanView *aView;
@property(nonatomic,strong)JianSuoView *aView2;
@end

@implementation dingDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}



-(void)LoginDic1{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *sellerId=[userDic objectForKey:@"sellerId"];
    
    if (_aView.abc==1) {
        NSNumber * page =  [NSNumber numberWithInt:_aView.page1];
        
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                           sellerId,@"sellerId",page,@"page",@"1",@"state",nil];
        
        [ZQTools AFNGetDataUrl:@"seller/orderList" Dict:dic andTableView:_aView.allTabelView andView:self.view andSuccessBlock:^(id responseObject) {
            
            NSArray *typeArr=[responseObject objectForKey:@"content"];
            [_aView.tableArr1 addObjectsFromArray:typeArr];
            _aView.total1=[responseObject objectForKey:@"totalPages"];
            [_aView.allTabelView reloadData];

            if (_aView.page1<_aView.total1.intValue) {
                _aView.allTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    _aView.page1+=1;
                    [self LoginDic1];
                }];
            }
            else{
                _aView.allTabelView.mj_footer.hidden=YES;
            }
            
        } anderrorBlock:nil];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    [self creatTopView];
    _aView=[DingDanView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
    _aView.abc=1;
    [_aView creatView];
    _aView.page1=0;
    _aView.page2=0;
    _aView.page3=0;
    _aView.viewController=self;
    _aView.tableArr1=[NSMutableArray arrayWithCapacity:0];
    _aView.tableArr2=[NSMutableArray arrayWithCapacity:0];
    _aView.tableArr3=[NSMutableArray arrayWithCapacity:0];
    [self LoginDic1];
    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"扫一扫" style:UIBarButtonItemStylePlain target:self action:@selector(saoYiSao)];
}
-(void)creatTopView{
    UIView *topView=[[UIView alloc] initWithFrame:CGRectMake(0, 9, _mainWidth*230, 26)];
    self.navigationItem.titleView = topView;
    topView.layer.cornerRadius=13;
    topView.backgroundColor=[UIColor colorWithRed:237/255.0 green:246/255.0 blue:1 alpha:1];
    
    UIImageView *imageview=[UIImageView new];
    [topView addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(14);
    }];
    imageview.image=[UIImage imageNamed:@"搜索"];
    
    _textView=[UITextField new];
    [topView addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(imageview.mas_right).mas_equalTo(_mainWidth*3);
        make.height.mas_equalTo(26);
        make.right.mas_equalTo(-_mainWidth*20);
    }];
    _textView.layer.cornerRadius=18;
    _textView.placeholder=@"搜索订单号";
    _textView.font=[UIFont systemFontOfSize:14];
    _textView.returnKeyType=UIReturnKeyDone;
    _textView.delegate=self;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
      self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(quXiao)];
    _aView2=[JianSuoView new];
    [self.view addSubview:_aView2];
    [_aView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
    _aView2.page=1;
    _aView2.tableArr=[NSMutableArray arrayWithCapacity:0];
    [_aView2 creatView];
}

-(IBAction)quXiao{
    [_textView resignFirstResponder];
    [_aView2 removeFromSuperview];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(saoYiSao)];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if ([textField.text isEqualToString:@""] ) {
        return YES;
    }
    [self jianSuo:textField.text];

    return YES;
}
-(void)jianSuo:(NSString *)orderNum{

    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSString *reviewsUserId=[userBasic objectForKey:@"idUserBasic"];
   
    NSNumber * page =  [NSNumber numberWithInt:_aView2.page];
    NSNumber * rows =  [NSNumber numberWithInt:_rows];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:rows,@"rows",page,@"page",reviewsUserId,@"sellerId",orderNum,@"orderNum",nil];
    
    [ZQTools AFNGetDataUrl:@"order/queryOrderByCondition" Dict:dic andTableView:_aView.allTabelView andView:self.view andSuccessBlock:^(id responseObject) {
        
        NSArray *typeArr=[responseObject objectForKey:@"rows"];
        [_aView2.tableArr addObjectsFromArray:typeArr];
        _aView2.total=[[responseObject objectForKey:@"total"] intValue];
        [_aView2.allTabelView reloadData];
        int rowsInt=rows.intValue;
        if (rowsInt*_aView.page1<_aView2.total) {
            _aView2.allTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                _aView2.page+=1;
                [self jianSuo:orderNum];
            }];
        }
        else{
            _aView.allTabelView.mj_footer.hidden=YES;
        }
        
    } anderrorBlock:nil];

}


@end
