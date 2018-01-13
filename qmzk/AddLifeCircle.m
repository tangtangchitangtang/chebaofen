
//
//  AddLifeCircle.m
//  qmzk
//
//  Created by Mac on 2017/6/26.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "AddLifeCircle.h"
#import "MQImageDragView.h" //选取照片布局

int maxImg = 9; //最大照片选取数量

@interface AddLifeCircle ()<MQImageDragViewDelegate>

@property (nonatomic,strong)UITextField *titleText;             //标题

@property (nonatomic,strong)BRPlaceholderTextView *contentText; //内容

@property (nonatomic,strong)MQImageDragView *dragView;          //选取照片布局

@property (nonatomic,strong)NSMutableArray *imgArr;             //图片数组



@end

@implementation AddLifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden=NO;
    
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.tableView.editing=NO;
    
    self.title=@"发布";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(submitBtnClick)];
    
    self.imgArr = [NSMutableArray array];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return 3;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseTableViewCell *cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BaseTableViewCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(indexPath.row==0)
    {
        
        
        [cell addSubview:self.titleText];
        
    }
    else if (indexPath.row==1)
    {
        
        [cell addSubview:self.contentText];
    }
    else if (indexPath.row==2)
    {
        
        [cell addSubview:self.dragView];
    }
    
    return cell;
    
}



- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if(indexPath.row==0)
    {
        
        
        return 40;
        
    }
    else if (indexPath.row==1)
    {
        
        return 150;
    }
    else if (indexPath.row==2)
    {
        
        CGRect rect = _dragView.frame;
        
        rect.size.height = [_dragView getHeightThatFit];
        
        _dragView.frame = rect;
        
        return [self.dragView getHeightThatFit];
    }
    return 0;
    
}


#pragma mark——————————————懒加载
- (UITextField *)titleText
{
    if(_titleText==nil)
    {
        _titleText = [[UITextField alloc]init];
        
        _titleText.frame = CGRectMake(10, 0, _mainW-20, 40);
        
        _titleText.placeholder  = @"标题(必填)";
    }
    
    return _titleText;
    
}
- (BRPlaceholderTextView *)contentText
{
    if(_contentText==nil)
    {
        _contentText = [[BRPlaceholderTextView alloc]init];
        
        _contentText.frame = CGRectMake(10, 0, _mainW-20, 150);
        
        _contentText.placeholder  = @"输入随笔正文";
    }
    
    return _contentText;
}



- (MQImageDragView *)dragView
{
    
    if(_dragView==nil)
    {
        
        
        //初始化时请设定宽度，高度不需设定（内部计算）
        _dragView = [[MQImageDragView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _mainW/3)];
        
        //上下左右的间距
        _dragView.kMarginLRTB = 5;
        //图片之间的间距
        _dragView.kMarginB = 5;
        //最大图片数量
        _dragView.kMaxCount = maxImg;
        //每行的图片数量
        _dragView.kCountInRow = 3;
        
        _dragView.dragViewDelegete = self;
        
    }
    
    return _dragView;
    
}



#pragma mark————————————————MQImageDragView.代理方法

//点击了添加按钮
- (void)imageDragViewAddButtonClicked{
    
    
    NSLog(@"哈哈");
    
    [ZQTools showAlert:@"选取照片" with_Controller:self with_titleArr:@[@"相册",@"拍照"] withShowType:UIAlertControllerStyleActionSheet with_Block:^(int index) {
        
        
        
        if(index==0)
        {
            
            
            [self.tools openAlbumWithMaxImgNumber:maxImg-_imgArr.count WithCuVc:self withOverBlock:^(id responseObject) {
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSArray *imgArr = responseObject;
                    
                    for (UIImage *img in imgArr) {
                        
                        [self addIMG:img];
                        
                    }
                    
                });
                
                
                
                
            }];
            
        }
        else if (index==1)
        {
            
            [self.tools openCameraWithCuVc:self withOverBlock:^(id responseObject) {
                
                [self addIMG:responseObject];
                
            }];
            
        }
        
        
    }];
    
    
    
}

- (void)addIMG:(UIImage *)img{
    
    
    [self.imgArr addObject:img];
    
    [_dragView addImage:img];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
}

//点击了删除按钮
- (void)imageDragViewDeleteButtonClickedAtIndex:(NSInteger)index{
    
    NSArray *arr = [_dragView getAllImages];
    
    _imgArr = [NSMutableArray arrayWithArray:arr];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
}
//点击了某张图片
- (void)imageDragViewButtonClickedAtIndex:(NSInteger)index{
    
    
    
    [ZQTools instanceHJPhotoBrowser_withimgUrlArr:nil with_placeholderImageArr:_imgArr with_currentImageIndex:index with_sourceImagesContainerView:_dragView];
    
}
//移动了图片
- (void)imageDragViewDidMoveButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    
    NSArray *arr = [_dragView getAllImages];
    
    _imgArr = [NSMutableArray arrayWithArray:arr];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
}



#pragma mark————————————提交
- (void)submitBtnClick
{

    NSString *title = _titleText.text;
    
    NSString *shareDesc = _contentText.text;
    
    if([ZQTools charNumber_withStr:title]<=0)
    {
        [ZQTools svpInfo:@"请输入标题"];
    }
    else if ([ZQTools charNumber_withStr:shareDesc]<=0)
    {
    
        [ZQTools svpInfo:@"请输入内容"];
    }
    else if (self.imgArr.count<=0){
    
        [ZQTools svpInfo:@"请添加图片"];
    
    }
    else
    {
    
    
        if(self.type==afx)
        {
 
            NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
            NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
            NSNumber *shareUserId=[userBasic objectForKey:@"idUserBasic"];

            
//            NSString *shareUserId = _userModel.basicUserId;
        

        
            [ZQTools afnPostImageWithDict:nil WithAddressUrl:nil withImageArr:_imgArr withFileName:@"a" WithView:self.view success:^(id responseObject) {
                
                NSLog(@"%@",responseObject);
                
                //图片集合
                NSString *fileIds = [responseObject objectForKey:@"resultId"];
   
                //再提交发布
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:title,@"title",shareDesc,@"shareDesc",shareUserId,@"shareUserId",fileIds,@"fileIds", nil];
                
                //loveshare/publishLoveShare
                
                [ZQTools AFNGetDataUrl:@"loveshare/publishLoveShare" Dict:dict andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
                    
                    
                    [ZQTools svpInfo:@"发布成功"];
                    
                    //发送通知
//                    [[NSNotificationCenter defaultCenter] postNotificationName:_shqAddData object:nil];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [self popVc];
                    });
                    
                } anderrorBlock:nil];
 
            }];
 
        }
        else if (self.type == xytd)
        {
            
            NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
            NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
            NSNumber *userId=[userBasic objectForKey:@"idUserBasic"];
        
//            NSString *userId = _userModel.basicUserId;
            
            
            
            [ZQTools afnPostImageWithDict:nil WithAddressUrl:nil withImageArr:_imgArr withFileName:@"a" WithView:self.view success:^(id responseObject) {
                
                NSLog(@"%@",responseObject);
                
                //图片集合
                NSString *fileIds = [responseObject objectForKey:@"resultId"];
                
                //再提交发布
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:title,@"title",shareDesc,@"content",userId,@"userId",fileIds,@"fileIds", nil];
                
                //loveshare/publishLoveShare
                
                [ZQTools AFNGetDataUrl:@"campusworld/publishCampusWorldt" Dict:dict andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
                    
                    
                    [ZQTools svpInfo:@"发布成功"];
                    
                    //发送通知
//                    [[NSNotificationCenter defaultCenter] postNotificationName:_shqAddData object:nil];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [self popVc];
                    });
                    
                } anderrorBlock:nil];
                
            }];
        
        
        }
 
        
        else if (self.type == zwyw)
        {
            
            
            NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
            NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
            NSNumber *userId=[userBasic objectForKey:@"idUserBasic"];

//            NSString *userId = _userModel.basicUserId;
            
            
            
            [ZQTools afnPostImageWithDict:nil WithAddressUrl:nil withImageArr:_imgArr withFileName:@"a" WithView:self.view success:^(id responseObject) {
                
                NSLog(@"%@",responseObject);
                
                //图片集合
                NSString *fileIds = [responseObject objectForKey:@"resultId"];
                
                //再提交发布
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:title,@"title",shareDesc,@"content",userId,@"userId",fileIds,@"fileIds", nil];
                
                //loveshare/publishLoveShare
                
                [ZQTools AFNGetDataUrl:@"government/publishGovernment" Dict:dict andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
                    
                    
                    [ZQTools svpInfo:@"发布成功"];
                    
                    //发送通知
//                    [[NSNotificationCenter defaultCenter] postNotificationName:_shqAddData object:nil];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [self popVc];
                    });
                    
                } anderrorBlock:nil];
                
            }];
            
            
        }
        
        
        
    }

}


@end
