//
//  tanKuanView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/8.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaseView.h"

@interface tanKuanView : BaseView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSDictionary *typeDic;
@property(nonatomic,strong)UIPickerView *picker;
@property(nonatomic,strong)NSArray *typeArr;
@property(nonatomic,strong)UIButton *quXiao;
-(void)cretView;
@end
