//
//  SameCitySeletdImgVc.h
//  qmzk
//
//  Created by Mac on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseViewController.h"

@interface SameCitySeletdImgVc : BaseViewController

//确认后返回的block
typedef void (^SameCitySeletdImgVcBlock)(NSArray *imageArr);

@property (nonatomic,strong)NSMutableArray *allImgArr; //图片数组

@property (nonatomic,strong)SameCitySeletdImgVcBlock submitBlock; //确认后的数组

@end
