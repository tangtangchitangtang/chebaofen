//
//  ZQTools.h
//  尚立
//
//  Created by 周庆 on 16/2/26.
//  Copyright © 2016年 com.slApp.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>
#import<MediaPlayer/MediaPlayer.h>

 

@interface ZQTools : NSObject

//一个公用的block  返回一个数据
typedef void (^responseObjectBlock)(id responseObject);


//一个ZQTools公用的属性 返回值
@property (nonatomic,strong)responseObjectBlock dataBlock;

//定义枚举类型 视频或音频
typedef enum {
    ENUM_Misic,
    ENUM_Vedeo
} ENUM_DataType;

//音乐播放器
@property  (nonatomic,strong) AVAudioPlayer *player;

//选择图片数量
@property (nonatomic,assign)int ImageNumber;

//添加一个黑色透明背景
@property (nonatomic,strong)UIButton *backButton;
#pragma mark————————————初始化(单例)
+ (instancetype)sharedZQTools;


#pragma mark————————————————谁作为window的rootvc vc:根控制器  isHaveNavBar：是否有navbar
+ (void)changeRootVc:(UIViewController *)vc and:(BOOL)isHaveNavBar;

#pragma mark————————————————圆角
+ (void)viewFillet:(UIView *)view andFloat:(CGFloat)value;

#pragma mark————————————————给一个view加阴影
+ (void)viewAddYinYing:(UIView *)view;

#pragma mark————————————————无限轮播器  (依赖GDScrollBanner)
+ (void)getHederImage :(CGRect)rect :(NSArray*)imageUrlArr :(UIView *)rootView :(void(^)(int value)) block;
//图片点击的block
typedef void(^MyBlock)(int value);

#pragma mark——————————图片浏览  基于:#import "MSSBrowseDefine.h" 框架
+ (void)loadingImageViewArrWith:(NSArray *)imageUrl withImageFatherView:(UIView *)fatherView withIndex:(int)index withHiWithAnimation:(BOOL)hiWithAnimation;

#pragma mark————————————————跳转 push
+ (void)pushNextViewController:(UIViewController *)nextViewController andRootController:(UIViewController *)rootVc;


#pragma mark————————————————计算文字高度
+ (CGSize)getNSStringSize:(NSString *)string andViewWight:(CGFloat)weight andFont:(NSInteger)font;



#pragma mark———————————————— afn封装 //依赖afn 和FCXRefreshHeaderView 和SVProgressHUD
//url 接口地址
//dict 参数字典
//tableView 用来结束上下拉刷新的状态  不传不结束
//view 当前vc的view 显示菊花
//responseObjectBlock 成功之行的block
+ (void)AFNGetDataUrl:(NSString *)url Dict:(NSDictionary *)dict andTableView:(UIScrollView *)tableview andView:(UIView *)view andSuccessBlock:(responseObjectBlock)responseObjectBlock anderrorBlock:(void(^)(void))errorBlock;

+ (void)AFNPOSTDataUrl:(NSString *)url Dict:(NSDictionary *)dict andTableView:(UIScrollView *)tableview andView:(UIView *)view andSuccessBlock:(responseObjectBlock)responseObjectBlock anderrorBlock:(void(^)(void))errorBlock;


#pragma mark————————获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)ShouZiMu:(NSString *)aString;




#pragma mark——————————当前时间
+(NSString *)curTimeString;


#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串
+ (NSString *)changeTimeCuo:(NSString *)DateFormat : (NSString *)time;


#pragma mark——————————————————NSString转NSDate
+ (NSDate *)NSStringToNSDate:(NSString *)dateStr;

#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串 (只有年月日)
+ (NSString *)changeTimeCuoNianYueRi:(NSString *)time;

#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串 (只有年月日 时分 没有秒)
+ (NSString *)changeTimeCuoNianYueRiShiFen:(NSString *)time;

#pragma mark——————————————转换时间锉 传入时间锉字符串  得到解析后的字符串 (只有月日)
+ (NSString *)changeTimeCuoYueRi:(NSString *)time;

#pragma mark——————————————nsdate转时间锉
+ (NSString *)NSDateChangeTimeCuo:(NSString *)time;

#pragma mark——————————传入时间cuo得到nsdate
+ (NSDate *)NSStringToNSDateWithTimeCuo:(NSString *)shijiancuo;

#pragma mark————————————去掉hmtl正则
+(NSString *)filterHTML:(NSString *)html;

#pragma mark——————————————获取当前版本号
+ (NSString *)getAPPBanben;


#pragma mark——————————————设置view外边框
+ (void)lableBianKuang:(UIView *)lable andColor:(UIColor *)color;

#pragma mark——————————————删除View外边框
+ (void)removeViewBianKuang:(UIView *)view;

#pragma mark——————————————设置lable外边框并且加上角度
+ (void)lableBianKuang:(UIView *)lable andColor:(UIColor *)color andRadius:(float)radius;



#pragma mark——————————给view 添加一个黑色透明背景 如果为空  就添加到window
- (void)addBackView:(UIView *)view;
#pragma mark——————————隐藏背景
- (void)dismissSelfView;
//隐藏背景后的block
//选择完成后的回调
typedef void (^seletedBlock) (void);
@property (nonatomic,strong)seletedBlock seletedblock;





#pragma mark————————————根据sb来实例化vc并且跳转 (Sbname sb名字  ViewController要跳转的类的对象可以直接类名 new  selfVc 当前vc )注意： sb名字一定要和SB id 一样不然会崩
+ (void)pushSbVcSbname:(NSString *)Sbname andVc:(UIViewController *)ViewController andSelfVc:(UIViewController *)selfVc;




#pragma mark————————————————清除sdwebImage里面的缓存
+ (void)clearSDWebImageChace;

#pragma mark————————————————获取sdwebImage缓存大小
+ (void)getSDWebImageChaceSize:(SDWebImageCalculateSizeBlock)completionBlock;


#pragma mark——————————获取当前时间到毫秒
+ (NSString *)getTimeNow;

#pragma mark————————————获取当前设备时间小时制
+ (BOOL)getDeviceTimeType;

#pragma mark————————svp提醒
+ (void)svpInfo:(NSString *)title;


#pragma mark——————————图片数量 按需求传张树
#define putImageNumber(number)  number

#pragma mark——————————获取系统版本
#pragma mark——————————外部版本
+ (NSString *)getVersionID;
#pragma mark——————————内部版本
+ (NSString *)getbuild;
#pragma mark————————————uilable顶部对齐
+ (void)lableTopAlignment:(UILabel *)lable;

//手机号码是否正确
+ (BOOL)isMobileNumber:(NSString *)mobileNum;


// 根据图片url获取图片尺寸
+(CGSize)getImageSizeWithURL:(id)imageURL;

#pragma mark——————————增加下啦刷新
+ (void)tableViewAddRefreshHeader:(UIScrollView *)scrollView withTarget:(id)target  refreshingAction:(SEL)action;

#pragma mark——————————增加上拉加载更多
+ (void)tableViewAddRefreshFooter:(UIScrollView *)scrollView withTarget:(id)target refreshingAction:(SEL)action;

#pragma mark——————————增加上拉加载更多Block版本
//+ (void)tableViewAddRefreshFooter:(UIScrollView *)scrollView withBlock:(MJRefreshComponentRefreshingBlock)block;

#pragma mark————————————计算两个经纬度间的距离得到米或千米
//LocationOne LocationTwo 两个经纬度
+ (NSString *)getAddressNumberAddressOne:(CLLocationCoordinate2D )LocationOne  withAddressTwo:(CLLocationCoordinate2D )LocationTwo;


#pragma mark _____点击图片显示大图
+ (void)openBigImage:(UIImageView *)imageView withImageArr:(NSArray *)imageArr;


//时间挫转换成距离现在多久
+ (NSString *)distanceTimeWithBeforeTime:(NSString *)shijiancuo;

#pragma mark——————————————给lable加上黑线
+ (void)withLableAddBlackLin:(UILabel *)lable;

#pragma mark——————————————给lable某段文字颜色
+ (void)withLableAddColorWithLable:(UILabel *)lable with:(NSString *)colorString WithColor:(UIColor *)color;

#pragma mark——————————————lable顶部对齐
+ (void)LableAlignTop:(UILabel *)lable;

#pragma mark——————————————lable行间距(整个)
+ (void)LableRowFloat:(UILabel *)lable  withRowNumber:(CGFloat)rowNumber;

#pragma mark————————————————————友盟分享
/**
 *  友盟分享
 *
 *  @param shareUrl 分享链接地址(点击)
 *  @param vc       当前vc
 *  @param title    标题
 *  @param image    分享图片
 *  @param Source   分享来源(活动. 商品...) 字符串
 */
//+ (void)UMShareWithShareUrl:(NSString *)shareUrl  withViewController:(UIViewController *)vc  withTitle:(NSString *)title  withImage:(UIImage *)image withSource:(NSString *)Source;


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
//+ (void)UMShareWithShareUrl:(NSString *)shareUrl  withViewController:(UIViewController *)vc  withTitle:(NSString *)title  withImage:(UIImage *)image withSource:(NSString *)Source withShareType:(UMSocialPlatformType)formType withCompletion:(UMSocialRequestCompletionHandler)completion;



#pragma mark————————————————————UIColor 转UIImage
+ (UIImage*)createImageWithColor:(UIColor*) color;

#pragma mark————————————————————UIImage转UIColor
+ (void)imageToColor:(UIImage *)image;

#pragma mark——————————————SDWebImage加载图片
/**
 *  @param imageView        当前的imageView
 *  @param imageUrl         图片地址
 *  @param placeholderImage 占位图
 *  @param completedBlock          下载结束的block 和sd的一样
 */
/**
 *  @param imageView        当前的imageView
 *  @param imageUrl         图片地址
 *  @param placeholderImage 占位图
 *  @param completedBlock          下载结束的block 和sd的一样
 */
#pragma mark——————————————SDWebImage加载图片
+ (void)sd_setImageWithimageView:(UIImageView *)imageView withImageUrl:(NSString *)imageUrl  withPlaceholderImage:(UIImage *)placeholderImage withCompleted:(SDWebImageCompletionBlock)completedBlock;



#pragma mark————————————uiimage渐渐模糊的效果 //需要CoreAnimationEffect工具
/**
 *  @param images    图片数组
 *  @param imageView 要模糊的iamgeView
 */
+ (void)imageWithBlurWithImageArr:(NSArray *)images  withImageView:(UIImageView *)imageView;


#pragma mark————————————————上传图片
/**
 *  @param dict       参数
 *  @param addressUrl 上传地址
 *  @param imageArr   图片数组
 *  @param view       要显示加载框的view
 *  @param success    返回的结果
 */
#pragma mark————————————————上传图片
+ (void)afnPostImageWithDict:(NSDictionary *)dict WithAddressUrl:(NSString *)addressUrl withImageArr:(NSArray *)imageArr withFileName:(NSString *)fileName   WithView:(UIView *)view   success:(responseObjectBlock)responseObjectBlock;



#pragma mark——————————————————递归 类似@[@[@"黄色",@"红色"],@[@"X号",@"M号"],@[@"全新",@"九成新"]] 这种每个规格都遍历一次 最后的到 黄色 x号 全新, 黄色 x号 九成新..  这种
/**
 *
 *
 *  @param t t默认传一个空数组
 *  @param a 模型数组
 *  @param n 模型数组的长度 count
 *  @param r 要返回的可变数组（必须初始化）
 */
+ (void)f:(NSArray *)t :(NSArray *)a :(long)n  withoverArr:(NSMutableArray *)r;


#pragma mark————————————————地理编码和逆地理编码
//（1）地理编码方法
+ (void )geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler;


//（2）反地理编码方法
+ (void )reverseGeocodeLocation:(CLLocation *)location completionHandler:(CLGeocodeCompletionHandler)completionHandler;


#pragma mark——————————清除button的点击事件
+ (void)removeAllTargets:(UIButton *)button;


#pragma mark———————————把网址改成html标签的字符串
+ (NSString *)htmlAddressToHtmlString:(NSString *)url;

#pragma mark——————————更改网页内容宽高
+ (NSString *)changeHtmlContentSize:(NSString *)htmlString;

#pragma mark——————————UIView转UIImage
+ (UIImage*)convertViewToImage:(UIView*)view;


#pragma mark——————————————压缩图片
+ (void)compressImage:(UIImage *)image withOverBlock:(void (^)(NSData *data))block;

#pragma mark——————————————unencodedString
+ (NSString*)encodeString:(NSString*)unencodedString;


//返回索引的block
typedef void (^touchIndex)(int index);
#pragma mark——————————————弹出提示框
+ (void)showAlert:(NSString *)alterTitle  with_Controller:(UIViewController *)controller with_titleArr:(NSArray *)titieArray withShowType:(UIAlertControllerStyle)preferredStyle  with_Block:(touchIndex)touchBlock;


#pragma mark———————————获取当前屏幕显示的viewcontroller 适用范围，tabbar的子视图都是NavigationController，其它情况可以根据情况调整
+ (UIViewController *)getCurrentVC;

#pragma mark————————————清除view所有约束
+ (void)removeAllAutoLayout:(UIView *)view;


#pragma mark————————————————封装的mj转模型 (字典数组转模型数组)
+ (NSArray *)MJModel_WithArr:(NSDictionary *)dict withModelClass:(Class)modelClass;

#pragma mark————————————————封装的mj转模型 (字典转模型)
+ (id)MJModel_WithDict:(NSDictionary *)dict withModelClass:(id)model;

#pragma mark————————————————封装的mj转模型 (字典转模型)
+ (NSDictionary *)MJModel_ModelToDict:(NSObject *)model;

#pragma mark————————————添加模糊view
+ (UIView *)addBlurView:(CGRect)rect WithStyle:(UIBlurEffectStyle)style;
 

#pragma mark———————————— 此方法随机产生32位字符串， 修改代码红色数字可以改变 随机产生的位数。
+(NSString *)ret32bitString;

#pragma mark————————————NSDict 转 json
+ (NSString*)DataTOjsonString:(id)object;

#pragma mark————————————json字符串转NSDict
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark——————————————————————————————————下载文件
//url  文件地址
//path 文件存到所在路径 (例 musics/)
//inView 所在view 展示进度
//dataType 下载文件类型
//成功返回一个路径

+ (void)AFNDownloadData:(NSString *)url  withDataSavePath:(NSString *)path  withDataType:(ENUM_DataType)dataType  withInView:(UIView *)inView  withOverBlock:(responseObjectBlock)overBlock;

 
#pragma mark——————————————音乐播放器
- (void)initPlayer:(NSString *)playUrl;


#pragma mark——————————————音乐播放器(录制视频界面，重新初始化)
- (void)initPlayerToVedeo:(NSString *)playUrl;


#pragma mark————————————————屏幕中间一个大的倒计时
+ (void)inWindowCounterLable:(seletedBlock)overBlock;

#pragma mark————————————————传入 秒  得到 xx:xx:xx
+(NSString *)getYYMMSSFromSS:(NSString *)totalTime;

#pragma mark————————————————传入 秒  得到  xx分钟xx秒
+(NSString *)getMMSSFromSS:(NSString *)totalTime;

#pragma mark——————————————旋转播放器
//+ (void)rotateVideoView:(MPMoviePlayerViewController *)movePlayerViewController degrees:(NSInteger)degrees;

#pragma mark—————————————— 获取视频方向
+ (NSUInteger)degressFromVideoFileWithURL:(NSURL *)url;

//HmacSHA1加密  HmacSHA1加密需要用到的库是:CommonCryptor
+(NSString *)Base_HmacSha1:(NSString *)key data:(NSString *)data;

//BASE 64 MD5加密 GTMBase64
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString;

#pragma mark————————————七牛获取下载token  传入最初的url 如http://olwr9qsl2.bkt.clouddn.com/o_1ba51vq271s4v37h1p6o1i3vrua9.flv 得到最后拼接好的url
+ (NSString *)QNGetTokenWithUrl:(NSString *)url;


#pragma mark————————————————————苹果自带的md5加密
+ (NSString *) md5:(NSString *) input;


#pragma mark————————————按钮倒计时
+ (void)daojishi:(NSInteger)miao  withButton:(UIButton *)button;

#pragma mark————————————————选取照片 依赖XHPhoto CanEdit是否编辑 objectBlock得到最后的图片
+ (void)SelectionImage:(UIViewController *)vc withCanEdit:(BOOL)CanEdit withResponseBlock:(responseObjectBlock)objectBlock;

#pragma mark————————————————下拉header放大
//scrollView    imgView下拉放大的view  headerView添加到底部不跟随放大的headerView
+ (void)headViewtoBigWithScoview:(UIScrollView *)scrollView  withImg:(UIView *)imgView withHeaderView:(UIView *)headerView;

#pragma mark———————————— 是否包含某个字符串
+ (BOOL)isHaveStringWithString:(NSString *)str withHaveStr:(NSString *)isHaveStr;

#pragma mark————————————————数据库操作 (详看https://github.com/netyouli/WHC_ModelSqliteKit)
/**
 * 说明: 存储模型到本地
 * @param model_object 模型对象
 */

+ (BOOL)insert:(id)model_object;

/**
 * 说明: 查询本地模型对象
 * @param model_class 模型类
 * @param where 查询条件(查询语法和SQL where 查询语法一样，where为空则查询所有)
 * @return 查询模型对象数组
 */

+ (NSArray *)query:(Class)model_class where:(NSString *)where;


/**
 * 说明: 删除本地模型对象
 * @param model_class 模型类
 * @param where 查询条件(查询语法和SQL where 查询语法一样，where为空则删除所有)
 */

+ (BOOL)remov:(Class)model_class where:(NSString *)where;



#pragma mark—————————————判断字符串字符数
+  (int)charNumber_withStr:(NSString *)str;

#pragma mark————————————获取本地json
+ (id)getFielJson:(NSString *)jsonName;

#pragma mark————————————初始化一个ID和类名都一样的vc
+ (UIViewController *)addVc_vcClassName:(NSString *)vcClassName;

#pragma mark————————————打开大图(依赖HJPhotoBrowser)
+ (void)instanceHJPhotoBrowser_withimgUrlArr:(NSArray *)urlArr with_placeholderImageArr:(NSArray *)placeholderImageArr  with_currentImageIndex:(NSInteger)currentImageIndex with_sourceImagesContainerView:(UIView *)sourceImagesContainerView;


#pragma mark————————局部圆角
+ (void)LocalFillet:(UIView *)view withCorners:(UIRectCorner)corners withFilletSize:(CGSize)size;

#pragma mark——————————————给view添加一个敲击手势
+ (void)viewAddTapWithView:(UIView *)view withTarget:(nullable id)target withAction:(nullable SEL)action;

#pragma mark——————————以下功能基于TZImagePickerController框架(注意返回值 使用时候最好判断一下返回类型)
/** 相册 */
- (void)openAlbumWithMaxImgNumber:(int)maxNumber WithCuVc:(UIViewController *)cuVc  withOverBlock:(responseObjectBlock)dataBlock;

/** 相机 */
- (void)openCameraWithCuVc:(UIViewController *)cuVc withOverBlock:(responseObjectBlock)dataBlock;

/** 录像 */
- (void)openVideotapeMaxTime:(int)maxTime WithCuVc:(UIViewController *)cuVc withOverBlock:(responseObjectBlock)dataBlock;

/** 视频 */
- (void)openVideoWithCuVc:(UIViewController *)cuVc withOverBlock:(responseObjectBlock)dataBlock;

+ (NSString *)positiveFormat:(NSString *)text;
//判断是不是空字符串
+(BOOL)charIsNil:(NSString *)str;


#pragma mark——————————手机号正则  YES or NO
+ (BOOL)phoneValiMobile:(NSString *)mobile;

+(NSString *)PhoneModel:(NSString *)phoneStr;

#pragma mark————————生成二维码
+(UIImage *)createNonInterpolatedUIImageFormString:(NSString*)Path withSize:(CGFloat) size;
#pragma mark————————————模糊效果(类似玻璃,依赖CoreBlurView)
+ (void)addBlurWithView:(UIView *)inView;

+(UIImage *) getImageFromURL:(NSString *)fileURL;
#pragma mark————————得到银行名字
+ (NSString *)getBankName:(NSString*) cardId;

@end
