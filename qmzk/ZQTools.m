

#import "ZQTools.h"
#import "Toast.h"
#import "NSString+CZNSStringExt.h"
#import "NSString+ArvinCategory.h" //把字典的参数转为汉字
//#import "EmptyViewFactory.h"//tableView没有数据的占位效果
#import "ZKImgRunLoopView.h"//轮播器

#import "AppDelegate.h"
#import<CommonCrypto/CommonDigest.h> //苹果自带的MD5加密
#import "TZImagePickerController.h"  //系统媒体库处理封装

//更改系统导航栏透明度
#import <objc/runtime.h>
#import "CoreBlurView.h"    //模糊效果


@interface ZQTools ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>



@end

@implementation ZQTools



#pragma mark————————————单利 初始化
+ (instancetype)sharedZQTools
{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[ZQTools alloc]init];
        
        
    });
    
    return instance;
    
}





#pragma mark————————————————谁作为window的rootvc vc:根控制器  isHaveNavBar：是否有navbar
+ (void)changeRootVc:(UIViewController *)vc and:(BOOL)isHaveNavBar{
    
    
    if(isHaveNavBar)
    {
        
        
        BaseNavgationController *nav =[[BaseNavgationController alloc] initWithRootViewController:vc];
        [UIApplication sharedApplication].delegate.window.rootViewController = nav;
        
    }
    else
    {
        [UIApplication sharedApplication].delegate.window.rootViewController = vc;
        
    }
    
}



#pragma mark————————————————圆角
+ (void)viewFillet:(UIView *)view andFloat:(CGFloat)value
{
    
    view .layer.cornerRadius =value;
    view .layer.masksToBounds=YES;
    
}
#pragma mark————————————————给一个view加阴影
+ (void)viewAddYinYing:(UIView *)view{
    
    
    //阴影的颜色
    
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    //阴影的透明度
    
    view.layer.shadowOpacity = 0.8f;
    //阴影的圆角
    
    view.layer.shadowRadius = 4.f;
    //阴影偏移量
    
    view.layer.shadowOffset = CGSizeMake(1,1);
    
    
    
}



#pragma mark———————————————— 轮播图 依赖GDScrollBanner
+ (void)getHederImage :(CGRect)rect :(NSArray*)imageUrlArr :(UIView *)rootView :(void(^)(int value)) block
{
    
    //网络图片happendTime
    //网络图片
    
    NSString *placeholderImageName ;
    
    
    
    ZKImgRunLoopView *imgRunView = [[ZKImgRunLoopView alloc] initWithFrame:rect placeholderImg:_zhanweiImageData];
    
    imgRunView.imgUrlArray =imageUrlArr;
    [rootView addSubview:imgRunView];
    [imgRunView  touchImageIndexBlock:^(NSInteger index) {
        
        if(block!=nil)
        {
            block(index);
        }
    }];
    
}



#pragma mark——————————图片浏览  基于:#import "MSSBrowseDefine.h" 框架
/**
 *  Description
 *
 *  @param imageUrl   图片数组地址
 *  @param fatherView 加载展示ImageView的父View
 *  @param index      索引
 *  @param hiWithAnimation //消失时是否返回imageview的原坐标  no是返回   yes是透明度慢慢消失  默认no
 */

+ (void)loadingImageViewArrWith:(NSArray *)imageUrl withImageFatherView:(UIView *)fatherView withIndex:(int)index withHiWithAnimation:(BOOL)hiWithAnimation
{
    
    //    NSMutableArray *muArr = [NSMutableArray array];
    //
    //    for(int x=0;x<imageUrl.count;x++)
    //    {
    //        MSSBrowseModel *browseItem = [[MSSBrowseModel alloc]init];
    //
    ////        browseItem.bigImageUrl = @"http://dl.bizhi.sogou.com/images/2012/01/19/191337.png";
    //
    //        if([imageUrl[x] isKindOfClass:[UIImage class]])
    //        {
    //             browseItem.bigImage = imageUrl[x];// 加载本地图片
    //        }
    //        else
    //        {
    //             browseItem.bigImageUrl = imageUrl[x];// 加载网络图片大图地址
    //        }
    //
    //        if(fatherView.subviews.count>x)
    //        {
    //
    //            id view  =fatherView.subviews[x];
    //
    //
    //            //这里按需求添加
    //            if([view isKindOfClass:[UIImageView class]])
    //            {
    //                UIImageView *imageView = fatherView.subviews[x];
    //                browseItem.smallImageView = imageView;// 小图
    //            }
    //
    //
    //        }
    //
    //
    //        [muArr addObject:browseItem];
    //    }
    //
    //    MSSBrowseNetworkViewController *bvc = [[MSSBrowseNetworkViewController alloc]initWithBrowseItemArray:muArr currentIndex:index];
    //    //    bvc.isEqualRatio = NO;// 大图小图不等比时需要设置这个属性（建议等比）
    //
    //    //如果是
    //    bvc.hiWithAnimation = hiWithAnimation;
    //    [bvc showBrowseViewController];
    
    
    
    
    
}


#pragma mark———————————————— 跳转 push
+ (void)pushNextViewController:(UIViewController *)nextViewController andRootController:(UIViewController *)rootVc
{
    
    
    
    rootVc.hidesBottomBarWhenPushed = YES;
    
    [nextViewController.navigationController pushViewController:rootVc
                                                       animated:YES];
    
}


#pragma mark———————————————— 计算文字高度
+ (CGSize)getNSStringSize:(NSString *)string andViewWight:(CGFloat)weight andFont:(NSInteger)font
{
    
    
    return  [string sizeOfTextWithMaxSize:CGSizeMake(weight, MAXFLOAT) font:[UIFont systemFontOfSize:font]];
    
}

#pragma mark———————————————— afn封装 //依赖afn 和FCXRefreshHeaderView 和SVProgressHUD
//url 接口地址
//dict 参数字典
//tableView 用来结束上下拉刷新的状态  不传不结束
//view 当前vc的view 显示菊花
//responseObjectBlock 成功之行的block
+ (void)AFNPOSTDataUrl:(NSString *)url Dict:(NSDictionary *)dict andTableView:(UIScrollView *)tableview andView:(UIView *)view andSuccessBlock:(responseObjectBlock)responseObjectBlock anderrorBlock:(void(^)(void))errorBlock
{
    
    

    
    
    //如果正在上下拉刷新 就不显示
    if([tableview.mj_header isRefreshing]==NO&&[tableview.mj_footer isRefreshing]==NO)
    {
 
        if(view!=nil)
        {
            
            [MBProgressHUD showHUDAddedTo:view animated:YES];
        }
    }
    
    
    //有些不需要展示没有数据的接口
    NSArray *noDataUrlArr = @[@"getVideoByAccount"];
    
    //当前url是不是上面的接口
    BOOL isNoDataUrl = NO;
    
    for (NSString *noDataUrl in noDataUrlArr) {
        
        if([url isEqualToString:noDataUrl])
        {
            isNoDataUrl = YES;
        }
    }
    
   
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];

    [manager POST:[NSString stringWithFormat:@"%@/%@",_addressUrl,url]  parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:view animated:YES];
            
            [tableview.mj_header endRefreshing];
            
            [tableview.mj_footer endRefreshing];
            
            BaseModel *dataModel = [BaseModel mj_objectWithKeyValues:responseObject];
            
            if ([dataModel.code isEqualToString:@"1"]) {
                if(responseObjectBlock!=nil)
                {
                    
                    responseObjectBlock(dataModel.data);
                }
            }
            else{
                [ZQTools svpInfo:dataModel.msg];
                return ;
            }
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
      
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:view animated:YES];
            
            [tableview.mj_header endRefreshing];
            
            [tableview.mj_footer endRefreshing];
            
            //打印接口地址和参数 和返回的参数
            NSLog(@"\n报错___\n根地址___%@\n接口:%@ \n参数:%@  \n返回的失败原因%@",_addressUrl,url,dict,error);
            
            
            [FTToastIndicator dismiss];
            
            [ZQTools svpInfo:@"网络连接失败"];
            
            if(errorBlock!=nil)
            {
                errorBlock();
            }
            
        });


        
    }];
    
}




+ (void)AFNGetDataUrl:(NSString *)url Dict:(NSDictionary *)dict andTableView:(UIScrollView *)tableview andView:(UIView *)view andSuccessBlock:(responseObjectBlock)responseObjectBlock anderrorBlock:(void(^)(void))errorBlock
{
    
    
    
    
    
    //如果正在上下拉刷新 就不显示
    if([tableview.mj_header isRefreshing]==NO&&[tableview.mj_footer isRefreshing]==NO)
    {
        
        if(view!=nil)
        {
            
            [MBProgressHUD showHUDAddedTo:view animated:YES];
        }
    }
    
    
    //有些不需要展示没有数据的接口
    NSArray *noDataUrlArr = @[@"getVideoByAccount"];
    
    //当前url是不是上面的接口
    BOOL isNoDataUrl = NO;
    
    for (NSString *noDataUrl in noDataUrlArr) {
        
        if([url isEqualToString:noDataUrl])
        {
            isNoDataUrl = YES;
        }
    }
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    
    [manager GET:[NSString stringWithFormat:@"%@/%@",_addressUrl,url]  parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:view animated:YES];
            
            [tableview.mj_header endRefreshing];
            
            [tableview.mj_footer endRefreshing];
            
            BaseModel *dataModel = [BaseModel mj_objectWithKeyValues:responseObject];
            
            if ([dataModel.code isEqualToString:@"1"]) {
                if(responseObjectBlock!=nil)
                {
                    
                    responseObjectBlock(dataModel.data);
                }
            }
            else{
                [ZQTools svpInfo:dataModel.msg];
                return ;
            }
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:view animated:YES];
            
            [tableview.mj_header endRefreshing];
            
            [tableview.mj_footer endRefreshing];
            
            //打印接口地址和参数 和返回的参数
            NSLog(@"\n报错___\n根地址___%@\n接口:%@ \n参数:%@  \n返回的失败原因%@",_addressUrl,url,dict,error);
            
            
            [FTToastIndicator dismiss];
            
            [ZQTools svpInfo:@"网络连接失败"];
            
            if(errorBlock!=nil)
            {
                errorBlock();
            }
            
        });
        
        
        
    }];
    
}




#pragma mark——————————————————————————————————下载文件
//url  文件地址
//path 文件存到所在路径 (例 musics/)
//inView 所在view 展示进度
//dataType 下载文件类型
//成功返回一个路径

+ (void)AFNDownloadData:(NSString *)url  withDataSavePath:(NSString *)path  withDataType:(ENUM_DataType)dataType  withInView:(UIView *)inView  withOverBlock:(responseObjectBlock)overBlock  {
    
    
    
    //判断是否存在
    // 取得沙盒目录
    NSString *localPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 要检查的文件目录
    NSString *filePath = [localPath  stringByAppendingPathComponent:path];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    if ([fileManager fileExistsAtPath:filePath]) {
        NSLog(@"文件 存在");
        
        if(overBlock!=nil)
        {
            overBlock(filePath);
        }
        
    }
    else {
        NSLog(@"文件 不存在");
        
        
        //菊花
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:inView animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"准备下载..";
        
        [hud show:YES];
        
        
        //远程地址
        NSURL *URL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        //默认配置
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        //AFN3.0+基于封住URLSession的句柄
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        //请求
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        //下载Task操作
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            
            // @property int64_t totalUnitCount;     需要下载文件的总大小
            // @property int64_t completedUnitCount; 当前已经下载的大小
            
            
            // 回到主队列刷新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
                
                CGFloat progress =1.0 *downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
                
                // 设置进度条的百分比
                hud.labelText = [NSString stringWithFormat:@"%.0f%%",progress*100.0];
                
                if(progress==1)
                {
                    
                    [hud removeFromSuperview];
                }
                
            });
            
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            
            //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
            
            NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            NSString *zuihoupath = [cachesPath stringByAppendingPathComponent:path];
            
            
            return [NSURL fileURLWithPath:zuihoupath];
            
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            //设置下载完成操作
            // filePath就是你下载文件的位置，你可以解压，也可以直接拿来使用
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSString *imgFilePath = [filePath path];// 将NSURL转成NSString
                NSLog(@"%@",imgFilePath);
                
                if(overBlock!=nil)
                {
                    overBlock(imgFilePath);
                }
                
            });
            
        }];
        
        [downloadTask resume];
        
    }
    
    
    
}

//判断文件是否已经在沙盒中已经存在？
+ (BOOL)isFileExist:(NSString *)fileName
{
    
    NSLog(@"最终路径%@",fileName);
    fileName = @"file:///var/mobile/Containers/Data/Application/E3916BE9-C606-466D-B9B1-C73E14F2B3F2/Library/Caches/1.mp3";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    NSLog(@"这个文件已经存在：%@",result?@"是的":@"不存在");
    return result;
}







#pragma mark————————获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)ShouZiMu:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}





+(NSString *)curTimeString
{
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];//获取当前日期
    [formater setDateFormat:@"yyyyMMddHHmmssss"];//这里去掉 具体时间 保留日期
    NSString * curTime = [formater stringFromDate:curDate];
    
    NSLog(@"%@",curTime);
    
    return curTime;
}




#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串
+ (NSString *)changeTimeCuo: (NSString *)DateFormat : (NSString *)time
{
    
    //如果带有网页标签 就先去掉
    if([time rangeOfString:@"/Date"].location !=NSNotFound)//_roaldSearchText
    {
        
        //去掉多余的字符
        NSString *timeString = [[time stringByReplacingOccurrencesOfString:@"/Date(" withString:@""] stringByReplacingOccurrencesOfString:@"000)/" withString:@""];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:DateFormat];
        
        
        
        double timeInt =[timeString doubleValue];
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    else
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:DateFormat];
        
        
        //这里看后台返回的时间锉 长度是否为包含了毫秒级 如果返回了毫秒级 就／1000才能解析成正常的时间
        
        double timeInt =[time doubleValue]/1000;
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    
    
}


#pragma mark——————————————————NSString转NSDate (年月日)
+ (NSDate *)NSStringToNSDate:(NSString *)dateStr
{
    //先获得开始时间
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date=[dateFormatter dateFromString:dateStr];
    
    return date;
}



#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串 (只有年月日)
+ (NSString *)changeTimeCuoNianYueRi:(NSString *)time
{
    
    
    if([time rangeOfString:@"/Date"].location !=NSNotFound)//_roaldSearchText
    {
        
        //去掉多余的字符
        NSString *timeString = [[time stringByReplacingOccurrencesOfString:@"/Date(" withString:@""] stringByReplacingOccurrencesOfString:@"000)/" withString:@""];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        
        double timeInt =[timeString doubleValue];
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    else
    {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        
        double timeInt =[time doubleValue]/1000;
        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
        
        
        return confromTimespStr;
        
        
    }
    
    
}


#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串 (只有年月日 时分 没有秒)
+ (NSString *)changeTimeCuoNianYueRiShiFen:(NSString *)time
{
    
    
    if([time rangeOfString:@"/Date"].location !=NSNotFound)//_roaldSearchText
    {
        
        //去掉多余的字符
        NSString *timeString = [[time stringByReplacingOccurrencesOfString:@"/Date(" withString:@""] stringByReplacingOccurrencesOfString:@"000)/" withString:@""];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        
        double timeInt =[timeString doubleValue];
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    else
    {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        
        double timeInt =[time doubleValue]/1000;
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    
    
}

#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串 (只有月日)
+ (NSString *)changeTimeCuoYueRi:(NSString *)time
{
    
    
    if([time rangeOfString:@"/Date"].location !=NSNotFound)//_roaldSearchText
    {
        
        //去掉多余的字符
        NSString *timeString = [[time stringByReplacingOccurrencesOfString:@"/Date(" withString:@""] stringByReplacingOccurrencesOfString:@"000)/" withString:@""];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        
        
        double timeInt =[timeString doubleValue];
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    else
    {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        
        
        double timeInt =[time doubleValue]/1000;
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        
        
        
        NSString *myNewDateString = [formatter stringFromDate:date1];
        return myNewDateString;
    }
    
    
}




#pragma mark——————————————nsdate转时间锉
+ (NSString *)NSDateChangeTimeCuo:(NSString *)time
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if([self getDeviceTimeType]==NO)
    {
        
        [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
        
    }
    else
    {
        
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
        
    }
    
    
    NSDate *date = [formatter dateFromString:time];
    
    
    
    NSTimeInterval dis = [date timeIntervalSince1970];
    
    NSLog(@"%@",[NSString stringWithFormat:@"%.0f", (double)dis*1000]);
    
    return  [NSString stringWithFormat:@"%.0f", (double)dis*1000];
}



#pragma mark——————————传入时间cuo得到nsdate
+ (NSDate *)NSStringToNSDateWithTimeCuo:(NSString *)shijiancuo
{
    
    
    
    
    //先把时间错转为
    if([shijiancuo rangeOfString:@"/Date"].location !=NSNotFound)//_roaldSearchText
    {
        
        //去掉多余的字符
        NSString *timeString = [[shijiancuo stringByReplacingOccurrencesOfString:@"/Date(" withString:@""] stringByReplacingOccurrencesOfString:@"000)/" withString:@""];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        if([self getDeviceTimeType]==NO)
        {
            
            [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
            
        }
        else
        {
            
            [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
            
        }
        
        
        double timeInt =[timeString doubleValue];
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        
        return date1;
        
    }
    else
    {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        if([self getDeviceTimeType]==NO)
        {
            
            [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
            
        }
        else
        {
            
            [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
            
        }
        
        
        double timeInt =[shijiancuo doubleValue]/1000;
        
        
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInt];
        
        return date1;
        
        
    }
    
    
}




#pragma mark————————————去掉hmtl正则
+(NSString *)filterHTML:(NSString *)html
{
    
    
    
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    
    
    
    
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    // NSString * regEx = @"<([^>]*)>";
    // html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}


#pragma mark——————————————获取当前版本号
+ (NSString *)getAPPBanben
{
    
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}




#pragma mark——————————————设置lable外边框
+ (void)lableBianKuang:(UIView *)lable andColor:(UIColor *)color
{
    
    lable.layer.cornerRadius = 4.f;
    lable.layer.masksToBounds = YES;
    lable.layer.borderColor = color.CGColor;
    lable.layer.borderWidth = 1.0f;
    
}
#pragma mark——————————————删除View外边框
+ (void)removeViewBianKuang:(UIView *)view
{
    
    view.layer.cornerRadius = 0;
    view.layer.masksToBounds = NO;
    view.layer.borderColor = [UIColor clearColor].CGColor;
    view.layer.borderWidth = 0.0f;
    
}



#pragma mark——————————————设置lable外边框并且加上角度
+ (void)lableBianKuang:(UIView *)lable andColor:(UIColor *)color andRadius:(float)radius
{
    
    lable.layer.cornerRadius = radius;
    lable.layer.masksToBounds = YES;
    lable.layer.borderColor = color.CGColor;
    lable.layer.borderWidth = 1.0f;
    
    
}




#pragma mark——————————给view 添加一个黑色透明背景 如果为空  就添加到window
- (void)addBackView:(UIView *)view
{
    
    if(self.backButton==nil)
    {
        
        
        //蒙板view
        self.backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, _mainW, _mainH)];
        self.backButton.backgroundColor =[UIColor blackColor];
        
        self.backButton.alpha = 0;
        
        
        //设置手势
        [self.backButton addTarget:self action:@selector(dismissSelfView) forControlEvents:UIControlEventTouchUpInside];
        
        
        if(view==nil)
        {
            [[[UIApplication sharedApplication] keyWindow]addSubview:self.backButton];
        }
        else
        {
            [view addSubview:self.backButton];
        }
        
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.backButton.alpha = 0.7;
            
            
        }];
        
    }
    
    
    
}






#pragma mark——————————隐藏背景
- (void)dismissSelfView
{
    
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        self.backButton.alpha = 0;
        
        
    }completion:^(BOOL finished) {
        
        
        [self.backButton removeFromSuperview];
        self.backButton=nil;
    }];
    
    
    if(self.seletedblock!=nil)
    {
        self.seletedblock();
    }
}




#pragma mark————————————根据sb来实例化vc并且跳转 (Sbname sb名字  ViewController要跳转的类的对象可以直接类名 new  selfVc 当前vc )注意： sb名字一定要和SB id 一样不然会崩
+ (void)pushSbVcSbname:(NSString *)Sbname andVc:(UIViewController *)ViewController andSelfVc:(UIViewController *)selfVc
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:Sbname bundle:nil];
    ViewController = [sb instantiateViewControllerWithIdentifier:Sbname];
    
    [ZQTools pushNextViewController:selfVc andRootController:ViewController];
    
}



#pragma mark————————————————清除sdwebImage里面的缓存
+ (void)clearSDWebImageChace{
    
    [[[SDWebImageManager sharedManager] imageCache] clearDisk];
    [[[SDWebImageManager sharedManager] imageCache] clearMemory];
    
    
}

#pragma mark————————————————获取sdwebImage缓存大笑
+ (void)getSDWebImageChaceSize:(SDWebImageCalculateSizeBlock)completionBlock{
    
    
    
    
    [SDWebImageManager.sharedManager.imageCache
     calculateSizeWithCompletionBlock:completionBlock];
    
    //    NSLog(@"有%d张图片 缓存%.2fM",fileCount,totalSize / 1024.0 / 1024.0);
    
}



#pragma mark——————————获取当前时间到毫秒
+ (NSString *)getTimeNow
{
    NSString* date;
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    
    
    if([self getDeviceTimeType]==NO)
    {
        
        [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
        
    }
    else
    {
        
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
        
    }
    date = [formatter stringFromDate:[NSDate date]];
    NSString * timeNow = [[NSString alloc] initWithFormat:@"%@", date];
    NSLog(@"%@", timeNow);
    return timeNow;
}


#pragma mark————————————获取当前设备是否是24小时时间制
+ (BOOL)getDeviceTimeType
{
    
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    
    BOOL hasAMPM = containsA.location != NSNotFound;
    
    return hasAMPM;
    
    //hasAMPM==TURE为12小时制，否则为24小时制
}


#pragma mark————————svp提醒
+ (void)svpInfo:(NSString *)title
{
    
    Toast *toast = [Toast toast]; //创建一个toast
    
    [toast makeText:title]; //显示
    
    
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //
    //
    //        [FTIndicator setIndicatorStyle:UIBlurEffectStyleDark];
    //        [FTIndicator showToastMessage:title];
    //
    //
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //
    //            [FTIndicator dismissToast];
    //
    //        });
    //
    //    });
    
}




#pragma mark——————————获取系统版本
#pragma mark——————————外部版本
+ (NSString *)getVersionID{
    
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
}
#pragma mark——————————内部版本
+ (NSString *)getbuild{
    
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
    
}


#pragma mark————————————uilable顶部对齐
+ (void)lableTopAlignment:(UILabel *)lable{
    
    CGSize size = [lable.text sizeWithAttributes:@{NSFontAttributeName:lable.font}];
    CGRect rect = [lable.text boundingRectWithSize:CGSizeMake(lable.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:lable.font} context:nil];
    lable.numberOfLines = 0;//为了添加\n必须为0
    NSInteger newLinesToPad = (lable.frame.size.height - rect.size.height)/size.height;
    
    for (NSInteger i = 0; i < newLinesToPad; i ++) {
        lable.text = [lable.text stringByAppendingString:@"\n "];
    }
    
    
}



//手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    //移动号段正则表达式
    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    //联通号段正则表达式
    NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    //电信号段正则表达式
    NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    BOOL isMatch1 = [pred1 evaluateWithObject:mobileNum];
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
    BOOL isMatch2 = [pred2 evaluateWithObject:mobileNum];
    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    BOOL isMatch3 = [pred3 evaluateWithObject:mobileNum];
    
    if (isMatch1 || isMatch2 || isMatch3) {
        return YES;
    }else{
        return NO;
    }
}




// 根据图片url获取图片尺寸
+(CGSize)getImageSizeWithURL:(id)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;                  // url不正确返回CGSizeZero
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self getPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self getGIFImageSizeWithRequest:request];
    }
    else{
        size = [self getJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))                    // 如果获取文件头信息失败,发送异步请求请求原图
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
            size = image.size;
        }
    }
    return size;
}

//  获取PNG图片的大小
+(CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取gif图片的大小
+(CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取jpg图片的大小
+(CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}


#pragma mark——————————增加下啦刷新
+ (void)tableViewAddRefreshHeader:(UIScrollView *)scrollView withTarget:(id)target  refreshingAction:(SEL)action
{
    
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    
}
#pragma mark——————————增加上拉加载更多
+ (void)tableViewAddRefreshFooter:(UIScrollView *)scrollView withTarget:(id)target refreshingAction:(SEL)action
{
    scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
}
#pragma mark——————————增加上拉加载更多Block版本
+ (void)tableViewAddRefreshFooter:(UIScrollView *)scrollView withBlock:(MJRefreshComponentRefreshingBlock)block
{
    scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
}

#pragma mark————————————计算两个经纬度间的距离
//LocationOne LocationTwo 两个经纬度
+ (NSString *)getAddressNumberAddressOne:(CLLocationCoordinate2D )LocationOne  withAddressTwo:(CLLocationCoordinate2D )LocationTwo{
    
    CLLocation *orig=[[CLLocation alloc] initWithLatitude:LocationOne.latitude  longitude:LocationOne.longitude];
    
    CLLocation* dist=[[CLLocation alloc] initWithLatitude:LocationTwo.latitude  longitude:LocationTwo.longitude];
    
    CLLocationDistance kilometers=[orig distanceFromLocation:dist];
    
    NSLog(@"距离%f:",kilometers);
    
    if(kilometers<1000.0)
    {
        
        NSString *string =[NSString stringWithFormat:@"%.0f 米",kilometers];
        
        return string;
    }
    else
    {
        NSString *string = [NSString stringWithFormat:@"%.2f 公里",kilometers/1000.0];
        
        return string;
    }
    
    
    
}





//时间挫转换成距离现在多久
+ (NSString *)distanceTimeWithBeforeTime:(NSString *)shijiancuo
{
    
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeString = [ZQTools changeTimeCuo:@"yyyy-MM-dd HH:mm:ss":shijiancuo];
    
    NSDate *date =[dateFormat dateFromString:timeString];
    NSTimeInterval beTime =[date timeIntervalSince1970];
    
    
    
    NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
    double distanceTime = now - beTime;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60) {//小于一分钟
        distanceStr = @"刚刚";
    }
    else if (distanceTime <60*60) {//时间小于一个小时
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }
    else if(distanceTime <24*60*60 && [nowDay integerValue] == [lastDay integerValue]){//时间小于一天
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
    }
    else if(distanceTime<24*60*60*2 && [nowDay integerValue] != [lastDay integerValue]){
        
        if ([nowDay integerValue] - [lastDay integerValue] ==1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
        }
        else{
            [df setDateFormat:@"MM-dd HH:mm"];
            distanceStr = [df stringFromDate:beDate];
        }
        
    }
    else if(distanceTime <24*60*60*365){
        [df setDateFormat:@"MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    else{
        [df setDateFormat:@"yyyy-MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
}



#pragma mark————————————给lable加上黑线
+ (void)withLableAddBlackLin:(UILabel *)lable
{
    //uilable中间分割线(删除线)
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:lable.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, lable.text.length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, lable.text.length)];
    [lable setAttributedText:attri];
}


#pragma mark——————————给lable某段文字颜色
+ (void)withLableAddColorWithLable:(UILabel *)lable with:(NSString *)colorString WithColor:(UIColor *)color
{
    if(colorString!=nil)
    {
        NSRange range1 = [lable.text rangeOfString:colorString];
        NSMutableAttributedString *richText =[[NSMutableAttributedString alloc]initWithAttributedString:lable.attributedText];
        [richText addAttribute:NSForegroundColorAttributeName value:color range:range1];
        lable.attributedText = richText;
    }
    
}



#pragma mark————————————lable顶部对齐
+ (void)LableAlignTop:(UILabel *)lable
{
    CGSize fontSize = [lable.text sizeWithFont:lable.font];
    double finalHeight = fontSize.height * lable.numberOfLines;
    double finalWidth = lable.frame.size.width;    //expected width of label
    CGSize theStringSize = [lable.text sizeWithFont:lable.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:lable.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        lable.text = [lable.text stringByAppendingString:@"\n "];
}


#pragma mark——————————lable行间距(整个)
+ (void)LableRowFloat:(UILabel *)lable  withRowNumber:(CGFloat)rowNumber
{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:lable.attributedText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:rowNumber];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lable.text length])];
    lable.attributedText = attributedString;
    
    
    
    
}



#pragma mark————————————————————友盟分享
/**
 *  友盟分享
 *
 *  @param shareUrl 分享链接地址(点击)
 *  @param vc       当前vc
 *  @param title    标题
 *  @param image    分享图片
 *  @param Source   描述
 */
//+ (void)UMShareWithShareUrl:(NSString *)shareUrl  withViewController:(UIViewController *)vc  withTitle:(NSString *)title  withImage:(UIImage *)image withSource:(NSString *)Source{
//
//
//
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //设置文本
//    messageObject.text = title;
//
//    if(image==nil)
//    {
//        image = _zhanweiImageData;
//    }
//
//    UMShareWebpageObject *umObj = [UMShareWebpageObject shareObjectWithTitle:title descr:Source thumImage:image];
//    umObj.webpageUrl  = shareUrl;
//
//    messageObject.shareObject = umObj;
//
//
//
//    //弹出界面
//    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Qzone),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//        // 根据获取的platformType确定所选平台进行下一步操作
//
//
//
//        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id result, NSError *error) {
//
//
//
//        }];
//
//    }];}
//









#pragma mark————————————————————友盟分享(指定平台)
/**
 *  友盟分享
 *
 *  @param shareUrl 分享链接地址(点击)
 *  @param vc       当前vc
 *  @param title    标题
 *  @param image    分享图片
 *  @param Source   描述
 *  @param formType 分享平台
 *  @param completion 分享后的回调
 */
//+ (void)UMShareWithShareUrl:(NSString *)shareUrl  withViewController:(UIViewController *)vc  withTitle:(NSString *)title  withImage:(UIImage *)image withSource:(NSString *)Source withShareType:(UMSocialPlatformType)formType withCompletion:(UMSocialRequestCompletionHandler)completion{
//
//
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //设置文本
//    messageObject.text = title;
//
//    if(image==nil)
//    {
//        image = _zhanweiImageData;
//    }
//
//    UMShareWebpageObject *umObj = [UMShareWebpageObject shareObjectWithTitle:title descr:Source thumImage:image];
//    umObj.webpageUrl  = shareUrl;
//
//    messageObject.shareObject = umObj;
//
//
//
//    [[UMSocialManager defaultManager] shareToPlatform:formType messageObject:messageObject currentViewController:vc completion:completion];
//
//
//}








#pragma mark————————————————————UIColor 转UIImage
+ (UIImage*)createImageWithColor: (UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


#pragma mark————————————————————UIImage转UIColor
+ (void)imageToColor:(UIImage *)image
{
    [UIColor colorWithPatternImage:image];
    
}



#pragma mark——————————————SDWebImage加载图片
+ (void)sd_setImageWithimageView:(UIImageView *)imageView withImageUrl:(NSString *)imageUrl  withPlaceholderImage:(UIImage *)placeholderImage withCompleted:(SDWebImageCompletionBlock)completedBlock{
    
    if([imageUrl isKindOfClass:[NSNull class]])
    {
        imageUrl = @"";
    }
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:placeholderImage completed:completedBlock];
    
}





#pragma mark————————————————上传图片
+ (void)afnPostImageWithDict:(NSDictionary *)dict WithAddressUrl:(NSString *)addressUrl withImageArr:(NSArray *)imageArr withFileName:(NSString *)fileName   WithView:(UIView *)view   success:(responseObjectBlock)responseObjectBlock{
    
    //菊花
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeIndeterminate;
    
    [hud show:YES];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    
    
    
    
    [manager POST:[NSString stringWithFormat:@"%@/FileUpload/FileUploadController",_imgAddressUrl] parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
        
        
        //这个就是流参数
        // 传图片
        for (int x=0; x<imageArr.count; x++) {
            
            
            UIImage *image = imageArr[x];
            
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            
            if(imageData==nil)
            {
                imageData = UIImagePNGRepresentation(image);
            }
            
            [formData appendPartWithFileData:imageData name:fileName fileName:[NSString stringWithFormat:@"%@%d.png",[ZQTools curTimeString],0] mimeType:@"image/png"];
            
        }
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        
        
        BOOL success=[[responseObject objectForKey:@"success"] boolValue];
        if (success) {
            if (responseObjectBlock!=nil) {
                responseObjectBlock(responseObject);
            }
        }
        
        
        
    }  failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        
        //打印接口地址和参数 和返回的参数
        NSLog(@"\n报错___\n根地址___%@\n接口:%@ \n参数:%@  \n返回的参数%@",_addressUrl,addressUrl,dict,error);
        
        [FTToastIndicator dismiss];
        
        [ZQTools svpInfo:@"网络连接失败"];
        
        
    }];
    
    
    
    
}



//#pragma mark————————————————上传文件
//+ (void)AFNUploadFileWithDict:(NSDictionary *)dict WithAddressUrl:(NSString *)addressUrl withImageArr:(NSArray *)imageArr  WithView:(UIView *)view success:(void (^)(NSURLSessionDataTask *task, id responseObject))success{
//
//
//
//        //菊花
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//
//        hud.mode = MBProgressHUDModeText;
//
//        [hud show:YES];
//
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        manager.requestSerializer = [AFJSONRequestSerializer serializer];
//        manager.responseSerializer = [AFJSONResponseSerializer serializer];
//
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//
//
//
//    [manager POST:[NSString stringWithFormat:@"%@",_addressUrl] parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//
//
//
//
//                //这个就是流参数
//                // 传图片
//                for (int x=0; x<imageArr.count; x++) {
//
//
//                     [formData appendPartWithFileData:imageData name:@"uploadFile" fileName:[NSString stringWithFormat:@"%@%d.png",[ZQTools curTimeString],0] mimeType:@"image/png"];
//
//
//
//
//                }
//
//
//
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//
//                [MBProgressHUD hideHUDForView:view animated:YES];
//
//                if(success!=nil)
//                {
//                    success(task,responseObject);
//                }
//
//            }  failure:^(NSURLSessionDataTask *task, NSError *error) {
//
//
//                [MBProgressHUD hideHUDForView:view animated:YES];
//
//                //打印接口地址和参数 和返回的参数
//                NSLog(@"\n报错___\n根地址___%@\n接口:%@ \n参数:%@  \n返回的参数%@",_addressUrl,addressUrl,muDict,error);
//
//                [FTToastIndicator dismiss];
//
//                [ZQTools svpInfo:@"网络连接失败"];
//
//
//            }];
//
//
//
//
//}




#pragma mark——————————————————递归 类似@[@[@"黄色",@"红色"],@[@"X号",@"M号"],@[@"全新",@"九成新"]] 这种每个规格都遍历一次 最后的到 黄色 x号 全新, 黄色 x号 九成新..  这种
/**
 *
 *
 *  @param t t默认传一个空数组
 *  @param a 模型数组
 *  @param n 模型数组的长度 count
 *  @param r 要返回的可变数组（必须初始化）
 */
+ (void)f:(NSArray *)t :(NSArray *)a :(long)n  withoverArr:(NSMutableArray *)r
{
    
    if(n==0)//到第0个角标的时候 就遍历完一次 添加到数组
    {
        
        [r addObject:t];
        
        return ;
        
    }
    
    for (int i=0; i<[a[n-1] count]; i++) {
        
        
        //不能改变原始的t 所以没有用t直接add
        NSMutableArray *muArr = [NSMutableArray arrayWithArray:t];
        [ muArr addObject:a[n-1][i]];
        
        
        [self f:muArr :a :n-1 withoverArr:r];
    }
}



#pragma mark————————————————地理编码和逆地理编码
//（1）地理编码方法
+ (void )geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler{
    
    CLGeocoder *geocoder =[[CLGeocoder alloc]init];
    
    [geocoder geocodeAddressString:addressString completionHandler:completionHandler];
    
    
}

//（2）反地理编码方法
+ (void )reverseGeocodeLocation:(CLLocation *)location completionHandler:(CLGeocodeCompletionHandler)completionHandler{
    
    CLGeocoder *geocoder =[[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:completionHandler];
}



#pragma mark——————————清除button的点击事件
+ (void)removeAllTargets:(UIButton *)button{
    for (id target in [button allTargets])
    {
        [button removeTarget:target action:NULL forControlEvents:UIControlEventAllEvents];
    }
}










#pragma mark———————————把网址改成html标签的字符串
+ (NSString *)htmlAddressToHtmlString:(NSString *)url
{
    
    if(url!=nil)
    {
        return  [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:url]
                                               encoding:NSUTF8StringEncoding error:nil];
    }
    
    return @"";
}



#pragma mark——————————更改网页内容宽高
+ (NSString *)changeHtmlContentSize:(NSString *)htmlString
{
    
    if(htmlString!=nil)
    {
        
        return [NSString stringWithFormat:@"<head><style>img{width:%fpx !important;height: auto;}</style></head>%@",_mainW-20, htmlString];
        
    }
    
    return @"";
    
}



#pragma mark——————————UIView转UIImage
+ (UIImage*)convertViewToImage:(UIView*)view{
    
    
    
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}


#pragma mark——————————————压缩图片
+ (void)compressImage:(UIImage *)image withOverBlock:(void (^)(NSData *data))block{
    
    [CBImageCompressor compressImage:image limitSize:512*1024*8 maxSide:400 completion:block];
}



#pragma mark——————————————unencodedString
+ (NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}



+ (void)showAlert:(NSString *)alterTitle  with_Controller:(UIViewController *)controller with_titleArr:(NSArray *)titieArray withShowType:(UIAlertControllerStyle)preferredStyle  with_Block:(touchIndex)touchBlock{
    // 1.弹框提醒
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:alterTitle preferredStyle:preferredStyle];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    
    //遍历添加提示框文字
    for (int x=0; x<titieArray.count; x++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:titieArray[x] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //记录tag 点击调用的时候 返回给block
            
            
            if(touchBlock!=nil)
            {
                touchBlock(x);
            }
            
            
        }];
        
        [alert addAction:action];
        
        
        
    }
    
    // 弹出对话框
    [controller presentViewController:alert animated:true completion:nil];
    
}




#pragma mark———————————获取当前屏幕显示的viewcontroller 适用范围，tabbar的子视图都是NavigationController，其它情况可以根据情况调整
+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
        //<span style="font-family: Arial, Helvetica, sans-serif;">//  这方法下面有详解    </span>
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
    
    
}


#pragma mark————————————清除view所有约束
+ (void)removeAllAutoLayout:(UIView *)view{
    [view removeConstraints:view.constraints];
    for (NSLayoutConstraint *constraint in view.superview.constraints) {
        if ([constraint.firstItem isEqual:view]) {
            [view.superview removeConstraint:constraint];
        }
    }
}






#pragma mark————————————————封装的mj转模型 (字典数组转模型数组)
+ (NSArray *)MJModel_WithArr:(NSDictionary *)dict withModelClass:(Class)modelClass
{
    return   [modelClass mj_objectArrayWithKeyValuesArray:dict];
}

#pragma mark————————————————封装的mj转模型 (字典转模型)
+ (id)MJModel_WithDict:(NSDictionary *)dict withModelClass:(id)model
{
    return   [model mj_objectWithKeyValues:dict];
}
#pragma mark————————————————封装的mj转模型 (字典转模型)
+ (NSDictionary *)MJModel_ModelToDict:(NSObject *)model
{
    return  model.mj_keyValues;
}

#pragma mark————————————添加模糊view
+ (UIView *)addBlurView:(CGRect)rect WithStyle:(UIBlurEffectStyle)style
{
    //模糊效果
    UIView *BlurView;
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 8.0f) {
        
        
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:style];
        BlurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        ((UIVisualEffectView *)BlurView).frame =rect;
        
        
        
    }else{
        
        BlurView = [[UIToolbar alloc] initWithFrame:rect];
        ((UIToolbar *)BlurView).barStyle = UIBarStyleDefault;
        
    }
    
    return BlurView;
}






#pragma mark———————————— 此方法随机产生32位字符串， 修改代码红色数字可以改变 随机产生的位数。
+(NSString *)ret32bitString

{
    
    char data[32];
    
    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
    
}


#pragma mark————————————NSDict 转 json
+ (NSString*)DataTOjsonString:(id)object
{
    if(object==nil)
    {
        return @"";
    }
    
    if([object isKindOfClass:[NSDictionary class]])
    {
        
        
        //去掉一些转换不了的属性
        NSMutableDictionary *muDict = [NSMutableDictionary dictionaryWithDictionary:object];
        
        for (id sonObj in muDict.allKeys) {
            
            if([muDict[sonObj] isKindOfClass:[NSData class]])
            {
                
                [muDict removeObjectForKey:sonObj];
                
            }
            
        }
        
        
        NSString *jsonString = nil;
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:muDict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
            
            return @"";
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        
        return jsonString;
    }
    else if ([object isKindOfClass:[NSArray class]])
    {
        
        
        if([object count] >0)
        {
            NSString *jsonString = nil;
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                               options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                 error:&error];
            if (! jsonData) {
                NSLog(@"Got an error: %@", error);
                
                return @"";
            } else {
                jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            }
            
            
            return jsonString;
        }
        
        
        
    }
    
    return @"";
    
}

//#pragma mark————————————json字符串转NSDict
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    
    if([jsonString isKindOfClass:[NSDictionary class]])
    {
        
        return (NSDictionary *)jsonString;
        
    }
    
    
    
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}




#pragma mark——————————————音乐播放器
- (void)initPlayer:(NSString *)playUrl{
    
    
    NSString *url = [NSString stringWithFormat:@"%@",self.player.url];
    
    if([url isEqualToString:playUrl])
    {
        
        if([self.player isPlaying])
        {
            [self.player pause];//暂停
            
        }else
        {
            
            [self.player play];//播放
        }
        
    }else{
        
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:playUrl] error:nil];
        
        [self.player play];//播放
    }
    
    
}



#pragma mark——————————————音乐播放器(录制视频界面)
- (void)initPlayerToVedeo:(NSString *)playUrl{
    
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:playUrl] error:nil];
    
    
    [self.player play];//播放
    
    
}









#pragma mark————————————————屏幕中间弹出一个提示
+ (void)showTitle:(NSString *)title{
    
    
    UILabel *lable = [[UILabel alloc]init];
    
    lable.text = title;
    lable.frame = CGRectMake(0, 0, 40, 40);
    [lable sizeToFit];
    
    UIView *blurView = [self addBlurView:CGRectMake(_mainW/2/1.5 , _mainH-50 , lable.frame.size.width, lable.frame.size.height) WithStyle:UIBlurEffectStyleDark];
    
    [ZQTools viewFillet:blurView andFloat:4];
    
    
    
    [blurView addSubview: lable];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    lable.font = [UIFont systemFontOfSize:14];
    
    lable.textColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication ].keyWindow addSubview:blurView];
    
    
    
    
    __block NSInteger second = 1.5;
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            if (second >= 0) {
                
                
                second--;
            }
            else
            {
                
                
                [blurView removeFromSuperview];
                
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                
            }
        });
    });
    //启动源
    dispatch_resume(timer);
    
}






#pragma mark————————————————传入 秒  得到 xx:xx:xx
+(NSString *)getYYMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}

#pragma mark————————————————传入 秒  得到  xx分钟xx秒
+(NSString *)getMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    
    //NSLog(@"format_time : %@",format_time);
    
    return format_time;
    
}


//#pragma mark——————————————旋转播放器
//+ (void)rotateVideoView:(MPMoviePlayerViewController *)movePlayerViewController degrees:(NSInteger)degrees
//{
//    if(degrees==0||degrees==360) return;
//    if(degrees<0) degrees = (degrees % 360) + 360;
//    if(degrees>360) degrees = degrees % 360;
//    // MPVideoView在iOS8中Tag为1002，不排除苹果以后更改的可能性。参考递归查看View层次结构的lldb命令： (lldb) po [movePlayerViewController.view recursiveDescription]
//    UIView *videoView = [movePlayerViewController.view viewWithTag:1002];
//    if ([videoView isKindOfClass:NSClassFromString(@"MPVideoView")]) {
//        videoView.transform = CGAffineTransformMakeRotation(M_PI * degrees / 180.0);
//        videoView.frame = movePlayerViewController.view.bounds;
//    }
//}


#pragma mark—————————————— 获取视频方向
+ (NSUInteger)degressFromVideoFileWithURL:(NSURL *)url
{
    NSUInteger degress = 0;
    
    AVAsset *asset = [AVAsset assetWithURL:url];
    NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
    if([tracks count] > 0) {
        AVAssetTrack *videoTrack = [tracks objectAtIndex:0];
        CGAffineTransform t = videoTrack.preferredTransform;
        
        if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0){
            // Portrait
            degress = 90;
        }else if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0){
            // PortraitUpsideDown
            degress = 270;
        }else if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0){
            // LandscapeRight
            degress = 0;
        }else if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0){
            // LandscapeLeft
            degress = 180;
        }
    }
    
    return degress;
}









#pragma mark————————————————————苹果自带的md5加密
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}






#pragma mark————————————按钮倒计时
+ (void)daojishi:(NSInteger)miao  withButton:(UIButton *)button
{
    __block NSInteger second= miao;
    
    
    button.userInteractionEnabled = NO;
    
    
    
    NSString *buttonString = button.titleLabel.text;
    
    UIColor *btnColor = button.titleLabel.textColor;
    
    [button setTitle:@"哈哈" forState:UIControlStateNormal];
    
    
    
    [button setTitle:[NSString stringWithFormat:@"重新获取(%d)",60] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second > 0) {
                
                [button setTitle:[NSString stringWithFormat:@"重新获取(%ld)",(long)second] forState:UIControlStateNormal];
                
                
                
                second--;
                
                
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    button.userInteractionEnabled = YES;
                    
                    
                    
                    [button setTitle:buttonString forState:UIControlStateNormal];
                    
                    [button setTitleColor:btnColor forState:UIControlStateNormal];
                    
                });
                
                
            }
        });
    });
    //启动源
    dispatch_resume(timer);
    
    
}












#pragma mark————————————————下拉header放大
//scrollView    imgView下拉放大的view  headerView添加到底部不跟随放大的headerView
+ (void)headViewtoBigWithScoview:(UIScrollView *)scrollView  withImg:(UIView *)imgView withHeaderView:(UIView *)headerView
{
    //    [scrollView setBigView:imgView withHeaderView:headerView];
    
}



#pragma mark———————————— 是否包含某个字符串
+ (BOOL)isHaveStringWithString:(NSString *)str withHaveStr:(NSString *)isHaveStr
{
    
    if(str!=nil&&isHaveStr!=nil)
    {
        
        //判断roadTitleLab.text 是否含有qingjoin
        if([str rangeOfString:isHaveStr].location !=NSNotFound)//_roaldSearchText
        {
            
            return YES;
        }
        
    }
    
    
    
    return NO;
    
}


#pragma mark————————————————数据库操作 (详看https://github.com/netyouli/WHC_ModelSqliteKit)
/**
 * 说明: 存储模型到本地
 * @param model_object 模型对象
 */

+ (BOOL)insert:(id)model_object{
    
    
    
    return  [WHCSqlite insert:model_object];
    
}

/**
 * 说明: 查询本地模型对象
 * @param model_class 模型类
 * @param where 查询条件(查询语法和SQL where 查询语法一样，where为空则查询所有)
 * @return 查询模型对象数组
 */

+ (NSArray *)query:(Class)model_class where:(NSString *)where
{
    
    
    
    return [WHCSqlite query:model_class where:where];
    
    
}


/**
 * 说明: 删除本地模型对象
 * @param model_class 模型类
 * @param where 查询条件(查询语法和SQL where 查询语法一样，where为空则删除所有)
 */

+ (BOOL)remov:(Class)model_class where:(NSString *)where{
    
    return [WHCSqlite delete:model_class where:where];
    
}



#pragma mark—————————————判断字符串字符数
+  (int)charNumber_withStr:(NSString *)str{
    
    int strlength = 0;
    char* p = (char*)[str cStringUsingEncoding:NSUTF8StringEncoding];
    for (int i=0 ; i<[str lengthOfBytesUsingEncoding:NSUTF8StringEncoding] ;i++) {
        if (*p) {
            if(*p == '\xe4' || *p == '\xe5' || *p == '\xe6' || *p == '\xe7' || *p == '\xe8' || *p == '\xe9')
            {
                strlength--;
            }
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}


#pragma mark————————————获取本地json
+ (id)getFielJson:(NSString *)jsonName
{
    NSString *jsonStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jsonName ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];
    
    
    //因为后台给的json格式不对 在json前后加一个{}
    
    //    NSMutableString *muString = [NSMutableString string];
    //
    //    [muString appendString:@"{"];
    //
    //    [muString appendString:jsonStr];
    //
    //    [muString appendString:@"}"];
    //
    id jsonDic =  [self dictionaryWithJsonString:jsonStr];
    
    
    
    return jsonDic;
    
}

#pragma mark————————————初始化一个ID和类名都一样的vc
+ (UIViewController *)addVc_vcClassName:(NSString *)vcClassName
{
    
    
    return [[UIStoryboard storyboardWithName:vcClassName bundle:nil] instantiateViewControllerWithIdentifier:vcClassName];
    
    
}

#pragma mark————————————打开大图(依赖HJPhotoBrowser)
+ (void)instanceHJPhotoBrowser_withimgUrlArr:(NSArray *)urlArr with_placeholderImageArr:(NSArray *)placeholderImageArr  with_currentImageIndex:(NSInteger)currentImageIndex with_sourceImagesContainerView:(UIView *)sourceImagesContainerView
{
    [HJPhotoBrowser instanceHJPhotoBrowser_withimgUrlArr:urlArr with_placeholderImageArr:placeholderImageArr with_currentImageIndex:currentImageIndex with_sourceImagesContainerView:sourceImagesContainerView];
}



#pragma mark————————局部圆角
+ (void)LocalFillet:(UIView *)view withCorners:(UIRectCorner)corners withFilletSize:(CGSize)size

{

    //局部圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    view.layer.mask = maskLayer;

}


#pragma mark——————————————给view添加一个敲击手势
+ (void)viewAddTapWithView:(UIView *)view withTarget:(nullable id)target withAction:(nullable SEL)action
{
    
    view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
 
    [view addGestureRecognizer:singleRecognizer];

}

 

#pragma mark——————————以下功能基于TZImagePickerController框架
/** 相册 */
- (void)openAlbumWithMaxImgNumber:(int)maxNumber WithCuVc:(UIViewController *)cuVc  withOverBlock:(responseObjectBlock)dataBlock{
  
    
       dispatch_async(dispatch_get_main_queue(), ^{
           
            self.dataBlock =dataBlock;
            
            TZImagePickerController *imagePickController = [[TZImagePickerController alloc] initWithMaxImagesCount:maxNumber delegate:self];
         
            
            //是否 在相册中显示拍照按钮
             imagePickController.allowTakePicture = NO;
            //是否可以选择显示原图
             imagePickController.allowPickingOriginalPhoto = NO;
            //是否 在相册中可以选择视频
             imagePickController.allowPickingVideo = NO;
         
            [cuVc presentViewController: imagePickController animated:YES completion:nil];
           
      });
}

/** 相机 */
- (void)openCameraWithCuVc:(UIViewController *)cuVc withOverBlock:(responseObjectBlock)dataBlock{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.dataBlock =dataBlock;
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            picker.allowsEditing = YES;
            picker.sourceType = sourceType;
            [cuVc presentViewController:picker animated:YES completion:nil];
        }else{
            //        [UIAlertController showAlertWithTitle:@"该设备不支持拍照" message:nil actionTitles:@[@"确定"] cancelTitle:nil style:UIAlertControllerStyleAlert completion:nil];
            
            [ZQTools svpInfo:@"该设备不支持拍照"];
        }
        
    });
    

}

/** 录像 */
- (void)openVideotapeMaxTime:(int)maxTime WithCuVc:(UIViewController *)cuVc withOverBlock:(responseObjectBlock)dataBlock{
    
    
         dispatch_async(dispatch_get_main_queue(), ^{
             
             self.dataBlock =dataBlock;
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                NSArray * mediaTypes =[UIImagePickerController  availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.mediaTypes = mediaTypes;
                picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
                picker.videoQuality = UIImagePickerControllerQualityTypeMedium; //录像质量
                picker.videoMaximumDuration = maxTime;        //录像最长时间
                
                [cuVc presentViewController:picker animated:YES completion:nil];
            } else {
                [ZQTools svpInfo:@"该设备不支持录像"];
            }
         });
    
    
}

/** 视频 */
- (void)openVideoWithCuVc:(UIViewController *)cuVc withOverBlock:(responseObjectBlock)dataBlock{
    
        dispatch_async(dispatch_get_main_queue(), ^{
    
            self.dataBlock =dataBlock;
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
            picker.allowsEditing = NO;
            [cuVc presentViewController:picker animated:YES completion:nil];
        
      });
}

#pragma mark - UIImagePickerController Delegate
///拍照、选视频图片、录像 后的回调（这种方式选择视频时，会自动压缩，但是很耗时间）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
    
            [picker dismissViewControllerAnimated:YES completion:nil];
            
            //媒体类型
            NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
            //原图URL
            NSURL *imageAssetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
            
            ///视频 和 录像
            if ([mediaType isEqualToString:@"public.movie"]) {
                
                NSURL *videoAssetURL = [info objectForKey:UIImagePickerControllerMediaURL];
                
                if(self.dataBlock!=nil)
                {
                    self.dataBlock(videoAssetURL);
                
                }
              
            
            
            }
            
            else if ([mediaType isEqualToString:@"public.image"]) {
                
                UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
                //如果 picker 没有设置可编辑，那么image 为 nil
                if (image == nil) {
                    image = [info objectForKey:UIImagePickerControllerOriginalImage];
                }
                
                if(self.dataBlock!=nil)
                {
                    self.dataBlock(image);
                    
                }
         
            }
        
     });
}

#pragma mark - TZImagePickerController Delegate

//处理从相册单选或多选的照片
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    
            dispatch_async(dispatch_get_main_queue(), ^{
            
            if(self.dataBlock!=nil)
            {
                self.dataBlock(photos);
                
            }
    });
}

#pragma mark——————————手机号正则  YES or NO
+ (BOOL)phoneValiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    
    return NO;
}


- (void)luyim{

    __weak typeof(self) weak_self = self;
    
//    MOKORecordButton *recordButton = [MOKORecordButton buttonWithType:UIButtonTypeCustom];
//    MOKORecorderTool *recorder = [MOKORecorderTool sharedRecorder];
//    recorder.delegate = self;
//    recordButton.frame = CGRectMake(20, self.view.frame.size.height - 50, self.view.frame.size.width - 40, 40);
//    recordButton.backgroundColor = [UIColor whiteColor];
//    recordButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    recordButton.layer.cornerRadius = 4;
//    recordButton.clipsToBounds = YES;
//    [recordButton setTitle:@"按住 说话" forState:UIControlStateNormal];
//    [recordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [ addSubview:self.recordButton];
//    
//    
//    
//    //手指按下
//    self.recordButton.recordTouchDownAction = ^(MOKORecordButton *sender){
//        //如果用户没有开启麦克风权限,不能让其录音
//        if (![weak_self canRecord]) return;
//        
//        NSLog(@"开始录音");
//        if (sender.highlighted) {
//            sender.highlighted = YES;
//            [sender setButtonStateWithRecording];
//        }
//        [weak_self.recorder startRecording];
//        weak_self.currentRecordState = MOKORecordState_Recording;
//        [weak_self dispatchVoiceState];
//    };
//    
//    //手指抬起
//    self.recordButton.recordTouchUpInsideAction = ^(MOKORecordButton *sender){
//        NSLog(@"完成录音");
//        [sender setButtonStateWithNormal];
//        [weak_self.recorder stopRecording];
//        weak_self.currentRecordState = MOKORecordState_Normal;
//        [weak_self dispatchVoiceState];
//    };
//    
//    //手指滑出按钮
//    self.recordButton.recordTouchUpOutsideAction = ^(MOKORecordButton *sender){
//        NSLog(@"取消录音");
//        [sender setButtonStateWithNormal];
//        weak_self.currentRecordState = MOKORecordState_Normal;
//        [weak_self dispatchVoiceState];
//    };
//    
//    //中间状态  从 TouchDragInside ---> TouchDragOutside
//    self.recordButton.recordTouchDragExitAction = ^(MOKORecordButton *sender){
//        weak_self.currentRecordState = MOKORecordState_ReleaseToCancel;
//        [weak_self dispatchVoiceState];
//    };
//    
//    //中间状态  从 TouchDragOutside ---> TouchDragInside
//    self.recordButton.recordTouchDragEnterAction = ^(MOKORecordButton *sender){
//        NSLog(@"继续录音");
//        weak_self.currentRecordState = MOKORecordState_Recording;
//        [weak_self dispatchVoiceState];
//    };

}



//判断是否允许使用麦克风7.0新增的方法requestRecordPermission
-(BOOL)canRecord
{
    __block BOOL bCanRecord = YES;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
            if (granted) {
                bCanRecord = YES;
            }
            else {
                bCanRecord = NO;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:nil
                                                message:@"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"
                                               delegate:nil
                                      cancelButtonTitle:@"关闭"
                                      otherButtonTitles:nil] show];
                });
            }
        }];
    }
    return bCanRecord;
}
+(NSString *)PhoneModel:(NSString *)phoneStr{
    NSString *phone=[NSString stringWithFormat:@"%@****%@",[phoneStr substringToIndex:3],[[phoneStr substringFromIndex:7] substringToIndex:4]];
    return phone;
}

+ (NSString *)positiveFormat:(NSString *)text{
    
    if(!text || [text floatValue] == 0){
        return @"0.00";
    }else{
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setPositiveFormat:@",###.00;"];
        return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    }
    return @"";
}

+(BOOL)charIsNil:(NSString *)str{
    
    if ([str isKindOfClass:[NSNull class]]||[str isEqualToString:@""]||str==nil) {
        return YES;
    }
    return  NO;
}

#pragma mark————————————模糊效果(类似玻璃,依赖CoreBlurView)
+ (void)addBlurWithView:(UIView *)inView
{
    
    CoreBlurView *blurView = [[CoreBlurView alloc] initWithFrame:inView.bounds];
    
    
    //开启动态模糊
    blurView.blurEnabled = YES;
    
    blurView.dynamic =NO;
    
    blurView.blurRadius = 16;
    
    blurView.tintColor = [UIColor clearColor];
    
    blurView.underlyingView = inView.window;
    
    
    [inView addSubview:blurView];
    
    
    
}



+(UIImage *)createNonInterpolatedUIImageFormString:(NSString*)Path withSize:(CGFloat) size
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认
    [filter setDefaults];
    NSString *dataString =Path;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    // 4.获取输出的二维码
    CIImage * outputImage= [filter outputImage];
    CGRect extent = CGRectIntegral(outputImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:outputImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+(UIImage *) getImageFromURL:(NSString *)fileURL {
    
    NSLog(@"执行图片下载函数");
    
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    
    return result;
    
}
+ (NSString *)getBankName:(NSString*) cardId{
    
    
    
    //"发卡行.卡种名称",

    NSArray* bankName = @[@"邮储银行·绿卡通" , @"邮储银行·绿卡银联标准卡" , @"邮储银行·绿卡银联标准卡" , @"邮储银行·绿卡专用卡" , @"邮储银行·绿卡银联标准卡",@"邮储银行·绿卡(银联卡)" , @"邮储银行·绿卡VIP卡" , @"邮储银行·银联标准卡" , @"邮储银行·中职学生资助卡" , @"邮政储蓄银行·IC绿卡通VIP卡",@"邮政储蓄银行·IC绿卡通" , @"邮政储蓄银行·IC联名卡" , @"邮政储蓄银行·IC预付费卡" , @"邮储银行·绿卡银联标准卡" , @"邮储银行·绿卡通",@"邮政储蓄银行·武警军人保障卡" , @"邮政储蓄银行·中国旅游卡（金卡）" , @"邮政储蓄银行·普通高中学生资助卡" , @"邮政储蓄银行·中国旅游卡（普卡）",@"邮政储蓄银行·福农卡" , @"工商银行·牡丹运通卡金卡" , @"工商银行·牡丹运通卡金卡" , @"工商银行·牡丹运通卡金卡" , @"工商银行·牡丹VISA卡(单位卡)",@"工商银行·牡丹VISA信用卡" , @"工商银行·牡丹VISA卡(单位卡)" , @"工商银行·牡丹VISA信用卡" , @"工商银行·牡丹VISA信用卡" , @"工商银行·牡丹VISA信用卡",@"工商银行·牡丹VISA信用卡" , @"工商银行·牡丹运通卡普通卡" , @"工商银行·牡丹VISA信用卡" , @"工商银行·牡丹VISA白金卡" , @"工商银行·牡丹贷记卡(银联卡)",@"工商银行·牡丹贷记卡(银联卡)" , @"工商银行·牡丹贷记卡(银联卡)" , @"工商银行·牡丹贷记卡(银联卡)" , @"工商银行·牡丹欧元卡" , @"工商银行·牡丹欧元卡",@"工商银行·牡丹欧元卡" , @"工商银行·牡丹万事达国际借记卡" , @"工商银行·牡丹VISA信用卡" , @"工商银行·海航信用卡" , @"工商银行·牡丹VISA信用卡", @"工商银行·牡丹万事达信用卡" , @"工商银行·牡丹万事达信用卡" , @"工商银行·牡丹万事达信用卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹万事达白金卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·海航信用卡个人普卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡", @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡", @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡", @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡",@"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·E时代卡" , @"工商银行·E时代卡" , @"工商银行·理财金卡" , @"工商银行·准贷记卡(个普)" , @"工商银行·准贷记卡(个普)" , @"工商银行·准贷记卡(个普)" , @"工商银行·准贷记卡(个普)" , @"工商银行·准贷记卡(个普)" , @"工商银行·牡丹灵通卡" , @"工商银行·准贷记卡(商普)" , @"工商银行·牡丹卡(商务卡)" , @"工商银行·准贷记卡(商金)" , @"工商银行·牡丹卡(商务卡)" , @"工商银行·贷记卡(个普)" , @"工商银行·牡丹卡(个人卡)" , @"工商银行·牡丹卡(个人卡)" , @"工商银行·牡丹卡(个人卡)" , @"工商银行·牡丹卡(个人卡)" , @"工商银行·贷记卡(个金)" , @"工商银行·牡丹交通卡" , @"工商银行·准贷记卡(个金)" , @"工商银行·牡丹交通卡" , @"工商银行·贷记卡(商普)" , @"工商银行·贷记卡(商金)" , @"工商银行·牡丹卡(商务卡)" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹交通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹灵通卡" , @"工商银行·牡丹贷记卡" , @"工商银行·牡丹贷记卡" , @"工商银行·牡丹贷记卡" , @"工商银行·牡丹贷记卡" , @"工商银行·牡丹灵通卡" , @"工商银行·中央预算单位公务卡" , @"工商银行·牡丹灵通卡" , @"工商银行·财政预算单位公务卡" , @"工商银行·牡丹卡白金卡" , @"工商银行·牡丹卡普卡" , @"工商银行·国航知音牡丹信用卡" , @"工商银行·国航知音牡丹信用卡" , @"工商银行·国航知音牡丹信用卡" , @"工商银行·国航知音牡丹信用卡" , @"工商银行·银联标准卡" , @"工商银行·中职学生资助卡" , @"工商银行·专用信用消费卡" , @"工商银行·牡丹社会保障卡" , @"中国工商银行·牡丹东航联名卡" , @"中国工商银行·牡丹东航联名卡" , @"中国工商银行·牡丹运通白金卡" , @"中国工商银行·福农灵通卡" , @"中国工商银行·福农灵通卡" , @"工商银行·灵通卡" , @"工商银行·灵通卡" , @"中国工商银行·中国旅行卡" , @"工商银行·牡丹卡普卡" , @"工商银行·国际借记卡" , @"工商银行·国际借记卡" , @"工商银行·国际借记卡" , @"工商银行·国际借记卡" , @"中国工商银行·牡丹JCB信用卡" , @"中国工商银行·牡丹JCB信用卡" , @"中国工商银行·牡丹JCB信用卡" , @"中国工商银行·牡丹JCB信用卡" , @"中国工商银行·牡丹多币种卡" , @"中国工商银行·武警军人保障卡" , @"工商银行·预付芯片卡" , @"工商银行·理财金账户金卡" , @"工商银行·灵通卡" , @"工商银行·牡丹宁波市民卡" , @"中国工商银行·中国旅游卡" , @"中国工商银行·中国旅游卡" , @"中国工商银行·中国旅游卡" , @"中国工商银行·借记卡" , @"中国工商银行·借贷合一卡" , @"中国工商银行·普通高中学生资助卡" , @"中国工商银行·牡丹多币种卡" , @"中国工商银行·牡丹多币种卡" , @"中国工商银行·牡丹百夫长信用卡" , @"中国工商银行·牡丹百夫长信用卡" , @"工商银行·工银财富卡" , @"中国工商银行·中小商户采购卡" , @"中国工商银行·中小商户采购卡" , @"中国工商银行·环球旅行金卡" , @"中国工商银行·环球旅行白金卡" , @"中国工商银行·牡丹工银大来卡" , @"中国工商银行·牡丹工银大莱卡" , @"中国工商银行·IC金卡" , @"中国工商银行·IC白金卡" , @"中国工商银行·工行IC卡（红卡）" , @"中国工商银行布鲁塞尔分行·借记卡" , @"中国工商银行布鲁塞尔分行·预付卡" , @"中国工商银行布鲁塞尔分行·预付卡" , @"中国工商银行金边分行·借记卡" , @"中国工商银行金边分行·信用卡" , @"中国工商银行金边分行·借记卡" , @"中国工商银行金边分行·信用卡" , @"中国工商银行加拿大分行·借记卡" , @"中国工商银行加拿大分行·借记卡" , @"中国工商银行加拿大分行·预付卡" , @"中国工商银行巴黎分行·借记卡" , @"中国工商银行巴黎分行·借记卡" , @"中国工商银行巴黎分行·贷记卡" , @"中国工商银行法兰克福分行·贷记卡" , @"中国工商银行法兰克福分行·借记卡" , @"中国工商银行法兰克福分行·贷记卡" , @"中国工商银行法兰克福分行·贷记卡" , @"中国工商银行法兰克福分行·借记卡" , @"中国工商银行法兰克福分行·预付卡" , @"中国工商银行法兰克福分行·预付卡" , @"中国工商银行印尼分行·借记卡" , @"中国工商银行印尼分行·信用卡" , @"中国工商银行米兰分行·借记卡" , @"中国工商银行米兰分行·预付卡" , @"中国工商银行米兰分行·预付卡" , @"中国工商银行阿拉木图子行·借记卡" , @"中国工商银行阿拉木图子行·贷记卡" , @"中国工商银行阿拉木图子行·借记卡" , @"中国工商银行阿拉木图子行·预付卡" , @"中国工商银行万象分行·借记卡" , @"中国工商银行万象分行·贷记卡" , @"中国工商银行卢森堡分行·借记卡" , @"中国工商银行卢森堡分行·贷记卡" , @"中国工商银行澳门分行·E时代卡" , @"中国工商银行澳门分行·E时代卡" , @"中国工商银行澳门分行·E时代卡" , @"中国工商银行澳门分行·理财金账户" , @"中国工商银行澳门分行·理财金账户" , @"中国工商银行澳门分行·理财金账户" , @"中国工商银行澳门分行·预付卡" , @"中国工商银行澳门分行·预付卡" , @"中国工商银行澳门分行·工银闪付预付卡" , @"中国工商银行澳门分行·工银银联公司卡" , @"中国工商银行澳门分行·Diamond" , @"中国工商银行阿姆斯特丹·借记卡" , @"中国工商银行卡拉奇分行·借记卡" , @"中国工商银行卡拉奇分行·贷记卡" , @"中国工商银行新加坡分行·贷记卡" , @"中国工商银行新加坡分行·贷记卡" , @"中国工商银行新加坡分行·借记卡" , @"中国工商银行新加坡分行·预付卡" , @"中国工商银行新加坡分行·预付卡" , @"中国工商银行新加坡分行·借记卡" , @"中国工商银行新加坡分行·借记卡" , @"中国工商银行马德里分行·借记卡" , @"中国工商银行马德里分行·借记卡" , @"中国工商银行马德里分行·预付卡" , @"中国工商银行马德里分行·预付卡" , @"中国工商银行伦敦子行·借记卡" , @"中国工商银行伦敦子行·工银伦敦借记卡" , @"中国工商银行伦敦子行·借记卡" , @"农业银行·金穗贷记卡" , @"农业银行·中国旅游卡" , @"农业银行·普通高中学生资助卡" , @"农业银行·银联标准卡" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·VISA白金卡" , @"农业银行·万事达白金卡" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡(银联卡)" , @"农业银行·金穗贷记卡" , @"农业银行·中职学生资助卡" , @"农业银行·专用惠农卡" , @"农业银行·武警军人保障卡" , @"农业银行·金穗校园卡(银联卡)" , @"农业银行·金穗星座卡(银联卡)" , @"农业银行·金穗社保卡(银联卡)" , @"农业银行·金穗旅游卡(银联卡)" , @"农业银行·金穗青年卡(银联卡)" , @"农业银行·复合介质金穗通宝卡" , @"农业银行·金穗海通卡" , @"农业银行·退役金卡" , @"农业银行·金穗贷记卡" , @"农业银行·金穗贷记卡" , @"农业银行·金穗通宝卡(银联卡)" , @"农业银行·金穗惠农卡" , @"农业银行·金穗通宝银卡" , @"农业银行·金穗通宝卡(银联卡)" , @"农业银行·金穗通宝卡(银联卡)" , @"农业银行·金穗通宝卡" , @"农业银行·金穗通宝卡(银联卡)" , @"农业银行·金穗通宝卡(银联卡)" , @"农业银行·金穗通宝钻石卡" , @"农业银行·掌尚钱包" , @"农业银行·银联IC卡金卡" , @"农业银行·银联预算单位公务卡金卡" , @"农业银行·银联IC卡白金卡" , @"农业银行·金穗公务卡" , @"中国农业银行贷记卡·IC普卡" , @"中国农业银行贷记卡·IC金卡" , @"中国农业银行贷记卡·澳元卡" , @"中国农业银行贷记卡·欧元卡" , @"中国农业银行贷记卡·金穗通商卡" , @"中国农业银行贷记卡·金穗通商卡" , @"中国农业银行贷记卡·银联白金卡" , @"中国农业银行贷记卡·中国旅游卡" , @"中国农业银行贷记卡·银联IC公务卡" , @"宁波市农业银行·市民卡B卡" , @"中国银行·联名卡" , @"中国银行·个人普卡" , @"中国银行·个人金卡" , @"中国银行·员工普卡" , @"中国银行·员工金卡" , @"中国银行·理财普卡" , @"中国银行·理财金卡" , @"中国银行·理财银卡" , @"中国银行·理财白金卡" , @"中国银行·中行金融IC卡白金卡" , @"中国银行·中行金融IC卡普卡" , @"中国银行·中行金融IC卡金卡" , @"中国银行·中银JCB卡金卡" , @"中国银行·中银JCB卡普卡" , @"中国银行·员工普卡" , @"中国银行·个人普卡" , @"中国银行·中银威士信用卡员" , @"中国银行·中银威士信用卡员" , @"中国银行·个人白金卡" , @"中国银行·中银威士信用卡" , @"中国银行·长城公务卡" , @"中国银行·长城电子借记卡" , @"中国银行·中银万事达信用卡" , @"中国银行·中银万事达信用卡" , @"中国银行·中银万事达信用卡" , @"中国银行·中银万事达信用卡" , @"中国银行·中银万事达信用卡" , @"中国银行·中银威士信用卡员" , @"中国银行·长城万事达信用卡" , @"中国银行·长城万事达信用卡" , @"中国银行·长城万事达信用卡" , @"中国银行·长城万事达信用卡" , @"中国银行·长城万事达信用卡" , @"中国银行·中银奥运信用卡" , @"中国银行·长城信用卡" , @"中国银行·长城信用卡" , @"中国银行·长城信用卡" , @"中国银行·长城万事达信用卡" , @"中国银行·长城公务卡" , @"中国银行·长城公务卡" , @"中国银行·中银万事达信用卡" , @"中国银行·中银万事达信用卡" , @"中国银行·长城人民币信用卡" , @"中国银行·长城人民币信用卡" , @"中国银行·长城人民币信用卡" , @"中国银行·长城信用卡" , @"中国银行·长城人民币信用卡" , @"中国银行·长城人民币信用卡" , @"中国银行·长城信用卡" , @"中国银行·银联单币贷记卡" , @"中国银行·长城信用卡" , @"中国银行·长城信用卡" , @"中国银行·长城信用卡" , @"中国银行·长城电子借记卡" , @"中国银行·长城人民币信用卡" , @"中国银行·银联标准公务卡" , @"中国银行·一卡双账户普卡" , @"中国银行·财互通卡" , @"中国银行·电子现金卡" , @"中国银行·长城人民币信用卡" , @"中国银行·长城单位信用卡普卡" , @"中国银行·中银女性主题信用卡" , @"中国银行·长城单位信用卡金卡" , @"中国银行·白金卡" , @"中国银行·中职学生资助卡" , @"中国银行·银联标准卡" , @"中国银行·金融IC卡" , @"中国银行·长城社会保障卡" , @"中国银行·世界卡" , @"中国银行·社保联名卡" , @"中国银行·社保联名卡" , @"中国银行·医保联名卡" , @"中国银行·医保联名卡" , @"中国银行·公司借记卡" , @"中国银行·银联美运顶级卡" , @"中国银行·长城福农借记卡金卡" , @"中国银行·长城福农借记卡普卡" , @"中国银行·中行金融IC卡普卡" , @"中国银行·中行金融IC卡金卡" , @"中国银行·中行金融IC卡白金卡" , @"中国银行·长城银联公务IC卡白金卡" , @"中国银行·中银旅游信用卡" , @"中国银行·长城银联公务IC卡金卡" , @"中国银行·中国旅游卡" , @"中国银行·武警军人保障卡" , @"中国银行·社保联名借记IC卡" , @"中国银行·社保联名借记IC卡" , @"中国银行·医保联名借记IC卡" , @"中国银行·医保联名借记IC卡" , @"中国银行·借记IC个人普卡" , @"中国银行·借记IC个人金卡" , @"中国银行·借记IC个人普卡" , @"中国银行·借记IC白金卡" , @"中国银行·借记IC钻石卡" , @"中国银行·借记IC联名卡" , @"中国银行·普通高中学生资助卡" , @"中国银行·长城环球通港澳台旅游金卡" , @"中国银行·长城环球通港澳台旅游白金卡" , @"中国银行·中银福农信用卡" , @"中国银行金边分行·借记卡" , @"中国银行雅加达分行·借记卡" , @"中国银行首尔分行·借记卡" , @"中国银行澳门分行·人民币信用卡" , @"中国银行澳门分行·人民币信用卡" , @"中国银行澳门分行·中银卡" , @"中国银行澳门分行·中银卡" , @"中国银行澳门分行·中银卡" , @"中国银行澳门分行·中银银联双币商务卡" , @"中国银行澳门分行·预付卡" , @"中国银行澳门分行·澳门中国银行银联预付卡" , @"中国银行澳门分行·澳门中国银行银联预付卡" , @"中国银行澳门分行·熊猫卡" , @"中国银行澳门分行·财富卡" , @"中国银行澳门分行·银联港币卡" , @"中国银行澳门分行·银联澳门币卡" , @"中国银行马尼拉分行·双币种借记卡" , @"中国银行胡志明分行·借记卡" , @"中国银行曼谷分行·借记卡" , @"中国银行曼谷分行·长城信用卡环球通" , @"中国银行曼谷分行·借记卡" , @"建设银行·龙卡准贷记卡" , @"建设银行·龙卡准贷记卡金卡" , @"建设银行·中职学生资助卡" , @"建设银行·乐当家银卡VISA" , @"建设银行·乐当家金卡VISA" , @"建设银行·乐当家白金卡" , @"建设银行·龙卡普通卡VISA" , @"建设银行·龙卡储蓄卡" , @"建设银行·VISA准贷记卡(银联卡)" , @"建设银行·VISA准贷记金卡" , @"建设银行·乐当家" , @"建设银行·乐当家" , @"建设银行·准贷记金卡" , @"建设银行·乐当家白金卡" , @"建设银行·金融复合IC卡" , @"建设银行·银联标准卡" , @"建设银行·银联理财钻石卡" , @"建设银行·金融IC卡" , @"建设银行·理财白金卡" , @"建设银行·社保IC卡" , @"建设银行·财富卡私人银行卡" , @"建设银行·理财金卡" , @"建设银行·福农卡" , @"建设银行·武警军人保障卡" , @"建设银行·龙卡通" , @"建设银行·银联储蓄卡" , @"建设银行·龙卡储蓄卡(银联卡)" , @"建设银行·准贷记卡" , @"建设银行·理财白金卡" , @"建设银行·理财金卡" , @"建设银行·准贷记卡普卡" , @"建设银行·准贷记卡金卡" , @"建设银行·龙卡信用卡" , @"建设银行·建行陆港通龙卡" , @"中国建设银行·普通高中学生资助卡" , @"中国建设银行·中国旅游卡" , @"中国建设银行·龙卡JCB金卡" , @"中国建设银行·龙卡JCB白金卡" , @"中国建设银行·龙卡JCB普卡" , @"中国建设银行·龙卡贷记卡公司卡" , @"中国建设银行·龙卡贷记卡" , @"中国建设银行·龙卡国际普通卡VISA" , @"中国建设银行·龙卡国际金卡VISA" , @"中国建设银行·VISA白金信用卡" , @"中国建设银行·龙卡国际白金卡" , @"中国建设银行·龙卡国际普通卡MASTER" , @"中国建设银行·龙卡国际金卡MASTER" , @"中国建设银行·龙卡万事达金卡" , @"中国建设银行·龙卡贷记卡" , @"中国建设银行·龙卡万事达白金卡" , @"中国建设银行·龙卡贷记卡" , @"中国建设银行·龙卡万事达信用卡" , @"中国建设银行·龙卡人民币信用卡" , @"中国建设银行·龙卡人民币信用金卡" , @"中国建设银行·龙卡人民币白金卡" , @"中国建设银行·龙卡IC信用卡普卡" , @"中国建设银行·龙卡IC信用卡金卡" , @"中国建设银行·龙卡IC信用卡白金卡" , @"中国建设银行·龙卡银联公务卡普卡" , @"中国建设银行·龙卡银联公务卡金卡" , @"中国建设银行·中国旅游卡" , @"中国建设银行·中国旅游卡" , @"中国建设银行·龙卡IC公务卡" , @"中国建设银行·龙卡IC公务卡" , @"交通银行·交行预付卡" , @"交通银行·世博预付IC卡" , @"交通银行·太平洋互连卡" , @"交通银行·太平洋万事顺卡" , @"交通银行·太平洋互连卡(银联卡)" , @"交通银行·太平洋白金信用卡" , @"交通银行·太平洋双币贷记卡" , @"交通银行·太平洋双币贷记卡" , @"交通银行·太平洋双币贷记卡" , @"交通银行·太平洋白金信用卡" , @"交通银行·太平洋双币贷记卡" , @"交通银行·太平洋万事顺卡" , @"交通银行·太平洋人民币贷记卡" , @"交通银行·太平洋人民币贷记卡" , @"交通银行·太平洋双币贷记卡" , @"交通银行·太平洋准贷记卡" , @"交通银行·太平洋准贷记卡" , @"交通银行·太平洋准贷记卡" , @"交通银行·太平洋准贷记卡" , @"交通银行·太平洋借记卡" , @"交通银行·太平洋借记卡" , @"交通银行·太平洋人民币贷记卡" , @"交通银行·太平洋借记卡" , @"交通银行·太平洋MORE卡" , @"交通银行·白金卡" , @"交通银行·交通银行公务卡普卡" , @"交通银行·太平洋人民币贷记卡" , @"交通银行·太平洋互连卡" , @"交通银行·太平洋借记卡" , @"交通银行·太平洋万事顺卡" , @"交通银行·太平洋贷记卡(银联卡)" , @"交通银行·太平洋贷记卡(银联卡)" , @"交通银行·太平洋贷记卡(银联卡)" , @"交通银行·太平洋贷记卡(银联卡)" , @"交通银行·交通银行公务卡金卡" , @"交通银行·交银IC卡" , @"交通银行香港分行·交通银行港币借记卡" , @"交通银行香港分行·港币礼物卡" , @"交通银行香港分行·双币种信用卡" , @"交通银行香港分行·双币种信用卡" , @"交通银行香港分行·双币卡" , @"交通银行香港分行·银联人民币卡" , @"交通银行澳门分行·银联借记卡" , @"中信银行·中信借记卡" , @"中信银行·中信借记卡" , @"中信银行·中信国际借记卡" , @"中信银行·中信国际借记卡" , @"中信银行·中国旅行卡" , @"中信银行·中信借记卡(银联卡)" , @"中信银行·中信借记卡(银联卡)" , @"中信银行·中信贵宾卡(银联卡)" , @"中信银行·中信理财宝金卡" , @"中信银行·中信理财宝白金卡" , @"中信银行·中信钻石卡" , @"中信银行·中信钻石卡" , @"中信银行·中信借记卡" , @"中信银行·中信理财宝(银联卡)" , @"中信银行·中信理财宝(银联卡)" , @"中信银行·中信理财宝(银联卡)" , @"中信银行·借记卡" , @"中信银行·理财宝IC卡" , @"中信银行·理财宝IC卡" , @"中信银行·理财宝IC卡" , @"中信银行·理财宝IC卡" , @"中信银行·理财宝IC卡" , @"中信银行·主账户复合电子现金卡" , @"光大银行·阳光商旅信用卡" , @"光大银行·阳光商旅信用卡" , @"光大银行·阳光商旅信用卡" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·阳光卡(银联卡)" , @"光大银行·借记卡普卡" , @"光大银行·社会保障IC卡" , @"光大银行·IC借记卡普卡" , @"光大银行·手机支付卡" , @"光大银行·联名IC卡普卡" , @"光大银行·借记IC卡白金卡" , @"光大银行·借记IC卡金卡" , @"光大银行·阳光旅行卡" , @"光大银行·借记IC卡钻石卡" , @"光大银行·联名IC卡金卡" , @"光大银行·联名IC卡白金卡" , @"光大银行·联名IC卡钻石卡" , @"华夏银行·华夏卡(银联卡)" , @"华夏银行·华夏白金卡" , @"华夏银行·华夏普卡" , @"华夏银行·华夏金卡" , @"华夏银行·华夏白金卡" , @"华夏银行·华夏钻石卡" , @"华夏银行·华夏卡(银联卡)" , @"华夏银行·华夏至尊金卡(银联卡)" , @"华夏银行·华夏丽人卡(银联卡)" , @"华夏银行·华夏万通卡" , @"民生银行·民生借记卡(银联卡)" , @"民生银行·民生银联借记卡－金卡" , @"民生银行·钻石卡" , @"民生银行·民生借记卡(银联卡)" , @"民生银行·民生借记卡(银联卡)" , @"民生银行·民生借记卡(银联卡)" , @"民生银行·民生借记卡" , @"民生银行·民生国际卡" , @"民生银行·民生国际卡(银卡)" , @"民生银行·民生国际卡(欧元卡)" , @"民生银行·民生国际卡(澳元卡)" , @"民生银行·民生国际卡" , @"民生银行·民生国际卡" , @"民生银行·薪资理财卡" , @"民生银行·借记卡普卡" , @"民生银行·民生MasterCard" , @"民生银行·民生MasterCard" , @"民生银行·民生MasterCard" , @"民生银行·民生MasterCard" , @"民生银行·民生JCB信用卡" , @"民生银行·民生JCB金卡" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生JCB普卡" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生信用卡(银联卡)" , @"民生银行·民生信用卡(银联卡)" , @"民生银行·民生银联白金信用卡" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生银联个人白金卡" , @"民生银行·公务卡金卡" , @"民生银行·民生贷记卡(银联卡)" , @"民生银行·民生银联商务信用卡" , @"民生银行·民VISA无限卡" , @"民生银行·民生VISA商务白金卡" , @"民生银行·民生万事达钛金卡" , @"民生银行·民生万事达世界卡" , @"民生银行·民生万事达白金公务卡" , @"民生银行·民生JCB白金卡" , @"民生银行·银联标准金卡" , @"民生银行·银联芯片普卡" , @"民生银行·民生运通双币信用卡普卡" , @"民生银行·民生运通双币信用卡金卡" , @"民生银行·民生运通双币信用卡钻石卡" , @"民生银行·民生运通双币标准信用卡白金卡" , @"民生银行·银联芯片金卡" , @"民生银行·银联芯片白金卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·两地一卡通" , @"招商银行·招行国际卡(银联卡)" , @"招商银行·招商银行信用卡" , @"招商银行·VISA商务信用卡" , @"招商银行·招行国际卡(银联卡)" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招行国际卡(银联卡)" , @"招商银行·世纪金花联名信用卡" , @"招商银行·招行国际卡(银联卡)" , @"招商银行·招商银行信用卡" , @"招商银行·万事达信用卡" , @"招商银行·万事达信用卡" , @"招商银行·万事达信用卡" , @"招商银行·万事达信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·一卡通(银联卡)" , @"招商银行·万事达信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·招商银行信用卡" , @"招商银行·一卡通(银联卡)" , @"招商银行·公司卡(银联卡)" , @"招商银行·金卡" , @"招商银行·招行一卡通" , @"招商银行·招行一卡通" , @"招商银行·万事达信用卡" , @"招商银行·金葵花卡" , @"招商银行·电子现金卡" , @"招商银行·银联IC普卡" , @"招商银行·银联IC金卡" , @"招商银行·银联金葵花IC卡" , @"招商银行·IC公务卡" , @"招商银行·招商银行信用卡" , @"招商银行信用卡中心·美国运通绿卡" , @"招商银行信用卡中心·美国运通金卡" , @"招商银行信用卡中心·美国运通商务绿卡" , @"招商银行信用卡中心·美国运通商务金卡" , @"招商银行信用卡中心·VISA信用卡" , @"招商银行信用卡中心·MASTER信用卡" , @"招商银行信用卡中心·MASTER信用金卡" , @"招商银行信用卡中心·银联标准公务卡(金卡)" , @"招商银行信用卡中心·VISA信用卡" , @"招商银行信用卡中心·银联标准财政公务卡" , @"招商银行信用卡中心·芯片IC信用卡" , @"招商银行信用卡中心·芯片IC信用卡" , @"招商银行香港分行·香港一卡通" , @"兴业银行·兴业卡(银联卡)" , @"兴业银行·兴业卡(银联标准卡)" , @"兴业银行·兴业自然人生理财卡" , @"兴业银行·兴业智能卡(银联卡)" , @"兴业银行·兴业智能卡" , @"兴业银行·visa标准双币个人普卡" , @"兴业银行·VISA商务普卡" , @"兴业银行·VISA商务金卡" , @"兴业银行·VISA运动白金信用卡" , @"兴业银行·万事达信用卡(银联卡)" , @"兴业银行·VISA信用卡(银联卡)" , @"兴业银行·加菲猫信用卡" , @"兴业银行·个人白金卡" , @"兴业银行·银联信用卡(银联卡)" , @"兴业银行·银联信用卡(银联卡)" , @"兴业银行·银联白金信用卡" , @"兴业银行·银联标准公务卡" , @"兴业银行·VISA信用卡(银联卡)" , @"兴业银行·万事达信用卡(银联卡)" , @"兴业银行·银联标准贷记普卡" , @"兴业银行·银联标准贷记金卡" , @"兴业银行·银联标准贷记金卡" , @"兴业银行·银联标准贷记金卡" , @"兴业银行·兴业信用卡" , @"兴业银行·兴业信用卡" , @"兴业银行·兴业信用卡" , @"兴业银行·银联标准贷记普卡" , @"兴业银行·银联标准贷记普卡" , @"兴业银行·兴业芯片普卡" , @"兴业银行·兴业芯片金卡" , @"兴业银行·兴业芯片白金卡" , @"兴业银行·兴业芯片钻石卡" , @"浦东发展银行·浦发JCB金卡" , @"浦东发展银行·浦发JCB白金卡" , @"浦东发展银行·信用卡VISA普通" , @"浦东发展银行·信用卡VISA金卡" , @"浦东发展银行·浦发银行VISA年青卡" , @"浦东发展银行·VISA白金信用卡" , @"浦东发展银行·浦发万事达白金卡" , @"浦东发展银行·浦发JCB普卡" , @"浦东发展银行·浦发万事达金卡" , @"浦东发展银行·浦发万事达普卡" , @"浦东发展银行·浦发单币卡" , @"浦东发展银行·浦发银联单币麦兜普卡" , @"浦东发展银行·东方轻松理财卡" , @"浦东发展银行·东方-轻松理财卡普卡" , @"浦东发展银行·东方轻松理财卡" , @"浦东发展银行·东方轻松理财智业金卡" , @"浦东发展银行·东方卡(银联卡)" , @"浦东发展银行·东方卡(银联卡)" , @"浦东发展银行·东方卡(银联卡)" , @"浦东发展银行·公务卡金卡" , @"浦东发展银行·公务卡普卡" , @"浦东发展银行·东方卡" , @"浦东发展银行·东方卡" , @"浦东发展银行·浦发单币卡" , @"浦东发展银行·浦发联名信用卡" , @"浦东发展银行·浦发银联白金卡" , @"浦东发展银行·轻松理财普卡" , @"浦东发展银行·移动联名卡" , @"浦东发展银行·轻松理财消贷易卡" , @"浦东发展银行·轻松理财普卡（复合卡）" , @"浦东发展银行·贷记卡" , @"浦东发展银行·贷记卡" , @"浦东发展银行·东方借记卡（复合卡）" , @"浦东发展银行·电子现金卡（IC卡）" , @"浦东发展银行·移动浦发联名卡" , @"浦东发展银行·东方-标准准贷记卡" , @"浦东发展银行·轻松理财金卡（复合卡）" , @"浦东发展银行·轻松理财白金卡（复合卡）" , @"浦东发展银行·轻松理财钻石卡（复合卡）" , @"浦东发展银行·东方卡" , @"恒丰银行·九州IC卡" , @"恒丰银行·九州借记卡(银联卡)" , @"恒丰银行·九州借记卡(银联卡)" , @"天津市商业银行·银联卡(银联卡)" , @"烟台商业银行·金通卡" , @"潍坊银行·鸢都卡(银联卡)" , @"潍坊银行·鸳都卡(银联卡)" , @"临沂商业银行·沂蒙卡(银联卡)" , @"临沂商业银行·沂蒙卡(银联卡)" , @"日照市商业银行·黄海卡" , @"日照市商业银行·黄海卡(银联卡)" , @"浙商银行·商卡" , @"浙商银行·商卡" , @"渤海银行·浩瀚金卡" , @"渤海银行·渤海银行借记卡" , @"渤海银行·金融IC卡" , @"渤海银行·渤海银行公司借记卡" , @"星展银行·星展银行借记卡" , @"星展银行·星展银行借记卡" , @"恒生银行·恒生通财卡" , @"恒生银行·恒生优越通财卡" , @"新韩银行·新韩卡" , @"上海银行·慧通钻石卡" , @"上海银行·慧通金卡" , @"上海银行·私人银行卡" , @"上海银行·综合保险卡" , @"上海银行·申卡社保副卡(有折)" , @"上海银行·申卡社保副卡(无折)" , @"上海银行·白金IC借记卡" , @"上海银行·慧通白金卡(配折)" , @"上海银行·慧通白金卡(不配折)" , @"上海银行·申卡(银联卡)" , @"上海银行·申卡借记卡" , @"上海银行·银联申卡(银联卡)" , @"上海银行·单位借记卡" , @"上海银行·首发纪念版IC卡" , @"上海银行·申卡贷记卡" , @"上海银行·申卡贷记卡" , @"上海银行·J分期付款信用卡" , @"上海银行·申卡贷记卡" , @"上海银行·申卡贷记卡" , @"上海银行·上海申卡IC" , @"上海银行·申卡贷记卡" , @"上海银行·申卡贷记卡普通卡" , @"上海银行·申卡贷记卡金卡" , @"上海银行·万事达白金卡" , @"上海银行·万事达星运卡" , @"上海银行·申卡贷记卡金卡" , @"上海银行·申卡贷记卡普通卡" , @"上海银行·安融卡" , @"上海银行·分期付款信用卡" , @"上海银行·信用卡" , @"上海银行·个人公务卡" , @"上海银行·安融卡" , @"上海银行·上海银行银联白金卡" , @"上海银行·贷记IC卡" , @"上海银行·中国旅游卡（IC普卡）" , @"上海银行·中国旅游卡（IC金卡）" , @"上海银行·中国旅游卡（IC白金卡）" , @"上海银行·万事达钻石卡" , @"上海银行·淘宝IC普卡" , @"北京银行·京卡借记卡" , @"北京银行·京卡(银联卡)" , @"北京银行·京卡借记卡" , @"北京银行·京卡" , @"北京银行·京卡" , @"北京银行·借记IC卡" , @"北京银行·京卡贵宾金卡" , @"北京银行·京卡贵宾白金卡" , @"吉林银行·君子兰一卡通(银联卡)" , @"吉林银行·君子兰卡(银联卡)" , @"吉林银行·长白山金融IC卡" , @"吉林银行·信用卡" , @"吉林银行·信用卡" , @"吉林银行·公务卡" , @"镇江市商业银行·金山灵通卡(银联卡)" , @"镇江市商业银行·金山灵通卡(银联卡)" , @"宁波银行·银联标准卡" , @"宁波银行·汇通借记卡" , @"宁波银行·汇通卡(银联卡)" , @"宁波银行·明州卡" , @"宁波银行·汇通借记卡" , @"宁波银行·汇通国际卡银联双币卡" , @"宁波银行·汇通国际卡银联双币卡" , @"平安银行·新磁条借记卡" , @"平安银行·平安银行IC借记卡" , @"平安银行·万事顺卡" , @"平安银行·平安银行借记卡" , @"平安银行·平安银行借记卡" , @"平安银行·万事顺借记卡" , @"焦作市商业银行·月季借记卡(银联卡)" , @"焦作市商业银行·月季城市通(银联卡)" , @"焦作市商业银行·中国旅游卡" , @"温州银行·金鹿卡" , @"汉口银行·九通卡(银联卡)" , @"汉口银行·九通卡" , @"汉口银行·借记卡" , @"汉口银行·借记卡" , @"盛京银行·玫瑰卡" , @"盛京银行·玫瑰IC卡" , @"盛京银行·玫瑰IC卡" , @"盛京银行·玫瑰卡" , @"盛京银行·玫瑰卡" , @"盛京银行·玫瑰卡(银联卡)" , @"盛京银行·玫瑰卡(银联卡)" , @"盛京银行·盛京银行公务卡" , @"洛阳银行·都市一卡通(银联卡)" , @"洛阳银行·都市一卡通(银联卡)" , @"洛阳银行·--" , @"大连银行·北方明珠卡" , @"大连银行·人民币借记卡" , @"大连银行·金融IC借记卡" , @"大连银行·大连市社会保障卡" , @"大连银行·借记IC卡" , @"大连银行·借记IC卡" , @"大连银行·大连市商业银行贷记卡" , @"大连银行·大连市商业银行贷记卡" , @"大连银行·银联标准公务卡" , @"苏州市商业银行·姑苏卡" , @"杭州商业银行·西湖卡" , @"杭州商业银行·西湖卡" , @"杭州商业银行·借记IC卡" , @"杭州商业银行·" , @"南京银行·梅花信用卡公务卡" , @"南京银行·梅花信用卡商务卡" , @"南京银行·梅花贷记卡(银联卡)" , @"南京银行·梅花借记卡(银联卡)" , @"南京银行·白金卡" , @"南京银行·商务卡" , @"东莞市商业银行·万顺通卡(银联卡)" , @"东莞市商业银行·万顺通卡(银联卡)" , @"东莞市商业银行·万顺通借记卡" , @"东莞市商业银行·社会保障卡" , @"乌鲁木齐市商业银行·雪莲借记IC卡" , @"乌鲁木齐市商业银行·乌鲁木齐市公务卡" , @"乌鲁木齐市商业银行·福农卡贷记卡" , @"乌鲁木齐市商业银行·福农卡准贷记卡" , @"乌鲁木齐市商业银行·雪莲准贷记卡" , @"乌鲁木齐市商业银行·雪莲贷记卡(银联卡)" , @"乌鲁木齐市商业银行·雪莲借记IC卡" , @"乌鲁木齐市商业银行·雪莲借记卡(银联卡)" , @"乌鲁木齐市商业银行·雪莲卡(银联卡)" , @"绍兴银行·兰花IC借记卡" , @"绍兴银行·社保IC借记卡" , @"绍兴银行·兰花公务卡" , @"成都商业银行·芙蓉锦程福农卡" , @"成都商业银行·芙蓉锦程天府通卡" , @"成都商业银行·锦程卡(银联卡)" , @"成都商业银行·锦程卡金卡" , @"成都商业银行·锦程卡定活一卡通金卡" , @"成都商业银行·锦程卡定活一卡通" , @"成都商业银行·锦程力诚联名卡" , @"成都商业银行·锦程力诚联名卡" , @"成都商业银行·锦程卡(银联卡)" , @"抚顺银行·借记IC卡" , @"临商银行·借记卡" , @"宜昌市商业银行·三峡卡(银联卡)" , @"宜昌市商业银行·信用卡(银联卡)" , @"葫芦岛市商业银行·一通卡" , @"葫芦岛市商业银行·一卡通(银联卡)" , @"天津市商业银行·津卡" , @"天津市商业银行·津卡贷记卡(银联卡)" , @"天津市商业银行·贷记IC卡" , @"天津市商业银行·--" , @"天津银行·商务卡" , @"宁夏银行·宁夏银行公务卡" , @"宁夏银行·宁夏银行福农贷记卡" , @"宁夏银行·如意卡(银联卡)" , @"宁夏银行·宁夏银行福农借记卡" , @"宁夏银行·如意借记卡" , @"宁夏银行·如意IC卡" , @"宁夏银行·宁夏银行如意借记卡" , @"宁夏银行·中国旅游卡" , @"齐商银行·金达卡(银联卡)" , @"齐商银行·金达借记卡(银联卡)" , @"齐商银行·金达IC卡" , @"徽商银行·黄山卡" , @"徽商银行·黄山卡" , @"徽商银行·借记卡" , @"徽商银行·徽商银行中国旅游卡（安徽）" , @"徽商银行合肥分行·黄山卡" , @"徽商银行芜湖分行·黄山卡(银联卡)" , @"徽商银行马鞍山分行·黄山卡(银联卡)" , @"徽商银行淮北分行·黄山卡(银联卡)" , @"徽商银行安庆分行·黄山卡(银联卡)" , @"重庆银行·长江卡(银联卡)" , @"重庆银行·长江卡(银联卡)" , @"重庆银行·长江卡" , @"重庆银行·借记IC卡" , @"哈尔滨银行·丁香一卡通(银联卡)" , @"哈尔滨银行·丁香借记卡(银联卡)" , @"哈尔滨银行·丁香卡" , @"哈尔滨银行·福农借记卡" , @"无锡市商业银行·太湖金保卡(银联卡)" , @"丹东银行·借记IC卡" , @"丹东银行·丹东银行公务卡" , @"兰州银行·敦煌卡" , @"南昌银行·金瑞卡(银联卡)" , @"南昌银行·南昌银行借记卡" , @"南昌银行·金瑞卡" , @"晋商银行·晋龙一卡通" , @"晋商银行·晋龙一卡通" , @"晋商银行·晋龙卡(银联卡)" , @"青岛银行·金桥通卡" , @"青岛银行·金桥卡(银联卡)" , @"青岛银行·金桥卡(银联卡)" , @"青岛银行·金桥卡" , @"青岛银行·借记IC卡" , @"吉林银行·雾凇卡(银联卡)" , @"吉林银行·雾凇卡(银联卡)" , @"南通商业银行·金桥卡(银联卡)" , @"南通商业银行·金桥卡(银联卡)" , @"日照银行·黄海卡、财富卡借记卡" , @"鞍山银行·千山卡(银联卡)" , @"鞍山银行·千山卡(银联卡)" , @"鞍山银行·千山卡" , @"青海银行·三江银行卡(银联卡)" , @"青海银行·三江卡" , @"台州银行·大唐贷记卡" , @"台州银行·大唐准贷记卡" , @"台州银行·大唐卡(银联卡)" , @"台州银行·大唐卡" , @"台州银行·借记卡" , @"台州银行·公务卡" , @"泉州银行·海峡银联卡(银联卡)" , @"泉州银行·海峡储蓄卡" , @"泉州银行·海峡银联卡(银联卡)" , @"泉州银行·海峡卡" , @"泉州银行·公务卡" , @"昆明商业银行·春城卡(银联卡)" , @"昆明商业银行·春城卡(银联卡)" , @"昆明商业银行·富滇IC卡（复合卡）" , @"阜新银行·借记IC卡" , @"嘉兴银行·南湖借记卡(银联卡)" , @"廊坊银行·白金卡" , @"廊坊银行·金卡" , @"廊坊银行·银星卡(银联卡)" , @"廊坊银行·龙凤呈祥卡" , @"内蒙古银行·百灵卡(银联卡)" , @"内蒙古银行·成吉思汗卡" , @"湖州市商业银行·百合卡" , @"湖州市商业银行·" , @"沧州银行·狮城卡" , @"南宁市商业银行·桂花卡(银联卡)" , @"包商银行·雄鹰卡(银联卡)" , @"包商银行·包头市商业银行借记卡" , @"包商银行·雄鹰贷记卡" , @"包商银行·包商银行内蒙古自治区公务卡" , @"包商银行·贷记卡" , @"包商银行·借记卡" , @"连云港市商业银行·金猴神通借记卡" , @"威海商业银行·通达卡(银联卡)" , @"威海市商业银行·通达借记IC卡" , @"攀枝花市商业银行·攀枝花卡(银联卡)" , @"攀枝花市商业银行·攀枝花卡" , @"绵阳市商业银行·科技城卡(银联卡)" , @"泸州市商业银行·酒城卡(银联卡)" , @"泸州市商业银行·酒城IC卡" , @"大同市商业银行·云冈卡(银联卡)" , @"三门峡银行·天鹅卡(银联卡)" , @"广东南粤银行·南珠卡(银联卡)" , @"张家口市商业银行·好运IC借记卡" , @"桂林市商业银行·漓江卡(银联卡)" , @"龙江银行·福农借记卡" , @"龙江银行·联名借记卡" , @"龙江银行·福农借记卡" , @"龙江银行·龙江IC卡" , @"龙江银行·社会保障卡" , @"龙江银行·--" , @"江苏长江商业银行·长江卡" , @"徐州市商业银行·彭城借记卡(银联卡)" , @"南充市商业银行·借记IC卡" , @"南充市商业银行·熊猫团团卡" , @"莱商银行·银联标准卡" , @"莱芜银行·金凤卡" , @"莱商银行·借记IC卡" , @"德阳银行·锦程卡定活一卡通" , @"德阳银行·锦程卡定活一卡通金卡" , @"德阳银行·锦程卡定活一卡通" , @"唐山市商业银行·唐山市城通卡" , @"曲靖市商业银行·珠江源卡" , @"曲靖市商业银行·珠江源IC卡" , @"温州银行·金鹿信用卡" , @"温州银行·金鹿信用卡" , @"温州银行·金鹿公务卡" , @"温州银行·贷记IC卡" , @"汉口银行·汉口银行贷记卡" , @"汉口银行·汉口银行贷记卡" , @"汉口银行·九通香港旅游贷记普卡" , @"汉口银行·九通香港旅游贷记金卡" , @"汉口银行·贷记卡" , @"汉口银行·九通公务卡" , @"江苏银行·聚宝借记卡" , @"江苏银行·月季卡" , @"江苏银行·紫金卡" , @"江苏银行·绿扬卡(银联卡)" , @"江苏银行·月季卡(银联卡)" , @"江苏银行·九州借记卡(银联卡)" , @"江苏银行·月季卡(银联卡)" , @"江苏银行·聚宝惠民福农卡" , @"江苏银行·江苏银行聚宝IC借记卡" , @"江苏银行·聚宝IC借记卡VIP卡" , @"长治市商业银行·长治商行银联晋龙卡" , @"承德市商业银行·热河卡" , @"承德银行·借记IC卡" , @"德州银行·长河借记卡" , @"德州银行·--" , @"遵义市商业银行·社保卡" , @"遵义市商业银行·尊卡" , @"邯郸市商业银行·邯银卡" , @"邯郸市商业银行·邯郸银行贵宾IC借记卡" , @"安顺市商业银行·黄果树福农卡" , @"安顺市商业银行·黄果树借记卡" , @"江苏银行·紫金信用卡(公务卡)" , @"江苏银行·紫金信用卡" , @"江苏银行·天翼联名信用卡" , @"平凉市商业银行·广成卡" , @"玉溪市商业银行·红塔卡" , @"玉溪市商业银行·红塔卡" , @"浙江民泰商业银行·金融IC卡" , @"浙江民泰商业银行·民泰借记卡" , @"浙江民泰商业银行·金融IC卡C卡" , @"浙江民泰商业银行·银联标准普卡金卡" , @"浙江民泰商业银行·商惠通" , @"上饶市商业银行·三清山卡" , @"东营银行·胜利卡" , @"泰安市商业银行·岱宗卡" , @"泰安市商业银行·市民一卡通" , @"浙江稠州商业银行·义卡" , @"浙江稠州商业银行·义卡借记IC卡" , @"浙江稠州商业银行·公务卡" , @"自贡市商业银行·借记IC卡" , @"自贡市商业银行·锦程卡" , @"鄂尔多斯银行·天骄公务卡" , @"鹤壁银行·鹤卡" , @"许昌银行·连城卡" , @"铁岭银行·龙凤卡" , @"乐山市商业银行·大福卡" , @"乐山市商业银行·--" , @"长安银行·长长卡" , @"长安银行·借记IC卡" , @"重庆三峡银行·财富人生卡" , @"重庆三峡银行·借记卡" , @"石嘴山银行·麒麟借记卡" , @"石嘴山银行·麒麟借记卡" , @"石嘴山银行·麒麟公务卡" , @"盘锦市商业银行·鹤卡" , @"盘锦市商业银行·盘锦市商业银行鹤卡" , @"平顶山银行·平顶山银行公务卡" , @"朝阳银行·鑫鑫通卡" , @"朝阳银行·朝阳银行福农卡" , @"朝阳银行·红山卡" , @"宁波东海银行·绿叶卡" , @"遂宁市商业银行·锦程卡" , @"遂宁是商业银行·金荷卡" , @"保定银行·直隶卡" , @"保定银行·直隶卡" , @"凉山州商业银行·锦程卡" , @"凉山州商业银行·金凉山卡" , @"漯河银行·福卡" , @"漯河银行·福源卡" , @"漯河银行·福源公务卡" , @"达州市商业银行·锦程卡" , @"新乡市商业银行·新卡" , @"晋中银行·九州方圆借记卡" , @"晋中银行·九州方圆卡" , @"驻马店银行·驿站卡" , @"驻马店银行·驿站卡" , @"驻马店银行·公务卡" , @"衡水银行·金鼎卡" , @"衡水银行·借记IC卡" , @"周口银行·如愿卡" , @"周口银行·公务卡" , @"阳泉市商业银行·金鼎卡" , @"阳泉市商业银行·金鼎卡" , @"宜宾市商业银行·锦程卡" , @"宜宾市商业银行·借记IC卡" , @"库尔勒市商业银行·孔雀胡杨卡" , @"雅安市商业银行·锦城卡" , @"雅安市商业银行·--" , @"安阳银行·安鼎卡" , @"信阳银行·信阳卡" , @"信阳银行·公务卡" , @"信阳银行·信阳卡" , @"华融湘江银行·华融卡" , @"华融湘江银行·华融卡" , @"营口沿海银行·祥云借记卡" , @"景德镇商业银行·瓷都卡" , @"哈密市商业银行·瓜香借记卡" , @"湖北银行·金牛卡" , @"湖北银行·汉江卡" , @"湖北银行·借记卡" , @"湖北银行·三峡卡" , @"湖北银行·至尊卡" , @"湖北银行·金融IC卡" , @"西藏银行·借记IC卡" , @"新疆汇和银行·汇和卡" , @"广东华兴银行·借记卡" , @"广东华兴银行·华兴银联公司卡" , @"广东华兴银行·华兴联名IC卡" , @"广东华兴银行·华兴金融IC借记卡" , @"濮阳银行·龙翔卡" , @"宁波通商银行·借记卡" , @"甘肃银行·神舟兴陇借记卡" , @"甘肃银行·甘肃银行神州兴陇IC卡" , @"枣庄银行·借记IC卡" , @"本溪市商业银行·借记卡" , @"盛京银行·医保卡" , @"上海农商银行·如意卡(银联卡)" , @"上海农商银行·如意卡(银联卡)" , @"上海农商银行·鑫通卡" , @"上海农商银行·国际如意卡" , @"上海农商银行·借记IC卡" , @"常熟市农村商业银行·粒金贷记卡(银联卡)" , @"常熟市农村商业银行·公务卡" , @"常熟市农村商业银行·粒金准贷卡" , @"常熟农村商业银行·粒金借记卡(银联卡)" , @"常熟农村商业银行·粒金IC卡" , @"常熟农村商业银行·粒金卡" , @"深圳农村商业银行·信通卡(银联卡)" , @"深圳农村商业银行·信通商务卡(银联卡)" , @"深圳农村商业银行·信通卡" , @"深圳农村商业银行·信通商务卡" , @"广州农村商业银行·福农太阳卡" , @"广东南海农村商业银行·盛通卡" , @"广东南海农村商业银行·盛通卡(银联卡)" , @"佛山顺德农村商业银行·恒通卡(银联卡)" , @"佛山顺德农村商业银行·恒通卡" , @"佛山顺德农村商业银行·恒通卡(银联卡)" , @"江阴农村商业银行·暨阳公务卡" , @"江阴市农村商业银行·合作贷记卡(银联卡)" , @"江阴农村商业银行·合作借记卡" , @"江阴农村商业银行·合作卡(银联卡)" , @"江阴农村商业银行·暨阳卡" , @"重庆农村商业银行·江渝借记卡VIP卡" , @"重庆农村商业银行·江渝IC借记卡" , @"重庆农村商业银行·江渝乡情福农卡" , @"东莞农村商业银行·信通卡(银联卡)" , @"东莞农村商业银行·信通卡(银联卡)" , @"东莞农村商业银行·信通信用卡" , @"东莞农村商业银行·信通借记卡" , @"东莞农村商业银行·贷记IC卡" , @"张家港农村商业银行·一卡通(银联卡)" , @"张家港农村商业银行·一卡通(银联卡)" , @"张家港农村商业银行·" , @"北京农村商业银行·信通卡" , @"北京农村商业银行·惠通卡" , @"北京农村商业银行·凤凰福农卡" , @"北京农村商业银行·惠通卡" , @"北京农村商业银行·中国旅行卡" , @"北京农村商业银行·凤凰卡" , @"天津农村商业银行·吉祥商联IC卡" , @"天津农村商业银行·信通借记卡(银联卡)" , @"天津农村商业银行·借记IC卡",@"鄞州农村合作银行·蜜蜂借记卡(银联卡)" , @"宁波鄞州农村合作银行·蜜蜂电子钱包(IC)" , @"宁波鄞州农村合作银行·蜜蜂IC借记卡" , @"宁波鄞州农村合作银行·蜜蜂贷记IC卡" , @"宁波鄞州农村合作银行·蜜蜂贷记卡",@"宁波鄞州农村合作银行·公务卡" , @"成都农村商业银行·福农卡" , @"成都农村商业银行·福农卡" , @"珠海农村商业银行·信通卡(银联卡)" , @"太仓农村商业银行·郑和卡(银联卡)" , @"太仓农村商业银行·郑和IC借记卡" , @"无锡农村商业银行·金阿福" , @"无锡农村商业银行·借记IC卡" , @"黄河农村商业银行·黄河卡" , @"黄河农村商业银行·黄河富农卡福农卡" , @"黄河农村商业银行·借记IC卡" , @"天津滨海农村商业银行·四海通卡", @"天津滨海农村商业银行·四海通e芯卡" , @"武汉农村商业银行·汉卡" , @"武汉农村商业银行·汉卡" , @"武汉农村商业银行·中国旅游卡" , @"江南农村商业银行·阳湖卡(银联卡)" , @"江南农村商业银行·天天红火卡",@"江南农村商业银行·借记IC卡" , @"海口联合农村商业银行·海口联合农村商业银行合卡" , @"湖北嘉鱼吴江村镇银行·垂虹卡" , @"福建建瓯石狮村镇银行·玉竹卡" , @"浙江平湖工银村镇银行·金平卡" , @"重庆璧山工银村镇银行·翡翠卡",@"重庆农村商业银行·银联标准贷记卡" , @"重庆农村商业银行·公务卡" , @"南阳村镇银行·玉都卡" , @"晋中市榆次融信村镇银行·魏榆卡" , @"三水珠江村镇银行·珠江太阳卡" , @"东营莱商村镇银行·绿洲卡" , @"建设银行·单位结算卡" , @"玉溪市商业银行·红塔卡" ];
    
    
    
    //BIN号
    
    NSArray* bankBin = @[@"621098", @"622150", @"622151", @"622181", @"622188", @"955100", @"621095", @"620062", @"621285", @"621798", @"621799",@"621797", @"620529", @"622199", @"621096", @"621622", @"623219", @"621674", @"623218", @"621599",@"370246", @"370248",@"370249", @"427010", @"427018", @"427019", @"427020", @"427029", @"427030", @"427039", @"370247", @"438125", @"438126",@"451804",@"451810", @"451811", @"458071", @"489734", @"489735", @"489736", @"510529", @"427062", @"524091", @"427064",@"530970", @"530990", @"558360", @"620200", @"620302", @"620402", @"620403" , @"620404", @"524047" , @"620406" , @"620407",@"525498" , @"620409" , @"620410" , @"620411" ,@"620412" ,@"620502", @"620503", @"620405", @"620408", @"620512", @"620602",@"620604", @"620607", @"620611", @"620612", @"620704", @"620706", @"620707", @"620708", @"620709", @"620710", @"620609", @"620712" , @"620713" , @"620714" , @"620802" , @"620711" , @"620904" , @"620905" , @"621001" , @"620902" , @"621103" , @"621105" , @"621106" , @"621107" , @"621102" , @"621203" , @"621204" , @"621205" , @"621206" , @"621207" , @"621208" , @"621209" , @"621210" , @"621302" , @"621303" , @"621202" , @"621305" , @"621306" , @"621307" , @"621309" , @"621311" , @"621313" , @"621211" , @"621315" , @"621304" , @"621402" , @"621404" , @"621405" , @"621406" , @"621407" , @"621408" , @"621409" , @"621410" , @"621502" , @"621317" , @"621511" , @"621602" , @"621603" , @"621604" , @"621605" , @"621608" , @"621609" , @"621610" , @"621611" , @"621612" , @"621613" , @"621614" , @"621615" , @"621616" , @"621617" , @"621607" , @"621606" , @"621804" , @"621807" , @"621813" , @"621814" , @"621817" , @"621901" , @"621904" , @"621905" , @"621906" , @"621907" , @"621908" , @"621909" , @"621910" , @"621911" , @"621912" , @"621913" , @"621915" , @"622002" , @"621903" , @"622004" , @"622005" , @"622006" , @"622007" , @"622008" , @"622010" , @"622011" , @"622012" , @"621914" , @"622015" , @"622016" , @"622003" , @"622018" , @"622019" , @"622020" , @"622102" , @"622103" , @"622104" , @"622105" , @"622013" , @"622111" , @"622114" , @"622200" , @"622017" , @"622202" , @"622203" , @"622208" , @"622210" , @"622211" , @"622212" , @"622213" , @"622214" , @"622110" , @"622220" , @"622223" , @"622225" , @"622229" , @"622230" , @"622231" , @"622232" , @"622233" , @"622234" , @"622235" , @"622237" , @"622215" , @"622239" , @"622240" , @"622245" , @"622224" , @"622303" , @"622304" , @"622305" , @"622306" , @"622307" , @"622308" , @"622309" , @"622238" , @"622314" , @"622315" , @"622317" , @"622302" , @"622402" , @"622403" , @"622404" , @"622313" , @"622504" , @"622505" , @"622509" , @"622513" , @"622517" , @"622502" , @"622604" , @"622605" , @"622606" , @"622510" , @"622703" , @"622715" , @"622806" , @"622902" , @"622903" , @"622706" , @"623002" , @"623006" , @"623008" , @"623011" , @"623012" , @"622904" , @"623015" , @"623100" , @"623202" , @"623301" , @"623400" , @"623500" , @"623602" , @"623803" , @"623901" , @"623014" , @"624100" , @"624200" , @"624301" , @"624402" , @"62451804" , @"62451810" , @"62451811" , @"62458071" , @"623700" , @"628288" , @"624000" , @"628286" , @"622206" , @"621225" , @"526836" , @"513685" , @"543098" , @"458441" , @"620058" , @"621281" , @"622246" , @"900000" , @"544210" , @"548943" , @"370267" , @"621558" , @"621559" , @"621722" , @"621723" , @"620086" , @"621226" , @"402791" , @"427028" , @"427038" , @"548259" , @"356879" , @"356880" , @"356881" , @"356882" , @"528856" , @"621618" , @"620516" , @"621227" , @"621721" , @"900010" , @"625330" , @"625331" , @"625332" , @"623062" , @"622236" , @"621670" , @"524374" , @"550213" , @"374738" , @"374739" , @"621288" , @"625708" , @"625709" , @"622597" , @"622599" , @"360883" , @"360884" , @"625865" , @"625866" , @"625899" , @"621376" , @"620054" , @"620142" , @"621428" , @"625939" , @"621434" , @"625987" , @"621761" , @"621749" , @"620184" , @"621300" , @"621378" , @"625114" , @"622159" , @"621720" , @"625021" , @"625022" , @"621379" , @"620114" , @"620146" , @"621724" , @"625918" , @"621371" , @"620143" , @"620149" , @"621414" , @"625914" , @"621375" , @"620187" , @"621433" , @"625986" , @"621370" , @"625925" , @"622926" , @"622927" , @"622928" , @"622929" , @"622930" , @"622931" , @"620124" , @"620183" , @"620561" , @"625116" , @"622227" , @"621372" , @"621464" , @"625942" , @"622158" , @"625917" , @"621765" , @"620094" , @"620186" , @"621719" , @"621719" , @"621750" , @"621377" , @"620148" , @"620185" , @"621374" , @"621731" , @"621781" , @"552599" , @"623206" , @"621671" , @"620059" , @"403361" , @"404117" , @"404118" , @"404119" , @"404120" , @"404121" , @"463758" , @"514027" , @"519412" , @"519413" , @"520082" , @"520083" , @"558730" , @"621282" , @"621336" , @"621619" , @"622821" , @"622822" , @"622823" , @"622824" , @"622825" , @"622826" , @"622827" , @"622828" , @"622836" , @"622837" , @"622840" , @"622841" , @"622843" , @"622844" , @"622845" , @"622846" , @"622847" , @"622848" , @"622849" , @"623018" , @"625996" , @"625997" , @"625998" , @"628268" , @"625826" , @"625827" , @"548478" , @"544243" , @"622820" , @"622830" , @"622838" , @"625336" , @"628269" , @"620501" , @"621660" , @"621661" , @"621662" , @"621663" , @"621665" , @"621667" , @"621668" , @"621669" , @"621666" , @"625908" , @"625910" , @"625909" , @"356833" , @"356835" , @"409665" , @"409666" , @"409668" , @"409669" , @"409670" , @"409671" , @"409672" , @"456351" , @"512315" , @"512316" , @"512411" , @"512412" , @"514957" , @"409667" , @"518378" , @"518379" , @"518474" , @"518475" , @"518476" , @"438088" , @"524865" , @"525745" , @"525746" , @"547766" , @"552742" , @"553131" , @"558868" , @"514958" , @"622752" , @"622753" , @"622755" , @"524864" , @"622757" , @"622758" , @"622759" , @"622760" , @"622761" , @"622762" , @"622763" , @"601382" , @"622756" , @"628388" , @"621256" , @"621212" , @"620514" , @"622754" , @"622764" , @"518377" , @"622765" , @"622788" , @"621283" , @"620061" , @"621725" , @"620040" , @"558869" , @"621330" , @"621331" , @"621332" , @"621333" , @"621297" , @"377677" , @"621568" , @"621569" , @"625905" , @"625906" , @"625907" , @"628313" , @"625333" , @"628312" , @"623208" , @"621620" , @"621756" , @"621757" , @"621758" , @"621759" , @"621785" , @"621786" , @"621787" , @"621788" , @"621789" , @"621790" , @"621672" , @"625337" , @"625338" , @"625568" , @"621648" , @"621248" , @"621249" , @"622750" , @"622751" , @"622771" , @"622772" , @"622770" , @"625145" , @"620531" , @"620210" , @"620211" , @"622479" , @"622480" , @"622273" , @"622274" , @"621231" , @"621638" , @"621334" , @"625140" , @"621395" , @"622725" , @"622728" , @"621284" , @"421349" , @"434061" , @"434062" , @"436728" , @"436742" , @"453242" , @"491031" , @"524094" , @"526410" , @"544033" , @"552245" , @"589970" , @"620060" , @"621080" , @"621081" , @"621466" , @"621467" , @"621488" , @"621499" , @"621598" , @"621621" , @"621700" , @"622280" , @"622700" , @"622707" , @"622966" , @"622988" , @"625955" , @"625956" , @"553242" , @"621082" , @"621673" , @"623211" , @"356896" , @"356899" , @"356895" , @"436718" , @"436738" , @"436745" , @"436748" , @"489592" , @"531693" , @"532450" , @"532458" , @"544887" , @"552801" , @"557080" , @"558895" , @"559051" , @"622166" , @"622168" , @"622708" , @"625964" , @"625965" , @"625966" , @"628266" , @"628366" , @"625362" , @"625363" , @"628316" , @"628317" , @"620021" , @"620521" , @"405512" , @"601428" , @"405512" , @"434910" , @"458123" , @"458124" , @"520169" , @"522964" , @"552853" , @"601428" , @"622250" , @"622251" , @"521899" , @"622254" , @"622255" , @"622256" , @"622257" , @"622258" , @"622259" , @"622253" , @"622261" , @"622284" , @"622656" , @"628216" , @"622252" , @"66405512" , @"622260" , @"66601428" , @"955590" , @"955591" , @"955592" , @"955593" , @"628218" , @"622262" , @"621069" , @"620013" , @"625028" , @"625029" , @"621436" , @"621002" , @"621335" , @"433670" , @"433680" , @"442729" , @"442730" , @"620082" , @"622690" , @"622691" , @"622692" , @"622696" , @"622698" , @"622998" , @"622999" , @"433671" , @"968807" , @"968808" , @"968809" , @"621771" , @"621767" , @"621768" , @"621770" , @"621772" , @"621773" , @"620527" , @"356837" , @"356838" , @"486497" , @"622660" , @"622662" , @"622663" , @"622664" , @"622665" , @"622666" , @"622667" , @"622669" , @"622670" , @"622671" , @"622672" , @"622668" , @"622661" , @"622674" , @"622673" , @"620518" , @"621489" , @"621492" , @"620535" , @"623156" , @"621490" , @"621491" , @"620085" , @"623155" , @"623157" , @"623158" , @"623159" , @"999999" , @"621222" , @"623020" , @"623021" , @"623022" , @"623023" , @"622630" , @"622631" , @"622632" , @"622633" , @"622615" , @"622616" , @"622618" , @"622622" , @"622617" , @"622619" , @"415599" , @"421393" , @"421865" , @"427570" , @"427571" , @"472067" , @"472068" , @"622620" , @"621691" , @"545392" , @"545393" , @"545431" , @"545447" , @"356859" , @"356857" , @"407405" , @"421869" , @"421870" , @"421871" , @"512466" , @"356856" , @"528948" , @"552288" , @"622600" , @"622601" , @"622602" , @"517636" , @"622621" , @"628258" , @"556610" , @"622603" , @"464580" , @"464581" , @"523952" , @"545217" , @"553161" , @"356858" , @"622623" , @"625911" , @"377152" , @"377153" , @"377158" , @"377155" , @"625912" , @"625913" , @"356885" , @"356886" , @"356887" , @"356888" , @"356890" , @"402658" , @"410062" , @"439188" , @"439227" , @"468203" , @"479228" , @"479229" , @"512425" , @"521302" , @"524011" , @"356889" , @"545620" , @"545621" , @"545947" , @"545948" , @"552534" , @"552587" , @"622575" , @"622576" , @"622577" , @"622579" , @"622580" , @"545619" , @"622581" , @"622582" , @"622588" , @"622598" , @"622609" , @"690755" , @"690755" , @"545623" , @"621286" , @"620520" , @"621483" , @"621485" , @"621486" , @"628290" , @"622578" , @"370285" , @"370286" , @"370287" , @"370289" , @"439225" , @"518710" , @"518718" , @"628362" , @"439226" , @"628262" , @"625802" , @"625803" , @"621299" , @"966666" , @"622909" , @"622908" , @"438588" , @"438589" , @"461982" , @"486493" , @"486494" , @"486861" , @"523036" , @"451289" , @"527414" , @"528057" , @"622901" , @"622902" , @"622922" , @"628212" , @"451290" , @"524070" , @"625084" , @"625085" , @"625086" , @"625087" , @"548738" , @"549633" , @"552398" , @"625082" , @"625083" , @"625960" , @"625961" , @"625962" , @"625963" , @"356851" , @"356852" , @"404738" , @"404739" , @"456418" , @"498451" , @"515672" , @"356850" , @"517650" , @"525998" , @"622177" , @"622277" , @"622516" , @"622517" , @"622518" , @"622520" , @"622521" , @"622522" , @"622523" , @"628222" , @"628221" , @"984301" , @"984303" , @"622176" , @"622276" , @"622228" , @"621352" , @"621351" , @"621390" , @"621792" , @"625957" , @"625958" , @"621791" , @"620530" , @"625993" , @"622519" , @"621793" , @"621795" , @"621796" , @"622500" , @"623078" , @"622384" , @"940034" , @"940015" , @"622886" , @"622391" , @"940072" , @"622359" , @"940066" , @"622857" , @"940065" , @"621019" , @"622309" , @"621268" , @"622884" , @"621453" , @"622684" , @"621016" , @"621015" , @"622950" , @"622951" , @"621072" , @"623183" , @"623185" , @"621005" , @"622172" , @"622985" , @"622987" , @"622267" , @"622278" , @"622279" , @"622468" , @"622892" , @"940021" , @"621050" , @"620522" , @"356827" , @"356828" , @"356830" , @"402673" , @"402674" , @"438600" , @"486466" , @"519498" , @"520131" , @"524031" , @"548838" , @"622148" , @"622149" , @"622268" , @"356829" , @"622300" , @"628230" , @"622269" , @"625099" , @"625953" , @"625350" , @"625351" , @"625352" , @"519961" , @"625839" , @"421317" , @"602969" , @"621030" , @"621420" , @"621468" , @"623111" , @"422160" , @"422161" , @"622865" , @"940012" , @"623131" , @"622178" , @"622179" , @"628358" , @"622394" , @"940025" , @"621279" , @"622281" , @"622316" , @"940022" , @"621418" , @"512431" , @"520194" , @"621626" , @"623058" , @"602907" , @"622986" , @"622989" , @"622298" , @"622338" , @"940032" , @"623205" , @"621977" , @"990027" , @"622325" , @"623029" , @"623105" , @"621244" , @"623081" , @"623108" , @"566666" , @"622455" , @"940039" , @"622466" , @"628285" , @"622420" , @"940041" , @"623118" , @"603708" , @"622993" , @"623070" , @"623069" , @"623172" , @"623173" , @"622383" , @"622385" , @"628299" , @"603506" , @"603367" , @"622878" , @"623061" , @"623209" , @"628242" , @"622595" , @"622303" , @"622305" , @"621259" , @"622596" , @"622333" , @"940050" , @"621439" , @"623010" , @"621751" , @"628278" , @"625502" , @"625503" , @"625135" , @"622476" , @"621754" , @"622143" , @"940001" , @"623026" , @"623086" , @"628291" , @"621532" , @"621482" , @"622135" , @"622152" , @"622153" , @"622154" , @"622996" , @"622997" , @"940027" , @"623099" , @"623007" , @"940055" , @"622397" , @"622398" , @"940054" , @"622331" , @"622426" , @"625995" , @"621452" , @"628205" , @"628214" , @"625529" , @"622428" , @"621529" , @"622429" , @"621417" , @"623089" , @"623200" , @"940057" , @"622311" , @"623119" , @"622877" , @"622879" , @"621775" , @"623203" , @"603601" , @"622137" , @"622327" , @"622340" , @"622366" , @"622134" , @"940018" , @"623016" , @"623096" , @"940049" , @"622425" , @"622425" , @"621577" , @"622485" , @"623098" , @"628329" , @"621538" , @"940006" , @"621269" , @"622275" , @"621216" , @"622465" , @"940031" , @"621252" , @"622146" , @"940061" , @"621419" , @"623170" , @"622440" , @"940047" , @"940017" , @"622418" , @"623077" , @"622413" , @"940002" , @"623188" , @"622310" , @"940068" , @"622321" , @"625001" , @"622427" , @"940069" , @"623039" , @"628273" , @"622370" , @"683970" , @"940074" , @"621437" , @"628319" , @"990871" , @"622308" , @"621415" , @"623166" , @"622132" , @"621340" , @"621341" , @"622140" , @"623073" , @"622147" , @"621633" , @"622301" , @"623171" , @"621422" , @"622335" , @"622336" , @"622165" , @"622315" , @"628295" , @"625950" , @"621760" , @"622337" , @"622411" , @"623102" , @"622342" , @"623048" , @"622367" , @"622392" , @"623085" , @"622395" , @"622441" , @"622448" , @"621413" , @"622856" , @"621037" , @"621097" , @"621588" , @"623032" , @"622644" , @"623518" , @"622870" , @"622866" , @"623072" , @"622897" , @"628279" , @"622864" , @"621403" , @"622561" , @"622562" , @"622563" , @"622167" , @"622777" , @"621497" , @"622868" , @"622899" , @"628255" , @"625988" , @"622566" , @"622567" , @"622625" , @"622626" , @"625946" , @"628200" , @"621076" , @"504923" , @"622173" , @"622422" , @"622447" , @"622131" , @"940076" , @"621579" , @"622876" , @"622873" , @"622962" , @"622936" , @"623060" , @"622937" , @"623101" , @"621460" , @"622939" , @"622960" , @"623523" , @"621591" , @"622961" , @"628210" , @"622283" , @"625902" , @"621010" , @"622980" , @"623135" , @"621726" , @"621088" , @"620517" , @"622740" , @"625036" , @"621014" , @"621004" , @"622972" , @"623196" , @"621028" , @"623083" , @"628250" , @"623121" , @"621070" , @"628253" , @"622979" , @"621035" , @"621038" , @"621086" , @"621498" , @"621296" , @"621448" , @"622945" , @"621755" , @"622940" , @"623120" , @"628355" , @"621089" , @"623161" , @"628339" , @"621074" , @"621515" , @"623030" , @"621345" , @"621090" , @"623178" , @"621091" , @"623168" , @"621057" , @"623199" , @"621075" , @"623037" , @"628303" , @"621233" , @"621235" , @"621223" , @"621780" , @"621221" , @"623138" , @"628389" , @"621239" , @"623068" , @"621271" , @"628315" , @"621272" , @"621738" , @"621273" , @"623079" , @"621263" , @"621325" , @"623084" , @"621327" , @"621753" , @"628331" , @"623160" , @"621366" , @"621388" , @"621348" , @"621359" , @"621360" , @"621217" , @"622959" , @"621270" , @"622396" , @"622511" , @"623076" , @"621391" , @"621339" , @"621469" , @"621625" , @"623688" , @"623113" , @"621601" , @"621655" , @"621636" , @"623182" , @"623087" , @"621696" , @"622955" , @"622478" , @"940013" , @"621495" , @"621688" , @"623162" , @"622462" , @"628272" , @"625101" , @"622323" , @"623071" , @"603694" , @"622128" , @"622129" , @"623035" , @"623186" , @"621522" , @"622271" , @"940037" , @"940038" , @"985262" , @"622322" , @"628381" , @"622481" , @"622341" , @"940058" , @"623115" , @"621258" , @"621465" , @"621528" , @"622328" , @"940062" , @"625288" , @"623038" , @"625888" , @"622332" , @"940063" , @"623123" , @"622138" , @"621066" , @"621560" , @"621068" , @"620088" , @"621067" , @"622531" , @"622329" , @"623103" , @"622339" , @"620500" , @"621024" , @"622289" , @"622389" , @"628300" , @"625516" , @"621516" , @"622859" , @"622869" , @"623075" , @"622895" , @"623125" , @"622947" , @"621561" , @"623095" , @"621073" , @"623109" , @"621361" , @"623033" , @"623207" , @"622891" , @"621363" , @"623189" , @"623510" , @"622995" , @"621053" , @"621230" , @"621229" , @"622218" , @"628267" , @"621392" , @"621481" , @"621310" , @"621396" , @"623251" , @"628351"];
    
    
    
    int index = -1;
    
    
    
    if(cardId==nil || cardId.length<16 || cardId.length>19){
        
        return @"";
        
    }
    
    
    
    //6位Bin号
    
    NSString* cardbin_6 = [cardId substringWithRange:NSMakeRange(0, 6)];
    
    
    
    for (int i = 0; i < bankBin.count; i++) {
        
        
        
        if ([cardbin_6 isEqualToString:bankBin[i]]) {
            
            index = i;
            
        }
        
        
        
    }
    
    
    
    if (index != -1) {
        
        return bankName[index];
        
    }
    
    
    
    //8位Bin号
    
    NSString* cardbin_8 = [cardId substringWithRange:NSMakeRange(0, 8)];
    
    
    
    for (int i = 0; i < bankBin.count; i++) {
        
        
        
        if ([cardbin_8 isEqualToString:bankBin[i]]) {
            
            index = i;
            
        }
        
        
        
    }
    
    
    
    if (index != -1) {
        
        return bankName[index];
        
    }
    
    
    
    return @"";
    
}

@end
