
//  BaseCollectionViewController.m
//  jiedianwang
//
//  Created by 美街美店 on 16/5/10.
//  Copyright © 2016年 com.jiedianwang.www. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "CDPMonitorKeyboard.h"
@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    if(self.navigationController.viewControllers.count>0)
    {
        if(self!=self.navigationController.viewControllers[0])
        {
            //左上角返回按钮
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(popVc)];
        }
    }
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    //此模式输入视图在UIView上，superView传输入视图所在视图即可
    [[CDPMonitorKeyboard defaultMonitorKeyboard] sendValueWithSuperView:self.view higherThanKeyboard:0 andMode:CDPMonitorKeyboardDefaultMode];
}

#pragma mark——————————收到内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    //清楚sd的缓存
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    
    
    
}
#pragma mark————————————————————点击屏幕关闭键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}

- (void)popVc
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)dealloc
{
    
 
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    //清空并重置数据
    [[CDPMonitorKeyboard defaultMonitorKeyboard] clearAll];
    
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}











// cell点击变色
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    //设置(Highlight)高亮下的颜色
    [cell setBackgroundColor:ColorWithRGB(220, 220, 220)];
}

- (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    //设置(Nomal)正常状态下的颜色
    [cell setBackgroundColor:[UIColor whiteColor]];
}

@end
