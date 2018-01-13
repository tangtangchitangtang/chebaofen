//
//  ViewController.m
//  qmzk
//
//  Created by Mac on 2017/5/23.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userIconChange:)];
    [self.view addGestureRecognizer:tapGesture2];

}


-(void) userIconChange:(UITapGestureRecognizer *)tap{
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
        NSMutableArray<UIImage *>*imageArray=[NSMutableArray arrayWithCapacity:0];
        for (int i=0; i<3; i++) {
            [imageArray addObject:image];
        }
        NSDictionary *Dic=[NSDictionary dictionaryWithObjectsAndKeys:@"fileitem",@"fileitem", nil];
        [ZQTools afnPostImageWithDict:Dic WithAddressUrl:nil withImageArr:imageArray withFileName:@"file" WithView:self.view success:^(id responseObject) {
            NSLog(@"%@",responseObject);

        }];
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
