//
//  xiuGaiView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/30.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"
#import "tanKuanView.h"
#import "SameCityAddHeaderView.h"
#import "shangPingTianJiaXiang.h"
#import "changYongShiJianSelect.h"
@interface xiuGaiView : BaseView<UITextFieldDelegate>
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)NSDictionary *typeDic;
@property(nonatomic,strong)shangPingTianJiaXiang *xiang;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITextField *zhuTiText,*priceText,*priceText2,*kuCunText;
@property(nonatomic,strong)UITextField *shiYongText,*yuYueText,*renShuText;
@property(nonatomic,strong)UILabel *xiangQingText,*caiDanLabel,*quYuText,*youXiaoText;
@property(nonatomic,strong)NSNumber *goodsBelongType,*goodsType;
@property(nonatomic,strong)tanKuanView *tan;
@property(nonatomic,strong)SameCityAddHeaderView *imageview;
@property(nonatomic,strong)NSString *validityTime;
@property(nonatomic,strong)changYongShiJianSelect *timeView;
-(void)creatView;
-(void)creatView2;
@end
