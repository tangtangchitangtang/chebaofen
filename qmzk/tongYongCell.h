//
//  tongYongCell.h
//  yiyou
//
//  Created by tangtangchitangtang on 2017/8/9.
//  Copyright © 2017年 tangtangchitangtang. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface tongYongCell : BaseTableViewCell
@property(nonatomic,strong)UIViewController *viewController; 
@property(nonatomic,assign)int abc;
@property(nonatomic,strong)UIImageView *dianZan;
@property(nonatomic,strong)UILabel *zanLabel;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)NSMutableArray *evaluates;
@property(nonatomic,strong) NSArray *notesImage;
@property(nonatomic,assign)BOOL isZan;

-(CGFloat)creatView;
-(CGFloat)creatView2;
-(CGFloat)creatView3;

@end
