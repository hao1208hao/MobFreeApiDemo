//
//  HHLocation.h
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/20.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>


@interface HHLocation : CLLocationManager
SingletonH(instance);


/**
 *  开始定位
 */
-(void) startLocationMonitor;
/**
 *  关闭定位
 */
-(void)stopLocation;

/**
 *  获取位置信息
 *
 *  @return 位置信息
 */
-(NSString*)getLocation;

/**
 *  获取经度
 *
 *  @return 返回经度
 */
-(NSString*)getLongitude;

/**
 *  获取纬度
 *
 *  @return 返回纬度
 */
-(NSString*)getLatitude;

//获取省、市、区、街道地址
-(NSString*)getProvince;
-(NSString*)getCity;
-(NSString*)getZone;
-(NSString*)getStreet;

//获取省市区
-(NSString*)getPCZ;
//获取详细地址
-(NSString*)getDetailAddr;

@end
