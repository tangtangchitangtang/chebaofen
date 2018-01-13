
//
//  menDianViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "menDianViewController.h"
#import "menDianView.h"
@interface menDianViewController (){
    int abc;
    
}

@property(nonatomic,strong)NSString *logImGId,*zhiZhiImgID;
@property(nonatomic,strong)menDianView *aView;
@end

@implementation menDianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"门店信息";
    
    _aView=[menDianView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(0);
    }];
    _aView.dic=_dic;
    [_aView creatView];
//    _aView.viewController=self;
//    NSLog(@"%@",_dic);
//    NSDictionary *userBasic=[_dic objectForKey:@"userBasic"];
//    NSDictionary *seller=[_dic objectForKey:@"seller"];
//    NSLog(@"%@",userBasic);
//    _logImGId=[userBasic objectForKey:@"headPicId"];
//    _zhiZhiImgID=[seller objectForKey:@"businessLicenceId"];
//
//    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(creatXiuGai)];
//    _aView.LogoImageView.userInteractionEnabled=YES;
//    _aView.LogoImageView.tag=1;
//    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userIconChange:)];
//    [_aView.LogoImageView addGestureRecognizer:tapGesture1];
//    
//    _aView.iamgeView.tag=2;
//    _aView.iamgeView.userInteractionEnabled=YES;
//    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userIconChange:)];
//    [_aView.iamgeView addGestureRecognizer:tapGesture2];
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(creatXiuGai)];


    
}
-(void)creatXiuGai{
    
    NSDictionary *userBasic=[_dic objectForKey:@"userBasic"];
    NSDictionary *seller=[_dic objectForKey:@"seller"];
    
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    NSNumber *idSeller=[seller objectForKey:@"idSeller"];
    NSString *headPicId=_logImGId;
    NSString *phone=[seller objectForKey:@"phone"];
    NSString *nickName=[userBasic objectForKey:@"nickName"];
    NSString *tel=_aView.phoneLable.text;
    NSString *sellerAddress=_aView.diZhiLabel.text;
    NSNumber *isGovEntity=[seller objectForKey:@"isGovEntity"];
    NSString *corporateName=[seller objectForKey:@"corporateName"];
    NSNumber *sellerType=[seller objectForKey:@"sellerType"];
    NSString *businessLicenceId=_zhiZhiImgID;
    NSString *businessBeginHour=_aView.businessBeginHour;
    NSString *businessEndHour=_aView.businessEndHour;
    NSString *businessBeginMinute=_aView.businessBeginMinute;
    NSString *businessEndMinute=_aView.busiinessEndMinute;
    NSNumber *longtitude=@39.915;
    NSNumber *latitude=@116.404;
    if ([ZQTools charIsNil:phone]) {
        [ZQTools svpInfo:@"电话不能为空"];
        return;
    }if ([ZQTools charIsNil:nickName]) {
        [ZQTools svpInfo:@"店名不能为空"];
        return;
    }if (longtitude==0) {
        [ZQTools svpInfo:@"地址不能为空"];
        return;
    }if ([ZQTools charIsNil:corporateName]) {
        [ZQTools svpInfo:@"法人不能为空"];
        return;
    }if (sellerType==0) {
        [ZQTools svpInfo:@"商家类型还没有选择"];
        return;
    } if ([ZQTools charIsNil:businessBeginHour]) {
        [ZQTools svpInfo:@"时间不能为空"];
        return;
    }
    
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:idUserBasic forKey:@"idUserBasic"];
    [dic setObject:headPicId forKey:@"headPicId"];
    [dic setObject:idSeller forKey:@"idSeller"];
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:tel forKey:@"tel"];
    [dic setObject:nickName forKey:@"nickName"];
    [dic setObject:longtitude forKey:@"longtitude"];
    [dic setObject:latitude forKey:@"latitude"];
    [dic setObject:sellerAddress forKey:@"sellerAddress"];    [dic setObject:isGovEntity forKey:@"isGovEntity"];
    [dic setObject:corporateName forKey:@"corporateName"];
    [dic setObject:sellerType forKey:@"sellerType"];
    [dic setObject:businessLicenceId forKey:@"businessLicenceId"];
    [dic setObject:businessBeginHour forKey:@"businessBeginHour"];
    [dic setObject:businessEndHour forKey:@"businessEndHour"];
    [dic setObject:businessBeginMinute forKey:@"businessBeginMinute"];
    [dic setObject:businessEndMinute forKey:@"businessEndMinute"];
    
    [ZQTools AFNGetDataUrl:@"seller/updateSeller" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        [ZQTools svpInfo:@"修改成功"];
    } anderrorBlock:nil];


}
-(void) userIconChange:(UITapGestureRecognizer *)tap{
    abc=(int)tap.view.tag;
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle: @"" message: @"拍照或从相册中选择" preferredStyle: UIAlertControllerStyleActionSheet];
    
    [actionSheetController addAction: [UIAlertAction actionWithTitle:@"打开相册"style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self LocalPhoto];
        
    }]];
    [actionSheetController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self locaXiangJi];
        
        
    }]];
    
    [actionSheetController addAction: [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {}]];
    
    [self presentViewController: actionSheetController animated:YES completion:^{}];
    
}


-(void)locaXiangJi{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    UIImagePickerControllerQualityType qualityType = UIImagePickerControllerQualityTypeHigh;
    
    /*判断是否有相机*/
    
    if([UIImagePickerController isSourceTypeAvailable : UIImagePickerControllerSourceTypeCamera]){
        
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        
        picker.delegate=self;
        
        /*设置拍照后的图片可被编辑*/
        
        picker.allowsEditing=YES;
        
        /*资源类型为照相机*/
        
        picker.sourceType= sourceType;
        
        /*品质为高*/
        
        picker.videoQuality= qualityType;
        
        [self presentViewController: picker animated:YES completion:^{
            
            
        }];
        
    }else{
        //        [self alertTitle:@"该设备无摄像头"];
        
    }
    
}
-(void)LocalPhoto
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    /*资源类型为图片库*/
    
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate=self;
    
    /*设置选择后的图片可被编辑*/
    
    picker.allowsEditing=YES;
    
    [self presentViewController:picker animated:YES completion:^{
        
        
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        NSMutableArray<UIImage *>*imageArray = [NSMutableArray arrayWithObjects:image, nil];
        
        [ZQTools afnPostImageWithDict:nil WithAddressUrl:nil withImageArr:imageArray withFileName:@"fdsaf" WithView:self.view success:^(id responseObject) {
            if (abc==1) {
                _aView.LogoImageView.image=image;
                _logImGId=[responseObject objectForKey:@"resultId"];
            }  if (abc==2) {
                _aView.iamgeView.image=image;
                _zhiZhiImgID=[responseObject objectForKey:@"resultId"];
            }
        }];
        
        
    }];
    
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
