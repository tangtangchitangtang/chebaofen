
//
//  tongYongCell.m
//  yiyou
//
//  Created by tangtangchitangtang on 2017/8/9.
//  Copyright © 2017年 tangtangchitangtang. All rights reserved.
//

#import "tongYongCell.h"
#import "huiFuView.h"
@implementation tongYongCell

-(CGFloat)creatView
{
    
  
    self.backgroundColor=_LightGrey;

    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];

    
    UIImageView *touXiang=[UIImageView new];
    [beiJingView addSubview:touXiang];
    [touXiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_mainW*0.05);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(40);
    }];
    touXiang.layer.masksToBounds=YES;
    touXiang.layer.cornerRadius=20;
    NSString *userImage=[_dic objectForKey:@"userImage"];
    [touXiang sd_setImageWithURL:[NSURL URLWithString:userImage]];
    
    UILabel *nameLabel=[UILabel new];
    [beiJingView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(touXiang.mas_right).mas_equalTo(5);
        make.top.mas_equalTo(touXiang);
        make.height.mas_equalTo(20);
    }];
    nameLabel.text=[_dic objectForKey:@"userNickname"];
    nameLabel.font=[UIFont systemFontOfSize:17];
    
    NSNumber *grade=[_dic objectForKey:@"grade"];
    int index=grade.floatValue+0.5;
    if (index>5) {
        index=5;
    }
    for (int i=0; i<index; i++) {
        UIImageView *xingImage=[UIImageView new];
        [self addSubview:xingImage];
        [xingImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameLabel.mas_left).mas_equalTo(23*i);
            make.height.width.mas_equalTo(15);
            make.top.mas_equalTo(nameLabel.mas_bottom).mas_equalTo(5);
        }];
        xingImage.image=[UIImage imageNamed:@"star1"];
    }
    
    
//    UIImageView *weiZhiIamge=[UIImageView new];
//    [beiJingView addSubview:weiZhiIamge];
//    [weiZhiIamge mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(touXiang);
//        make.left.mas_equalTo(nameLabel);
//        make.height.mas_equalTo(15);
//        make.width.mas_equalTo(10);
//    }];
//    weiZhiIamge.image=[UIImage imageNamed:@"坐标-拷贝"];
//
//    UILabel *weiZhiLabel=[UILabel new];
//    [beiJingView addSubview:weiZhiLabel];
//    [weiZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(weiZhiIamge.mas_right).mas_equalTo(5);
//        make.centerY.mas_equalTo(weiZhiIamge);
//    }];
//    weiZhiLabel.text=@"重庆市";
//    weiZhiLabel.textColor=ColorWithRGB(63, 195, 148);
//    weiZhiLabel.font=[UIFont systemFontOfSize:12];
    
    
    UILabel *timeLabel=[UILabel new];
    [beiJingView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(touXiang);
        make.right.mas_equalTo(-15);
    }];
    
    NSString *createTime=[NSString stringWithFormat:@"%lld",[[_dic objectForKey:@"createTime"] longLongValue]];
    timeLabel.text=[ZQTools changeTimeCuo:@"yyyy/MM/dd" :createTime];
    timeLabel.textColor=ColorWithRGB(170, 170, 170);
    timeLabel.font=[UIFont systemFontOfSize:12];
    
    UILabel *neiRongLabel=[UILabel new];
    [beiJingView addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiang.mas_bottom).mas_equalTo(15);
        make.left.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-15);
    }];
    NSString *userSay=[_dic objectForKey:@"userSay"];
    if ([ZQTools charIsNil:userSay]) {
        userSay=@"";
    }
    neiRongLabel.numberOfLines=0;
    neiRongLabel.text=userSay;
    neiRongLabel.font=[UIFont systemFontOfSize:14];
    neiRongLabel.textColor=ColorWithRGB(170, 170, 170);
    [neiRongLabel layoutIfNeeded];
    
    NSString *sellerSay=[_dic objectForKey:@"sellerSay"];
    if ([ZQTools charIsNil:sellerSay]) {
        UIButton *btn=[UIButton new];
        [beiJingView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(neiRongLabel);
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(6);
            make.width.mas_equalTo(79);
            make.height.mas_equalTo(30);
        }];
        btn.layer.cornerRadius=3;
        btn.layer.borderColor=_backgroundColor.CGColor;
        btn.layer.borderWidth=1;
        [btn setTitle:@"回复" forState:0];
        [btn setTitleColor:_backgroundColor forState:0];
        [btn addTarget:self action:@selector(creatToPingLun:) forControlEvents:UIControlEventTouchUpInside];
        
         return 120+neiRongLabel.frame.size.height;
    }
    else{
        
        UIView *xian=[UIView new];
        [beiJingView addSubview:xian];
        [xian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(neiRongLabel);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(10);
        }];
        xian.backgroundColor=_LightGrey;
        
        UIImageView *imageView=[UIImageView new];
        [beiJingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(xian);
            make.top.mas_equalTo(xian.mas_bottom).mas_equalTo(6);
            make.height.mas_equalTo(15);
            make.width.mas_equalTo(15);
        }];
        imageView.image=[UIImage imageNamed:@"message-icon"];
        
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"商家回复:%@",sellerSay]];
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(100, 100, 100) range:NSMakeRange(5, sellerSay.length)];
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:_backgroundColor range:NSMakeRange(0,5)];
        
        UILabel *label=[UILabel new];
        [beiJingView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.top.mas_equalTo(imageView);
            make.right.mas_equalTo(neiRongLabel);
        }];
        label.numberOfLines=0;
        [label layoutIfNeeded];
        label.font=[UIFont systemFontOfSize:14];
        label.attributedText=AttributedStr;
        
        CGSize size=[ZQTools getNSStringSize:[NSString stringWithFormat:@"商家回复:%@",sellerSay] andViewWight:_mainW-100 andFont:14];
        
        
        return 120+neiRongLabel.frame.size.height+size.height;
    }

   
    return 20;
}

-(void)creatToPingLun:(UIButton *)tap{


    huiFuView *aview=[huiFuView new];
    [self.window addSubview:aview];
    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    aview.index=_index;
    aview.dic=_dic;
    [aview creastView];
}
//
////游记和评论是反的
//-(void)creatPingLun:(UITapGestureRecognizer *)tap{
//
//    huiFuView *aview=[huiFuView new];
//    [self.window addSubview:aview];
//    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.mas_equalTo(0);
//    }];
//    aview.youJiOrPingLun=@"游记";
//    aview.index=_index;
//    aview.abc=2;
//    aview.dic=[_dic objectForKey:@"notes"];
//    [aview creastView];
//}
//
//-(void)creatYouJi:(UITapGestureRecognizer *)tap{
//    huiFuView *aview=[huiFuView new];
//    [self.window addSubview:aview];
//    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.mas_equalTo(0);
//    }];
//    aview.youJiOrPingLun=@"评论";
//    aview.index=_index;
//    aview.abc=2;
//    aview.dic=_dic;
//    [aview creastView];
//
//
//}
//
//-(void)fangDaImage:(UITapGestureRecognizer *)tap{
//
//    NSMutableArray *urlArrays=[[NSMutableArray alloc] init];
//    [urlArrays addObjectsFromArray:_notesImage];
//
//
//
//    WyzAlbumViewController *wyzAlbumVC = [[WyzAlbumViewController alloc]init];
//
//    wyzAlbumVC.currentIndex =tap.view.tag;//这个参数表示当前图片的index，默认是0
//
//    //图片数组，可以是url，也可以是UIImage
//    //第一种用url
//    wyzAlbumVC.imgArr=urlArrays;
//    wyzAlbumVC.imageNameArray=nil;//图片名字数组可以为空
//    //进入动画
//    //    [self.navigationController pushViewController:wyzAlbumVC animated:NO];
//    //    [self.navigationController.view.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.0f];
//    [self.viewController presentViewController:wyzAlbumVC animated:YES completion:^{
//
//
//
//    }];
//
//}
//
//
//-(void)dianZan:(UITapGestureRecognizer *)tap{
//
//    if (_isZan) {
//        NSNumber *praiseId=[NSNumber numberWithInteger:tap.view.tag];
//        NSString *url=[NSString stringWithFormat:@"notes/cancelPraise/%@",praiseId];
//        [ZQTools AFNGetDataUrl:url Dict:nil andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
//            _isZan=NO;
//            _dianZan.image=[UIImage imageNamed:@"点赞-(3)"];
//
//            NSMutableDictionary *typeDic=[[NSMutableDictionary alloc] initWithDictionary:_dic];
//
//            NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
//            userModel *usermodel=[userModel mj_objectWithKeyValues:dic2];
//
//            NSArray *praises=[_dic objectForKeyedSubscript:@"praises"];
//            NSMutableArray *typeArr=[NSMutableArray arrayWithCapacity:0];
//            [typeArr addObjectsFromArray:praises];
//            for (int i=0; i<praises.count; i++) {
//                NSDictionary *dic=praises[i];
//                NSNumber *praiseId=[dic objectForKey:@"praiseId"];
//                if (praiseId.intValue==usermodel.id.intValue) {
//                    [typeArr removeObjectAtIndex:i];
//                    break;
//                }
//            }
//            [typeDic setValue:typeArr forKey:@"praises"];
//
//
//
//            NSMutableArray *tableArr=[NSMutableArray arrayWithCapacity:0];
//
//            NSArray *arr= [NSKeyedUnarchiver unarchiveObjectWithFile:_userYouJiFile];
//
//            [tableArr addObjectsFromArray:arr];
//
//            NSDictionary *notes2=[_dic objectForKeyedSubscript:@"notes"];
//            NSNumber *id2=[notes2 objectForKeyedSubscript:@"id"];
//
//            for (int i=0; i<tableArr.count; i++) {
//                NSDictionary *dic=tableArr[i];
//                NSDictionary *notes=[dic objectForKeyedSubscript:@"notes"];
//                NSNumber *id=[notes objectForKeyedSubscript:@"id"];
//
//                if (id.integerValue==id2.intValue) {
//                    [tableArr replaceObjectAtIndex:i withObject:typeDic];
//                }
//            }
//            [NSKeyedArchiver archiveRootObject:tableArr toFile:_userYouJiFile];
//
//            NSNotification * notice = [NSNotification notificationWithName:@"dianZan" object:nil userInfo:responseObject];
//            //发送消息
//            [[NSNotificationCenter defaultCenter]postNotification:notice];
//
//
//        } anderrorBlock:nil];
//
//    }
//    else{
//        NSDictionary *notes=[_dic objectForKey:@"notes"];
//
//        NSNumber *notesId=[notes objectForKey:@"id"];
//        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:notesId,@"notesId", nil];
//        [ZQTools AFNGetDataUrl:@"notes/notesPraise" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
//
//
//
//            _isZan=YES;
//            _dianZan.image=[UIImage imageNamed:@"dz2"];
//
//            NSDictionary *typeDic2=responseObject;
//
//            NSMutableDictionary *typeDic=[[NSMutableDictionary alloc] initWithDictionary:_dic];
//
//            NSArray *praises=[_dic objectForKeyedSubscript:@"praises"];
//            NSMutableArray *typeArr=[NSMutableArray arrayWithCapacity:0];
//            [typeArr addObjectsFromArray:praises];
//            [typeArr addObject:typeDic2];
//            [typeDic setValue:typeArr forKey:@"praises"];
//
//            NSMutableArray *tableArr=[NSMutableArray arrayWithCapacity:0];
//
//            NSArray *arr= [NSKeyedUnarchiver unarchiveObjectWithFile:_userYouJiFile];
//
//            [tableArr addObjectsFromArray:arr];
//
//            NSDictionary *notes2=[_dic objectForKeyedSubscript:@"notes"];
//            NSNumber *id2=[notes2 objectForKeyedSubscript:@"id"];
//
//            for (int i=0; i<tableArr.count; i++) {
//                NSDictionary *dic=tableArr[i];
//                NSDictionary *notes=[dic objectForKeyedSubscript:@"notes"];
//                NSNumber *id=[notes objectForKeyedSubscript:@"id"];
//
//                if (id.integerValue==id2.intValue) {
//                    [tableArr replaceObjectAtIndex:i withObject:typeDic];
//                }
//            }
//            [NSKeyedArchiver archiveRootObject:tableArr toFile:_userYouJiFile];
//
//            NSNotification * notice = [NSNotification notificationWithName:@"dianZan" object:nil userInfo:responseObject];
//            //发送消息
//            [[NSNotificationCenter defaultCenter]postNotification:notice];
//
//        } anderrorBlock:nil];
//    }
//
//}
//
//-(CGFloat)creatView3{
//
//    UILabel *label=[UILabel new];
//    [self addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_offset(0);
//    }];
//    label.text=@"查看全部";
//    label.font=[UIFont systemFontOfSize:13];
//    label.textColor=ColorWithRGB(92, 162, 209);
//
//    return 44;
//}


@end
