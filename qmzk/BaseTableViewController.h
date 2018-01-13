//
//  BaseTableViewController.h
//  jiedian
//
//  Created by 美街美店 on 16/5/5.
//  Copyright © 2016年 com.jiedian.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQTools.h"

@interface BaseTableViewController : UITableViewController

@property (nonatomic,strong)ZQTools *tools;

@property (nonatomic,assign)int index; //数据页数
 
- (void)popVc;//返回上一夜
@end
