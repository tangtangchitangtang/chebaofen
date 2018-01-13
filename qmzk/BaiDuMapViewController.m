//
//  BaiDuMapViewController.m
//  qmzk
//
//  Created by tangtangchitangtang on 2017/7/17.
//  Copyright © 2017年 www.fuyuan.qmzk. All rights reserved.
//

#import "BaiDuMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

@interface BaiDuMapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
@property(nonatomic,strong)BMKGeoCodeSearch *searcher;
@property(nonatomic,assign)CLLocationCoordinate2D loction;
@property(nonatomic,strong)BMKPointAnnotation* annotation;
@property(nonatomic,strong) BMKMapView* mapView;
@property(nonatomic,strong)BMKLocationService *locService;
@end

@implementation BaiDuMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    _mapView = [BMKMapView new];
    [self.view addSubview:_mapView];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.bottom.right.mas_equalTo(0);
    }];
    _mapView.delegate=self;
    _mapView.zoomLevel=18;
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(creatQueDing)];
}
-(void)creatQueDing{
    _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    //发起反向地理编码检索
    BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeoCodeSearchOption.reverseGeoPoint = _loction;
    BOOL flag = [_searcher reverseGeoCode:reverseGeoCodeSearchOption];

}
//接收反向地理编码结果
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:
(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
      if (error == BMK_SEARCH_NO_ERROR) {
          NSLog(@"%@",result.address);
          
           _annotation.title = result.address;
          NSNumber *longtitude=[NSNumber numberWithDouble:_loction.longitude];
          NSNumber *latitude=[NSNumber numberWithDouble:_loction.latitude];
          NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithCapacity:0];
          [dic setObject:result.address forKey:@"address"];
          [dic setObject:longtitude forKey:@"longtitude"];
          [dic setObject:latitude forKey:@"latitude"];
          
          NSNotification * notice = [NSNotification notificationWithName:@"dingWei" object:nil userInfo:dic];
          
          //发送消息
          [[NSNotificationCenter defaultCenter]postNotification:notice];
          [self.navigationController popViewControllerAnimated:YES];
      }
      else {
          NSLog(@"抱歉，未找到结果");
      }
}

- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    CGPoint point=CGPointMake(_mainW/2, _mainH/2);
    _loction= [mapView convertPoint:point toCoordinateFromView:self.view];
    
    _annotation.coordinate = _loction;
    [_mapView addAnnotation:_annotation];

}
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_locService stopUserLocationService];
    
    _annotation = [[BMKPointAnnotation alloc]init];
    _annotation.coordinate = userLocation.location.coordinate;
    [_mapView addAnnotation:_annotation];
    _mapView.centerCoordinate =userLocation.location.coordinate;
    _loction=userLocation.location.coordinate;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
