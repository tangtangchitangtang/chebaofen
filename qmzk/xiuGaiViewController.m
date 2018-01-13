//
//  xiuGaiViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "xiuGaiViewController.h"

#import "xiuGaiView.h"
@interface xiuGaiViewController ()

@property(nonatomic,strong)xiuGaiView *aView;
@end

@implementation xiuGaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _aView=[xiuGaiView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
     _aView.viewController=self;
     _aView.abc=_abc;
    if (_abc==1) {
        self.title=@"添加商品";
       
         [_aView creatView];
         self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(creatFaBu)];
    }
    if (_abc==2) {
        self.title=@"修改商品";
        _aView.typeDic=_dic;
         [_aView creatView2];
         self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(creatFaBu)];
    }
   
    
}

-(void)creatFaBu{
    
    
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[userDic objectForKey:@"userBasic"];
    NSNumber  *idSeller=[userBasic objectForKey:@"idUserBasic"];
    NSString *title=_aView.zhuTiText.text;
    
    
    NSNumber *price=[NSNumber numberWithFloat:_aView.priceText2.text.doubleValue];
    NSNumber *discountedPrice=[NSNumber numberWithFloat:_aView.priceText.text.doubleValue];
    NSString *detailInfo=_aView.xiangQingText.text;
    NSNumber *goodsType=_aView.goodsType;
    NSString *goodsTypeText=_aView.quYuText.text;
    NSString *stateText=@"上架";
    NSString *usePeriod=_aView.shiYongText.text;
    NSString *validityTime=[ZQTools changeTimeCuo:@"yyyy-MM-dd HH:mm:ss" :[NSString stringWithFormat:@"%@",_aView.validityTime]];
    NSString *applicableNum=_aView.renShuText.text;
    NSNumber  *stockNum=[NSNumber numberWithInt:_aView.kuCunText.text.intValue];
    NSString *reservationInfo=_aView.yuYueText.text;
    NSNumber *goodsBelongType=_aView.goodsBelongType;
    NSString *goodsBelongText=_aView.caiDanLabel.text;
    if ([title isEqualToString:@""]) {
        [ZQTools svpInfo:@"主题不能为空"];
        return;
    }
    if ([detailInfo isEqualToString:@"150字以内"]) {
        [ZQTools svpInfo:@"详情不能为空"];
        return;
    }if ([goodsTypeText isEqualToString:@"请选择"]) {
        [ZQTools svpInfo:@"商品类型不能为空"];
        return;
    }
    if ([usePeriod isEqualToString:@""]) {
        [ZQTools svpInfo:@"商品使用时间不能为空"];
        return;
    }
    if ([validityTime isEqualToString:@""]) {
        [ZQTools svpInfo:@"商品有效时间不能为空"];
        return;
    }
    if (_abc==1) {
        if ([goodsBelongText isEqualToString:@"请选择"]) {
            [ZQTools svpInfo:@"商品菜单类型不能为空"];
            return;
        }
        
    }

    if (applicableNum==0) {
        [ZQTools svpInfo:@"商品适用人数不能为空"];
        return;
    }if ([reservationInfo isEqualToString:@""]) {
        [ZQTools svpInfo:@"商品预约信息不能为空"];
        return;
    }
    
    if (_aView.imageview.imgArr.count==0) {
        [ZQTools svpInfo:@"商品图片不能为空"];
        return;
    }
    [ZQTools afnPostImageWithDict:nil WithAddressUrl:nil withImageArr:_aView.imageview.imgArr withFileName:@"fdsaf" WithView:self.view success:^(id responseObject) {
        
        
        NSString *picIds=[responseObject objectForKey:@"resultId"];
        NSMutableDictionary *dic=[NSMutableDictionary  dictionary];
        
        [dic setObject:idSeller forKey:@"userBasicId"];
        if (_abc==2) {
            NSNumber *idGoods=[_dic objectForKey:@"idGoods"];
            [dic setObject:idGoods forKey:@"goodsId"];
        }
        [dic setObject:title forKey:@"title"];
        
        [dic setObject:@0 forKey:@"monthSellCount"];
        
        [dic setObject:price forKey:@"price"];
        
        [dic setObject:discountedPrice forKey:@"discountedPrice"];
        
        [dic setObject:detailInfo forKey:@"detailInfo"];
        
        [dic setObject:goodsType forKey:@"goodsType"];
        
        [dic setObject:goodsTypeText forKey:@"goodsTypeText"];
        
        [dic setObject:stateText forKey:@"stateText"];
        
        [dic setObject:validityTime forKey:@"validityTime"];
        
        [dic setObject:usePeriod forKey:@"usePeriod"];
        
        [dic setObject:reservationInfo forKey:@"reservationInfo"];
        
        [dic setObject:applicableNum forKey:@"applicableNum"];
        
        [dic setObject:picIds forKey:@"fileIds"];
        
        [dic setObject:stockNum forKey:@"stockNum"];
        
        if (_abc==1) {
            [dic setObject:goodsBelongType forKey:@"goodsBelongType"];
            [dic setObject:goodsBelongText forKey:@"goodsBelongText"];
            
        }
        if (_abc==1) {
            [ZQTools AFNGetDataUrl:@"mgoods/saveMgoods" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
                
                [ZQTools svpInfo:@"发布成功"];
                [self.navigationController popViewControllerAnimated:YES];
            } anderrorBlock: nil];
        }
        else{
            [ZQTools AFNGetDataUrl:@"mgoods/updateMgoods" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
                
                [ZQTools svpInfo:@"修改成功"];
                [self.navigationController popViewControllerAnimated:YES];
            } anderrorBlock: nil];
        
        }

        
    }];

    
    
}
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden=NO;

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
