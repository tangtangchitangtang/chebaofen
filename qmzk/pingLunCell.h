//
//  pingLunCell.h
//  
//
//  Created by tangtangchitangtang on 2017/6/27.
//
//

#import "BaseTableViewCell.h"

@interface pingLunCell : BaseTableViewCell
@property(nonatomic,strong)UIViewController *viewController;
@property(nonatomic,strong)NSDictionary *typeDic;
-(CGFloat)cretView;
@end
