//
//  pingLunCell.m
//  
//
//  Created by tangtangchitangtang on 2017/6/27.
//
//

#import "pingLunCell.h"
#import "huiFuView.h"
//#import "WyzAlbumViewController.h"
@implementation pingLunCell

-(CGFloat)cretView{
    
    self.backgroundColor=_LightGrey;
    
    UIView *beiJingView=[UIView new];
    [self addSubview:beiJingView];
    [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    beiJingView.backgroundColor=[UIColor whiteColor];
    
    UIImageView *touXiangImageView=[UIImageView new];
    [beiJingView addSubview:touXiangImageView];
    [touXiangImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.width.mas_equalTo(50);
        make.top.mas_equalTo(10);
    }];
    touXiangImageView.layer.cornerRadius=25;
    touXiangImageView.layer.masksToBounds=YES;
    NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,[_typeDic objectForKey:@"reviewsUserPicPath"]]];
    [touXiangImageView sd_setImageWithURL:rul];
    
    UILabel *nameLabel=[UILabel new];
    [beiJingView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiangImageView);
        make.left.mas_equalTo(touXiangImageView.mas_right).mas_equalTo(10);
    }];
    NSString *reviewsUserName=[_typeDic objectForKey:@"reviewsUserName"];
    if ([ZQTools charIsNil:reviewsUserName]) {
        reviewsUserName=@"";
    }
    nameLabel.text=reviewsUserName;
    nameLabel.textColor=ColorWithRGB(50, 50, 50);
    nameLabel.font=[UIFont systemFontOfSize:16];
    
    UIView *xingXingView=[UIView new];
    [beiJingView addSubview:xingXingView];
    [xingXingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(touXiangImageView);
        make.left.mas_equalTo(nameLabel);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(250);
    }];
    NSNumber *reviewsScore=[_typeDic objectForKey:@"reviewsScore"];
    
    for (int i=0; i<reviewsScore.intValue; i++) {
        UIImageView *imageView=[UIImageView new];
        [xingXingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(i*25);
            make.width.height.mas_equalTo(20);
        }];
        imageView.image=[UIImage imageNamed:@"全星"];
    }
    for (int i=reviewsScore.intValue; i<5; i++) {
        UIImageView *imageView=[UIImageView new];
        [xingXingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(i*25);
            make.width.height.mas_equalTo(20);
        }];
        imageView.image=[UIImage imageNamed:@"无星"];
    }

    UILabel *neiRongLabel=[UILabel new];
    [beiJingView addSubview:neiRongLabel];
    [neiRongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(touXiangImageView.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(nameLabel);
        make.right.mas_equalTo(-10);
    }];
    NSString *reviewsContent=[_typeDic objectForKey:@"reviewsContent"];
    if ([ZQTools charIsNil:reviewsContent]) {
        reviewsContent=@"";
    }
    [neiRongLabel sizeToFit];
    neiRongLabel.numberOfLines=13;
    neiRongLabel.text=reviewsContent;
    neiRongLabel.textColor=_ziTiColor;
    neiRongLabel.font=[UIFont systemFontOfSize:15];
    [neiRongLabel layoutIfNeeded];
    
    
    NSArray *imageArr=[_typeDic objectForKey:@"imgs"];

    NSArray *reviewsAnswers=[_typeDic objectForKey:@"reviewsAnswers"];
    
    if(imageArr!=nil&&![imageArr isKindOfClass:[NSNull class]])
    {
        if (imageArr.count!=0) {
            for (int i=0; i<imageArr.count; i++) {
                UIImageView *imagView=[UIImageView new];
                [beiJingView addSubview:imagView];
                [imagView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(10);
                    make.left.mas_equalTo(i*90+10);
                    make.width.height.mas_equalTo(70);
                }];
                NSDictionary *tyoeDic=imageArr[i];
                NSURL *rul=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_addressUrl,[tyoeDic objectForKey:@"uploadfilepath"]]];
                [imagView sd_setImageWithURL:rul];
                
                imagView.userInteractionEnabled=YES;
                imagView.tag=i;
                UITapGestureRecognizer *tapGestur10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fangDaImage:)];
                [imagView addGestureRecognizer:tapGestur10];
                
            }
    }
    
        UILabel *Xian=[UILabel new];
        [beiJingView addSubview:Xian];
        [Xian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(85);
            make.left.mas_equalTo(touXiangImageView);
            make.right.mas_equalTo(neiRongLabel);
            make.height.mas_equalTo(1);
            
        }];
        Xian.backgroundColor=_LightGrey;

        
        float height = 0.0;
        
        if (reviewsAnswers.count!=0) {
            for (int i=0; i<reviewsAnswers.count; i++) {
                NSDictionary *typedic=reviewsAnswers[i];
                NSNumber *answerUserId=[typedic objectForKey:@"answerUserId"];
                NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
                NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
                NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
                NSString *shangJia=@"商家回复:";
                if (idUserBasic.integerValue!=answerUserId.integerValue) {
                    shangJia=@"用户回复:";
                }
                NSString *answerContent=[typedic objectForKey:@"answerContent"];
                
                NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",shangJia,answerContent]];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:_backgroundColor range:NSMakeRange(0, shangJia.length)];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(100, 100, 100) range:NSMakeRange(shangJia.length, answerContent.length)];
                [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, shangJia.length+answerContent.length)];
                
                UILabel *pilunLable=[UILabel new];
                [beiJingView addSubview:pilunLable];
                [pilunLable mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(Xian.mas_bottom).mas_equalTo(5+height);
                    make.left.mas_equalTo(nameLabel);
                    make.right.mas_equalTo(-10);
                }];
                pilunLable.text=[NSString stringWithFormat:@"%@%@",shangJia,answerContent];
                [pilunLable sizeToFit];
                pilunLable.numberOfLines=13;
                pilunLable.textColor=_ziTiColor;
                pilunLable.font=[UIFont systemFontOfSize:15];
                [pilunLable layoutIfNeeded];
                height=pilunLable.frame.size.height+10+height;
            }
        }
        
        UIButton *huiFuBtn=[UIButton new];
        [beiJingView addSubview:huiFuBtn];
        [huiFuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Xian.mas_bottom).mas_equalTo(5+height);
            make.left.mas_equalTo(neiRongLabel);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
        [huiFuBtn setTitle:@"回复" forState:0];
        [huiFuBtn setTitleColor:_backgroundColor forState:0];
        huiFuBtn.layer.cornerRadius=2;
        huiFuBtn.layer.borderWidth=1;
        huiFuBtn.layer.borderColor=_backgroundColor.CGColor;
        huiFuBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [huiFuBtn addTarget:self action:@selector(creatHuiFu:) forControlEvents:UIControlEventTouchUpInside];
       
        return neiRongLabel.frame.size.height+85+140+height;
    }
    
    UILabel *Xian=[UILabel new];
    [beiJingView addSubview:Xian];
    [Xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(5);
        make.left.mas_equalTo(touXiangImageView);
        make.right.mas_equalTo(neiRongLabel);
        make.height.mas_equalTo(1);
        
    }];
    Xian.backgroundColor=_LightGrey;
    
    float height = 0.0;
    if (reviewsAnswers.count!=0) {
        for (int i=0; i<reviewsAnswers.count; i++) {
            NSDictionary *typedic=reviewsAnswers[i];
            NSNumber *answerUserId=[typedic objectForKey:@"answerUserId"];
            NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
            NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
            NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
            NSString *shangJia=@"商家回复:";
            if (idUserBasic.integerValue!=answerUserId.integerValue) {
                shangJia=@"用户回复:";
            }
            NSString *answerContent=[typedic objectForKey:@"answerContent"];
            
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",shangJia,answerContent]];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:_backgroundColor range:NSMakeRange(0, shangJia.length)];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(100, 100, 100) range:NSMakeRange(shangJia.length, answerContent.length)];
            [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, shangJia.length+answerContent.length)];
            
            
            UILabel *pilunLable=[UILabel new];
            [beiJingView addSubview:pilunLable];
            [pilunLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(10+height);
                make.left.mas_equalTo(nameLabel);
                make.right.mas_equalTo(-10);
            }];
            pilunLable.text=[NSString stringWithFormat:@"%@%@",shangJia,answerContent];
            [pilunLable sizeToFit];
            pilunLable.numberOfLines=13;
            pilunLable.textColor=_ziTiColor;
            pilunLable.font=[UIFont systemFontOfSize:15];
            [pilunLable layoutIfNeeded];
          
            height=pilunLable.frame.size.height+10+height;
        }
    }

    
    UIButton *huiFuBtn=[UIButton new];
    [beiJingView addSubview:huiFuBtn];
    [huiFuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(neiRongLabel.mas_bottom).mas_equalTo(10+height);
        make.left.mas_equalTo(neiRongLabel);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    [huiFuBtn setTitle:@"回复" forState:0];
    [huiFuBtn setTitleColor:_backgroundColor forState:0];
    huiFuBtn.layer.cornerRadius=2;
    huiFuBtn.layer.borderWidth=1;
    huiFuBtn.layer.borderColor=_backgroundColor.CGColor;
    [huiFuBtn addTarget:self action:@selector(creatHuiFu:) forControlEvents:UIControlEventTouchUpInside];
    

    return neiRongLabel.frame.size.height+85+50+height;

}
-(IBAction)creatHuiFu:(id)sender{
    huiFuView *aview=[huiFuView new];
    [self.window addSubview:aview];
    [aview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    aview.dic=_typeDic;
    [aview creastView];




}

-(void)fangDaImage:(UITapGestureRecognizer *)tap{
    
    NSArray *imageArr=[_typeDic objectForKey:@"imgs"];
     NSMutableArray *urlArrays=[[NSMutableArray alloc] init];
    for (int i=0; i<imageArr.count; i++) {
        NSDictionary *tyoeDic=imageArr[i];
        NSString *rul=[NSString stringWithFormat:@"%@%@",_addressUrl,[tyoeDic objectForKey:@"uploadfilepath"]];
        [urlArrays addObject:rul];
    }
        
//    WyzAlbumViewController *wyzAlbumVC = [[WyzAlbumViewController alloc]init];
//    
//    wyzAlbumVC.currentIndex =tap.view.tag;//这个参数表示当前图片的index，默认是0
//    
//    //图片数组，可以是url，也可以是UIImage
//    //第一种用url
//    wyzAlbumVC.imgArr = urlArrays;
//    wyzAlbumVC.imageNameArray=nil;//图片名字数组可以为空
//    //进入动画
//    //    [self.navigationController pushViewController:wyzAlbumVC animated:NO];
//    //    [self.navigationController.view.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.0f];
//    [self.viewController presentViewController:wyzAlbumVC animated:YES completion:^{
//        
//        
//        
//    }];
    
}

@end
