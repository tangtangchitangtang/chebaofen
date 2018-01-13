//
//  huiFuView.h
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/20.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface huiFuView : BaseView<UITextViewDelegate>
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)UITextView *textView;
-(void)creastView;

@end
