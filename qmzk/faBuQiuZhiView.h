//
//  faBuQiuZhiView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/5.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"
#import "tanKuanView.h"
#import "yaoQiuSelectView.h"
@interface faBuQiuZhiView : BaseView<UITextFieldDelegate,UITextViewDelegate>
@property(nonatomic,strong)UITextField *diZhiText,*nameText,*phoneText,*zhiWeiLabel2;
@property(nonatomic,strong)UILabel *yaoQiuText,*yangYeLabel;
@property(nonatomic,strong)UITextView *miaoSuText;
@property(nonatomic,strong)UITextField *stopBtn,*startBtn;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong)yaoQiuSelectView *yaoQiuView;
@property(nonatomic,strong)NSNumber *employNum,*workExperience;
@property(nonatomic,strong)NSString *education;
@property(nonatomic,strong)NSDictionary *typeDic;
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)tanKuanView *tan;
@property(nonatomic,strong)NSNumber *expectedIndustry,*expectedFunction,*parentId;

-(void)creatView;

@end
