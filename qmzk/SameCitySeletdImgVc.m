//
//  SameCitySeletdImgVc.m
//  qmzk
//
//  Created by Mac on 2017/7/6.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "SameCitySeletdImgVc.h"
#import "MQImageDragView.h"     //选取图片布局

@interface SameCitySeletdImgVc ()<MQImageDragViewDelegate>
@property (nonatomic,strong)MQImageDragView *dragView;          //选取照片布局

@property (nonatomic,strong)NSMutableArray *imgArr;

@end

@implementation SameCitySeletdImgVc

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationController.navigationBar.hidden=NO;
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(submitClick)];
    
    [self.view addSubview:self.dragView];
 
     self.imgArr = [NSMutableArray arrayWithArray:self.allImgArr];
    
    if(self.imgArr.count>0)
    {
        
        for (UIImage *img in self.imgArr) {
            
            [_dragView addImage:img];
        }
        
        [self reloadH];
    }

}



#pragma mark————————————————MQImageDragView.代理方法

//点击了添加按钮
- (void)imageDragViewAddButtonClicked{
    
    
    NSLog(@"哈哈");
    
    [ZQTools showAlert:@"选取照片" with_Controller:self with_titleArr:@[@"相册",@"拍照"] withShowType:UIAlertControllerStyleActionSheet with_Block:^(int index) {
        
        
        
        if(index==0)
        {
            
            
            [[ZQTools sharedZQTools] openAlbumWithMaxImgNumber:9-_imgArr.count WithCuVc:self withOverBlock:^(id responseObject) {
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSArray *imgArr = responseObject;
                    
                    for (UIImage *img in imgArr) {
                        
                        [self addIMG:img];
                        
                    }
                    
                });
                
                
                
                
            }];
            
        }
        else if (index==1)
        {
            
            [[ZQTools sharedZQTools] openCameraWithCuVc:self withOverBlock:^(id responseObject) {
                
                [self addIMG:responseObject];
                
            }];
            
        }
        
        
    }];
    
    
    
}

- (void)addIMG:(UIImage *)img{
    
    
    if(self.imgArr==nil)
    {
        self.imgArr = [NSMutableArray array];
    }
    
    [self.imgArr addObject:img];
    
    [_dragView addImage:img];
    
 
    //重新添加高度
 
    [self reloadH];
    
}

//点击了删除按钮
- (void)imageDragViewDeleteButtonClickedAtIndex:(NSInteger)index{
    
    NSArray *arr = [_dragView getAllImages];
    
    _imgArr = [NSMutableArray arrayWithArray:arr];
    
    //重新设置高度
    [self reloadH];
    
}
//点击了某张图片
- (void)imageDragViewButtonClickedAtIndex:(NSInteger)index{
    
    [ZQTools instanceHJPhotoBrowser_withimgUrlArr:nil with_placeholderImageArr:_imgArr with_currentImageIndex:index with_sourceImagesContainerView:_dragView];
    
}
//移动了图片
- (void)imageDragViewDidMoveButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    
    NSArray *arr = [_dragView getAllImages];
    
    _imgArr = [NSMutableArray arrayWithArray:arr];
    
    //重新设置高度
    [self reloadH];
}


#pragma mark————————重新设置高度
- (void)reloadH{

    //重新添加高度
    CGRect rect = self.dragView.frame;
    
    rect.size.height = [self.dragView getHeightThatFit];
    
    self.dragView.frame = rect;

}



#pragma mark————————确认
- (void)submitClick
{


    if(self.submitBlock!=nil)
    {
        self.submitBlock (self.imgArr);
    }
    
    [self popVc];

}






- (MQImageDragView *)dragView
{
    
    if(_dragView==nil)
    {
        
        
        //初始化时请设定宽度，高度不需设定（内部计算）
        _dragView = [[MQImageDragView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, _mainW/3)];
        
        //上下左右的间距
        _dragView.kMarginLRTB = 5;
        //图片之间的间距
        _dragView.kMarginB = 5;
        //最大图片数量
        _dragView.kMaxCount = 5;
        //每行的图片数量
        _dragView.kCountInRow = 3;
        
        _dragView.dragViewDelegete = self;
        
    }
    
    return _dragView;
    
}


@end
