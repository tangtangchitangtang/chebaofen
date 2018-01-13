
#import "BaseViewController.h"

#import "CDPMonitorKeyboard.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:17],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self wr_setNavBarTintColor:ColorWithRGB(149, 149, 149)];
    if(self.navigationController.viewControllers.count>0)
    {
        //地图不能有
        if(self!=self.navigationController.viewControllers[0])
        {
            //左上角返回按钮
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(popVc)];
        }
    }
    
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    
    //适配ios10
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    NSArray *vcClassArr = @[];
    BOOL isHave = NO;
    
    for (int x=0; x<vcClassArr.count; x++) {
        
        if([self isKindOfClass:vcClassArr[x]])
        {
            
            isHave = YES;
        }
        
    }
    
    if(isHave==NO)
    {
        
        //此模式输入视图在UIView上，superView传输入视图所在视图即可
        [[CDPMonitorKeyboard defaultMonitorKeyboard] sendValueWithSuperView:self.view higherThanKeyboard:0 andMode:CDPMonitorKeyboardDefaultMode];
    }
    
    
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


//返回上一个界面
- (void)popVc
{
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)dealloc
{
    
   
    [self.view endEditing:YES];
    

    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    
    //清空并重置数据
    [[CDPMonitorKeyboard defaultMonitorKeyboard] clearAll];
   
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



#pragma mark————————程序即将离开页面
- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
 
    
    [self.view endEditing:YES];
    
}


@end
