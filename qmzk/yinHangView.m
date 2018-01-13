
//
//  yinHangView.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/6/28.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "yinHangView.h"
#import "yinHangCell.h"
#import "tiXianViewController.h"
#import "jieBangViewController.h"
@implementation yinHangView
-(void)creatView{
    _tableView=[BaseTableView new];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _tableView.delegate=self;
    _tableView.dataSource=self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _tableArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    yinHangCell *cell=[[yinHangCell alloc] init];
    cell.dic=_tableArr[indexPath.row];
    [cell creatView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return   UITableViewCellEditingStyleDelete;
}
//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    WS(weakself);
    [tableView setEditing:NO animated:YES];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self creatAltel:indexPath];
    }
}
//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"解绑";
}
//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (_abc==1) {
        NSDictionary *typeDic=_tableArr[indexPath.row];
        
        tiXianViewController *yinHang=[[tiXianViewController alloc] init];
        yinHang.dic=typeDic;
        [ZQTools pushNextViewController:self.viewController andRootController:yinHang];
    }else{
        NSDictionary *typeDic=_tableArr[indexPath.row];
        
        jieBangViewController *yinHang=[[jieBangViewController alloc] init];
        yinHang.dic=typeDic;
        [ZQTools pushNextViewController:self.viewController andRootController:yinHang];
    
    }
    
}

-(void)creatAltel:(NSIndexPath *)indexPath{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"是否要解除银行卡的绑定" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction: [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self jieBang:indexPath];
    }]];
    [self.viewController presentViewController:alertController animated:YES completion:nil];
}

-(void)jieBang:(NSIndexPath *)indexPath{
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSDictionary *userBasic=[dic2 objectForKey:@"userBasic"];
    NSNumber *idUserBasic=[userBasic objectForKey:@"idUserBasic"];
    
    NSDictionary *typedic=_tableArr[indexPath.row];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:idUserBasic,@"userId",[typedic objectForKey:@"cardNumber"],@"cardNumber", nil];
    [ZQTools AFNGetDataUrl:@"userBasic/deleteBindingBank" Dict:dic andTableView:_tableView andView:self andSuccessBlock:^(id responseObject) {
        [self.tableArr removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    } anderrorBlock:nil];


}
#pragma mark - 补全分隔线左侧缺失
- (void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

@end
