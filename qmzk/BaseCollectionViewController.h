//
//  BaseCollectionViewController.h
//  jiedianwang
//
//  Created by 美街美店 on 16/5/10.
//  Copyright © 2016年 com.jiedianwang.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewController : UICollectionViewController


@property (nonatomic,assign)int index; //数据页数

 
- (void)popVc;//返回上一页
@end
