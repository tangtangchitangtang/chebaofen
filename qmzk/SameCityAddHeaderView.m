//
//  SameCityAddHeaderView.m
//  qmzk
//
//  Created by Mac on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "SameCityAddHeaderView.h"
#import "SameCitySeletdImgVc.h" //选取图片的界面

@interface SameCityAddHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *backImg;

@property (weak, nonatomic) IBOutlet UIButton *addImgBtn;



@end

@implementation SameCityAddHeaderView


+ (instancetype)addSameCityAddHeaderView;
{
    
    SameCityAddHeaderView *view = [[NSBundle mainBundle] loadNibNamed:@"SameCityAddCell" owner:nil options:nil] [0];
    view.imgArr = [NSMutableArray array];
  
    view.frame = CGRectMake(0, 0, _mainW, _mainHeight*200);
   
    
    return view;
    
}


#pragma mark——————————添加图片
- (IBAction)addImgBtnClick:(id)sender {
    
    SameCitySeletdImgVc *vc= [ZQTools addVc_vcClassName:@"SameCitySeletdImgVc"];
    
    vc.allImgArr = self.imgArr;
    
    vc.submitBlock = ^(NSArray *arr)
    {
        
        self.imgArr = [NSMutableArray arrayWithArray:arr];
        
        //模糊背景
        if(self.imgArr.count>0)
        {
            UIImage *img = self.imgArr[0];
            
            self.backImg.image = img;
            
            [ZQTools addBlurWithView:self.backImg];
            
        }
        
        
    };
    
    [ZQTools pushNextViewController:self.inVc andRootController:vc];
    
}
@end
