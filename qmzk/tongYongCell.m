
//
//  tongYongCell.m
//  yiyou
//
//  Created by tangtangchitangtang on 2017/8/9.
//  Copyright © 2017年 tangtangchitangtang. All rights reserved.
//

#import "tongYongCell.h"
#import "huiFuView.h"
#import "WyzAlbumViewController.h"
@implementation tongYongCell

-(CGFloat)creatView
{
    
    NSLog(@"%@",_dic);
    
    NSArray *typeArr=[_dic objectForKey:@"evaluates"];
    [_evaluates addObjectsFromArray:typeArr];
    self.backgroundColor=_LightGrey;
    
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
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
    
    UIImageView *weiZhiIamge=[UIImageView new];
    [beiJingView addSubview:weiZhiIamge];
    [weiZhiIamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(touXiang);
        make.left.mas_equalTo(nameLabel);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(10);
    }];
    weiZhiIamge.image=[UIImage imageNamed:@"坐标-拷贝"];
    
    UILabel *weiZhiLabel=[UILabel new];
    [beiJingView addSubview:weiZhiLabel];
    [weiZhiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weiZhiIamge.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(weiZhiIamge);
    }];
    weiZhiLabel.text=@"重庆市";
    weiZhiLabel.textColor=ColorWithRGB(63, 195, 148);
    weiZhiLabel.font=[UIFont systemFontOfSize:12];
    
    
    NSDictionary *notes=[_dic objectForKey:@"notes"];
    
    UILabel *timeLabel=[UILabel new];
    [beiJingView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(touXiang);
        make.right.mas_equalTo(-_mainW*0.05);
    }];
    
    NSString *createTime=[NSString stringWithFormat:@"%lld",[[notes objectForKey:@"createTime"] longLongValue]];
    timeLabel.text=[ZQTools getLeiSiQQShiJian:createTime];
    timeLabel.textColor=ColorWithRGB(170, 170, 170);
    timeLabel.font=[UIFont systemFontOfSize:12];
    
    UILabel *neiRongLabel=[UILabel new];
    [beiJingView addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiang.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(_mainW*0.05);
        make.right.mas_equalTo(-_mainW*0.05);
    }];
    neiRongLabel.numberOfLines=5;
    neiRongLabel.text=[notes objectForKey:@"notesContent"];
    neiRongLabel.font=[UIFont systemFontOfSize:14];
    neiRongLabel.textColor=ColorWithRGB(170, 170, 170);
    [neiRongLabel layoutIfNeeded];
    
    NSString *notesArr=[notes objectForKey:@"notesImage"];
    
    if ([ZQTools charIsNil:notesArr]) {
        notesArr=@"";
    }
    else{
        _notesImage=[notesArr componentsSeparatedByString:@","];
    }
   

    
    for (int i=0; i<_notesImage.count; i++) {
        int x=i%3;
        int y=i/3;
        
        UIImageView *tuPian=[UIImageView new];
        [beiJingView addSubview:tuPian];
        [tuPian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(y*0.285*_mainW+15);
            make.width.height.mas_equalTo(0.27*_mainW);
            make.left.mas_equalTo(0.05*_mainW+_mainW*x*0.285);
        }];
        [tuPian sd_setImageWithURL:[NSURL URLWithString:_notesImage[i]]];
        tuPian.userInteractionEnabled=YES;
        tuPian.tag=i;
        UITapGestureRecognizer *tapGesture12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fangDaImage:)];
        [tuPian addGestureRecognizer:tapGesture12];
        
    }
    int Y=((int)_notesImage.count-1)/3+1;
    
    NSArray *praises=[_dic objectForKey:@"praises"];

    _isZan=NO;

    UIImageView *pingLun=[UIImageView new];
    [beiJingView addSubview:pingLun];
    [pingLun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(timeLabel);
        make.width.height.mas_equalTo(20);
        make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(Y*0.285*_mainW+20);

    }];
    pingLun.image=[UIImage imageNamed:@"评论-(2)"];
    pingLun.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatPingLun:)];
    [pingLun addGestureRecognizer:tapGesture2];

    
    _dianZan=[UIImageView new];
    [beiJingView addSubview:_dianZan];
    [_dianZan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(pingLun.mas_left).mas_equalTo(-20);
        make.width.height.mas_equalTo(20);
        make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(Y*0.285*_mainW+20);
    }];
    _dianZan.image=[UIImage imageNamed:@"点赞-(3)"];
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    userModel *usermodel=[userModel mj_objectWithKeyValues:dic2];
    for (int i=0; i<praises.count; i++) {
        NSDictionary *dic=praises[i];
        NSNumber *praiseId=[dic objectForKey:@"praiseId"];
        NSLog(@"%@",dic);
        if (praiseId.intValue==usermodel.id.intValue) {
            _isZan=YES;
            _dianZan.image=[UIImage imageNamed:@"dz2"];
             _dianZan.tag=[[dic objectForKey:@"id"] intValue];
            break;
        }
       
    }
    _dianZan.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dianZan:)];
    [_dianZan addGestureRecognizer:tapGesture12];

    
    UILabel *Xian=[UILabel new];
    [beiJingView addSubview:Xian];
    [Xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dianZan.mas_bottom).mas_equalTo(10);
        make.left.right.mas_equalTo(neiRongLabel);
        make.height.mas_equalTo(0.7);
    }];
    Xian.backgroundColor=_LightGrey;
    
    UIImageView *zanImage=[UIImageView new];
    [beiJingView addSubview:zanImage];
    [zanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Xian);
        make.top.mas_equalTo(Xian.mas_bottom).mas_equalTo(10);
        make.width.height.mas_equalTo(20);
    }];
    zanImage.image=[UIImage imageNamed:@"dz2"];
    
    _zanLabel=[UILabel new];
    [beiJingView addSubview:_zanLabel];
    [_zanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(zanImage);
        make.left.mas_equalTo(zanImage.mas_right).mas_equalTo(3);
        make.right.mas_equalTo(Xian);
    }];
    

    NSString *renNum=@"";
    int abc=(int)praises.count;
    if (praises.count>3) {
        abc=3;
    }
    for (int i=0; i<abc; i++) {
        NSDictionary *dic2=praises[i];
        if (i==0) {
            renNum=[NSString stringWithFormat:@"%@",[dic2 objectForKey:@"praiseNickname"]];
        }else{
            renNum=[NSString stringWithFormat:@"%@、%@",renNum,[dic2 objectForKey:@"praiseNickname"]];
        }
    }
    
    NSString *abc2=[NSString stringWithFormat:@"%d",(int)praises.count];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@等%@人点赞",renNum,abc2]];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(0, renNum.length)];
     [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(renNum.length,4+abc2.length)];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, renNum.length+4+abc2.length)];
    _zanLabel.attributedText=AttributedStr;
    _zanLabel.numberOfLines=0;
    [_zanLabel layoutIfNeeded];
    
    
    UIView *pingView=[UIView new];
    [beiJingView addSubview:pingView];
    CGFloat height=[self creatZanView:pingView];
    
    [pingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_zanLabel.mas_bottom).mas_equalTo(10);
        make.left.right.mas_equalTo(Xian);
        make.height.mas_equalTo(height);
    }];
    pingView.backgroundColor=_LightGrey;
    return 75+neiRongLabel.frame.size.height+Y*0.285*_mainW+15+25+11+_zanLabel.frame.size.height+30+height;
    
}
-(CGFloat)creatView2
{
    
    
    NSArray *typeArr=[_dic objectForKey:@"replies"];
    [_evaluates addObjectsFromArray:typeArr];
    self.backgroundColor=_LightGrey;

    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
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
        make.centerY.mas_equalTo(touXiang);
        make.height.mas_equalTo(20);
    }];
    nameLabel.text=[_dic objectForKey:@"userNickname"];
    nameLabel.font=[UIFont systemFontOfSize:17];

    UILabel *timeLabel=[UILabel new];
    [beiJingView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(touXiang);
        make.right.mas_equalTo(-_mainW*0.05);
    }];
    
    NSString *createTime=[NSString stringWithFormat:@"%lld",[[_dic objectForKey:@"createTime"] longLongValue]];
    timeLabel.text=[ZQTools getLeiSiQQShiJian:createTime];
    timeLabel.textColor=ColorWithRGB(170, 170, 170);
    timeLabel.font=[UIFont systemFontOfSize:12];

    UILabel *neiRongLabel=[UILabel new];
    [beiJingView addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiang.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(_mainW*0.05);
        make.right.mas_equalTo(-_mainW*0.05);
    }];
    neiRongLabel.numberOfLines=0;
    neiRongLabel.text=[_dic objectForKey:@"evaluateContent"];
    neiRongLabel.font=[UIFont systemFontOfSize:14];
    neiRongLabel.textColor=ColorWithRGB(170, 170, 170);
    [neiRongLabel layoutIfNeeded];

    NSString *evaluateImage=[_dic objectForKey:@"evaluateImage"];
    if ([ZQTools charIsNil:evaluateImage]) {
        evaluateImage=@"";
    }

    _notesImage=[evaluateImage componentsSeparatedByString:@","];
    
 
    
    for (int i=0; i<_notesImage.count; i++) {
        int x=i%3;
        int y=i/3;
        
        UIImageView *tuPian=[UIImageView new];
        [beiJingView addSubview:tuPian];
        [tuPian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(y*0.285*_mainW+15);
            make.width.height.mas_equalTo(0.27*_mainW);
            make.left.mas_equalTo(0.05*_mainW+_mainW*x*0.285);
        }];
        [tuPian sd_setImageWithURL:[NSURL URLWithString:_notesImage[i]]];
        tuPian.userInteractionEnabled=YES;
        tuPian.tag=i;
        UITapGestureRecognizer *tapGesture12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fangDaImage:)];
        [tuPian addGestureRecognizer:tapGesture12];
        
    }
    int Y=((int)_notesImage.count-1)/3+1;
    

    UIImageView *pingLun=[UIImageView new];
    [beiJingView addSubview:pingLun];
    [pingLun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(timeLabel);
        make.width.height.mas_equalTo(20);
        make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(Y*0.285*_mainW+20);
        
    }];
    pingLun.image=[UIImage imageNamed:@"评论-(2)"];
    pingLun.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatYouJi:)];
    [pingLun addGestureRecognizer:tapGesture2];

    
    
    UILabel *Xian=[UILabel new];
    [beiJingView addSubview:Xian];
    [Xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pingLun.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(_mainW*0.05);
        make.right.mas_equalTo(-_mainW*0.05);
        make.height.mas_equalTo(0.7);
    }];
    Xian.backgroundColor=_LightGrey;

    
    UIView *pingView=[UIView new];
    [beiJingView addSubview:pingView];
    CGFloat height=[self creatZanView2:pingView];

    [pingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xian.mas_bottom).mas_equalTo(10);
        make.left.right.mas_equalTo(Xian);
        make.height.mas_equalTo(height);
    }];
    pingView.backgroundColor=_LightGrey;
    
    
    
     return 75+neiRongLabel.frame.size.height+Y*0.285*_mainW+15+25+11+_zanLabel.frame.size.height+30+height;

    
}

-(CGFloat)creatZanView:(UIView *)view{
    
    

    
    if (_evaluates.count==0) {
        return 0;
    }
    
    CGFloat height=5;
    for (int i=0; i<_evaluates.count; i++) {
        
        NSDictionary *dic=_evaluates[i];
        
        bool type=[[dic objectForKey:@"type"] doubleValue];
        
        NSString *evaluateNickname=[dic objectForKey:@"evaluateNickname"];
        
        NSString *byEvaluateNickname=[dic objectForKey:@"byEvaluateNickname"];
        
        NSString *evaluateContent=[dic objectForKey:@"evaluateContent"];
        
      
        NSString * pingLunStr;
        NSMutableAttributedString *AttributedStr;
        evaluateNickname=[evaluateNickname stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        evaluateContent=[evaluateContent stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if (!type) {
            
           

            pingLunStr=[NSString stringWithFormat:@"%@:%@",evaluateNickname,evaluateContent];
            
            NSString *transString=pingLunStr;
            
            AttributedStr= [[NSMutableAttributedString alloc]initWithString:transString];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(0, evaluateNickname.length+1)];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(evaluateNickname.length+1,evaluateContent.length)];
            
            [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, evaluateContent.length+evaluateNickname.length+1)];

        }
        else{
          
           
            byEvaluateNickname=[byEvaluateNickname stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

            pingLunStr=[NSString stringWithFormat:@"%@回复%@:%@",byEvaluateNickname,evaluateNickname,evaluateContent];
            
            NSString *transString=pingLunStr;
            AttributedStr= [[NSMutableAttributedString alloc]initWithString:transString];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(0, byEvaluateNickname.length)];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(byEvaluateNickname.length+2, evaluateNickname.length+1)];
            
              [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(byEvaluateNickname.length,2)];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(evaluateNickname.length+byEvaluateNickname.length+3,evaluateContent.length)];
            
            [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, evaluateContent.length+evaluateNickname.length+byEvaluateNickname.length+3)];
        }
        
        
        CGSize size= [ZQTools getNSStringSize:pingLunStr andViewWight:_mainW*0.9-6 andFont:12];
        
        UILabel *label=[UILabel new];
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(height);
            make.left.mas_equalTo(3);
            make.right.mas_equalTo(-3);
        }];
        label.numberOfLines=0;
        [label sizeToFit];
        label.attributedText=AttributedStr;
        [label layoutIfNeeded];
        height=size.height+5+height;
        label.userInteractionEnabled=YES;
        label.tag=i;
        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatToPingLun:)];
        [label addGestureRecognizer:tapGesture2];
    }
    
    return height;


}

-(CGFloat)creatZanView2:(UIView *)view{
    
    
    
    
    if (_evaluates.count==0) {
        return 0;
    }
    CGFloat height=5;
    for (int i=0; i<_evaluates.count; i++) {
        
        NSDictionary *dic=_evaluates[i];
        
        bool type=[[dic objectForKey:@"type"] doubleValue];
        
        NSString *evaluateNickname=[dic objectForKey:@"userNickname"];
        
        NSString *byEvaluateNickname=[dic objectForKey:@"byReplyNickname"];
        
        NSString *evaluateContent=[dic objectForKey:@"replyContent"];
        
        
        NSString * pingLunStr;
        NSMutableAttributedString *AttributedStr;
        
        evaluateNickname=[evaluateNickname stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        evaluateContent=[evaluateContent stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        if (!type) {
            
            pingLunStr=[NSString stringWithFormat:@"%@:%@",evaluateNickname,evaluateContent];
            
            NSString *transString = pingLunStr;
            
            AttributedStr= [[NSMutableAttributedString alloc]initWithString:transString];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(0, evaluateNickname.length+1)];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(evaluateNickname.length+1,evaluateContent.length)];
            
            [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, evaluateContent.length+evaluateNickname.length+1)];
            
        }
        else{
            
            
            
            byEvaluateNickname=[byEvaluateNickname stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            pingLunStr=[NSString stringWithFormat:@"%@回复%@:%@",byEvaluateNickname,evaluateNickname,evaluateContent];
            
            NSString *transString=pingLunStr;

            
            AttributedStr= [[NSMutableAttributedString alloc]initWithString:transString];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(0, byEvaluateNickname.length)];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(92, 162, 209) range:NSMakeRange(byEvaluateNickname.length+2, evaluateNickname.length+1)];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(byEvaluateNickname.length,2)];
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(170, 170, 170) range:NSMakeRange(evaluateNickname.length+byEvaluateNickname.length+3,evaluateContent.length)];
            
            [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, evaluateContent.length+evaluateNickname.length+byEvaluateNickname.length+3)];
        }
        
        
        CGSize size= [ZQTools getNSStringSize:pingLunStr andViewWight:_mainW*0.9-6 andFont:12];
        
        UILabel *label=[UILabel new];
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(height);
            make.left.mas_equalTo(3);
            make.right.mas_equalTo(-3);
        }];
        label.numberOfLines=0;
        [label sizeToFit];
        label.attributedText=AttributedStr;
        [label layoutIfNeeded];
        height=size.height+5+height;
        label.userInteractionEnabled=YES;
        label.tag=i;
        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatYouJi:)];
        [label addGestureRecognizer:tapGesture2];
    }
    
    return height;
    
    
}

-(void)creatToPingLun:(UITapGestureRecognizer *)tap{

    NSArray *evaluates=[_dic objectForKey:@"evaluates"];
    
    NSDictionary *dic=evaluates[tap.view.tag];
    
    huiFuView *aview=[huiFuView new];
    [self.window addSubview:aview];
    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    aview.youJiOrPingLun=@"游记";
    aview.index=_index;
    aview.abc=1;
    aview.dic=dic;
    [aview creastView];
}

//游记和评论是反的
-(void)creatPingLun:(UITapGestureRecognizer *)tap{
    
    huiFuView *aview=[huiFuView new];
    [self.window addSubview:aview];
    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    aview.youJiOrPingLun=@"游记";
    aview.index=_index;
    aview.abc=2;
    aview.dic=[_dic objectForKey:@"notes"];
    [aview creastView];
}

-(void)creatYouJi:(UITapGestureRecognizer *)tap{
    huiFuView *aview=[huiFuView new];
    [self.window addSubview:aview];
    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    aview.youJiOrPingLun=@"评论";
    aview.index=_index;
    aview.abc=2;
    aview.dic=_dic;
    [aview creastView];


}

-(void)fangDaImage:(UITapGestureRecognizer *)tap{

    NSMutableArray *urlArrays=[[NSMutableArray alloc] init];
    [urlArrays addObjectsFromArray:_notesImage];

    

    WyzAlbumViewController *wyzAlbumVC = [[WyzAlbumViewController alloc]init];
    
    wyzAlbumVC.currentIndex =tap.view.tag;//这个参数表示当前图片的index，默认是0
    
    //图片数组，可以是url，也可以是UIImage
    //第一种用url
    wyzAlbumVC.imgArr=urlArrays;
    wyzAlbumVC.imageNameArray=nil;//图片名字数组可以为空
    //进入动画
    //    [self.navigationController pushViewController:wyzAlbumVC animated:NO];
    //    [self.navigationController.view.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.0f];
    [self.viewController presentViewController:wyzAlbumVC animated:YES completion:^{
        
        
        
    }];
    
}


-(void)dianZan:(UITapGestureRecognizer *)tap{
    
    if (_isZan) {
        NSNumber *praiseId=[NSNumber numberWithInteger:tap.view.tag];
        NSString *url=[NSString stringWithFormat:@"notes/cancelPraise/%@",praiseId];
        [ZQTools AFNGetDataUrl:url Dict:nil andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            _isZan=NO;
            _dianZan.image=[UIImage imageNamed:@"点赞-(3)"];
            
            NSMutableDictionary *typeDic=[[NSMutableDictionary alloc] initWithDictionary:_dic];
            
            NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
            userModel *usermodel=[userModel mj_objectWithKeyValues:dic2];
            
            NSArray *praises=[_dic objectForKeyedSubscript:@"praises"];
            NSMutableArray *typeArr=[NSMutableArray arrayWithCapacity:0];
            [typeArr addObjectsFromArray:praises];
            for (int i=0; i<praises.count; i++) {
                NSDictionary *dic=praises[i];
                NSNumber *praiseId=[dic objectForKey:@"praiseId"];
                if (praiseId.intValue==usermodel.id.intValue) {
                    [typeArr removeObjectAtIndex:i];
                    break;
                }
            }
            [typeDic setValue:typeArr forKey:@"praises"];
           
            
            
            NSMutableArray *tableArr=[NSMutableArray arrayWithCapacity:0];
            
            NSArray *arr= [NSKeyedUnarchiver unarchiveObjectWithFile:_userYouJiFile];
            
            [tableArr addObjectsFromArray:arr];
            
            NSDictionary *notes2=[_dic objectForKeyedSubscript:@"notes"];
            NSNumber *id2=[notes2 objectForKeyedSubscript:@"id"];
            
            for (int i=0; i<tableArr.count; i++) {
                NSDictionary *dic=tableArr[i];
                NSDictionary *notes=[dic objectForKeyedSubscript:@"notes"];
                NSNumber *id=[notes objectForKeyedSubscript:@"id"];
                
                if (id.integerValue==id2.intValue) {
                    [tableArr replaceObjectAtIndex:i withObject:typeDic];
                }
            }
            [NSKeyedArchiver archiveRootObject:tableArr toFile:_userYouJiFile];
            
            NSNotification * notice = [NSNotification notificationWithName:@"dianZan" object:nil userInfo:responseObject];
            //发送消息
            [[NSNotificationCenter defaultCenter]postNotification:notice];

            
        } anderrorBlock:nil];

    }
    else{
        NSDictionary *notes=[_dic objectForKey:@"notes"];
        
        NSNumber *notesId=[notes objectForKey:@"id"];
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:notesId,@"notesId", nil];
        [ZQTools AFNGetDataUrl:@"notes/notesPraise" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
            
           
            
            _isZan=YES;
            _dianZan.image=[UIImage imageNamed:@"dz2"];
            
            NSDictionary *typeDic2=responseObject;
            
            NSMutableDictionary *typeDic=[[NSMutableDictionary alloc] initWithDictionary:_dic];
   
            NSArray *praises=[_dic objectForKeyedSubscript:@"praises"];
            NSMutableArray *typeArr=[NSMutableArray arrayWithCapacity:0];
            [typeArr addObjectsFromArray:praises];
            [typeArr addObject:typeDic2];
            [typeDic setValue:typeArr forKey:@"praises"];
    
            NSMutableArray *tableArr=[NSMutableArray arrayWithCapacity:0];
            
            NSArray *arr= [NSKeyedUnarchiver unarchiveObjectWithFile:_userYouJiFile];
            
            [tableArr addObjectsFromArray:arr];
            
            NSDictionary *notes2=[_dic objectForKeyedSubscript:@"notes"];
            NSNumber *id2=[notes2 objectForKeyedSubscript:@"id"];
            
            for (int i=0; i<tableArr.count; i++) {
                NSDictionary *dic=tableArr[i];
                NSDictionary *notes=[dic objectForKeyedSubscript:@"notes"];
                NSNumber *id=[notes objectForKeyedSubscript:@"id"];
                
                if (id.integerValue==id2.intValue) {
                    [tableArr replaceObjectAtIndex:i withObject:typeDic];
                }
            }
            [NSKeyedArchiver archiveRootObject:tableArr toFile:_userYouJiFile];
            
            NSNotification * notice = [NSNotification notificationWithName:@"dianZan" object:nil userInfo:responseObject];
            //发送消息
            [[NSNotificationCenter defaultCenter]postNotification:notice];
            
        } anderrorBlock:nil];
    }

}

-(CGFloat)creatView3{

    UILabel *label=[UILabel new];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
    }];
    label.text=@"查看全部";
    label.font=[UIFont systemFontOfSize:13];
    label.textColor=ColorWithRGB(92, 162, 209);

    return 44;
}


@end
