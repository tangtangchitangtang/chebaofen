//
//  BaseModel.h
//  jiedian
//
//  Created by 美街美店 on 16/5/5.
//  Copyright © 2016年 com.jiedian.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BaseModel : NSObject
//一些基本属性
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *num;
@property(nonatomic,copy)NSString *pid;
@property (nonatomic,assign)int tag;


#pragma mark——————————后台返回字段 
@property (nonatomic,strong)NSString *code; //结果：0，失败；1 .成功
@property (nonatomic,strong)NSString *resCode; //9999 是没这个接口 其他待定
@property (nonatomic,strong)NSString *msg; //失败说明
@property (nonatomic,strong)id data; //返回的数据


#pragma mark————————————获取七牛token
@property (nonatomic,strong)NSString *uptoken;

#pragma mark————————————收到消息
//使用推送的好几个地方：
//1，申请加入舞队时，队长收到推送，type是applyQueue
//2，队长同意时，成员收到推送，type是allowQueue
//3，队长拒绝时，成员收到推送，type是rejectQueue
//4，队长解散舞队，成员收到推送，type是quitQueue（不加入未读消息列表）
//5，成员离开舞队，队长收到推送，type是quitQueue（不加入未读消息列表）
//6，评论视频，视频用户收到推送，type是comment（不在通知栏显示，只在 消息模块中显示数目）
//7，回复评论，被回复的用户收到推送，type是comment（不在通知栏显示，只在 消息模块中显示数目）
//8，点赞评论，被点赞的用户收到推送，type是praiseComment（不在通知栏显示，只在 消息模块中显示数目）
//9，关注，被关注的用户收到推送，type是follow（不在通知栏显示，只在 消息模块中显示数目）
//其中，调用同意或者拒绝加入舞队时，后台一并上报了未读，不用单独上报

@property (nonatomic,copy)NSString *content; //根据业务返回的json串

@property (nonatomic,copy)NSString *receiver; //接收者，例如舞队队长

@property (nonatomic,copy)NSString *sender; //发送者

@property (nonatomic,copy)NSString *type; //类型：申请加入舞队是：applyQueue（未读）  allowQueue得到申请结果  quitQueue是解散舞队

@property (nonatomic,copy)NSString *valid; //是否有效

@property (nonatomic,copy)NSString *messageId ;//未读消息ID

@property (nonatomic,copy)NSString *upTime;//更新时间

@property (nonatomic,copy)NSString *alert;//提醒文字

#pragma mark————————————content 里面包含的
@property (nonatomic,copy)NSString *queueId; //队伍id



#pragma mark——————————————地图选取后经纬度
@property(assign, nonatomic) CGFloat lat;
@property(assign, nonatomic) CGFloat lng;


@property (nonatomic,copy)NSString *addressString;

@end
