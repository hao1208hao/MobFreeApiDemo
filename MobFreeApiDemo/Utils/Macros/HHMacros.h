//
//  HHMacros.h
//  MobFreeApiDemo
//
//  Created by haohao on 16/10/11.
//  Copyright © 2016年 qiandai. All rights reserved.
//

#ifndef HHMacros_h
#define HHMacros_h

#pragma mark - 辅助方法
#pragma mark
#define jsonToDict(jsonStr) [HHInfo jsonToDict:jsonStr]
#define dictToJson(dict) [HHInfo dictToJson:dict]
#define jsonToArray(jsonStr) [HHInfo jsonToArray:jsonStr]
//如果值为nil 传空
#define NotNil(value) value?:@""
//忽略大小写比较字符串
#define ignoreCompare(str,str2) [str compare:str2                         options:NSCaseInsensitiveSearch ] == NSOrderedSame

#pragma mark - 尺寸相关
#pragma mark
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6 ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6P ([UIScreen mainScreen].bounds.size.height == 736)
// 屏幕相关尺寸
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// iPhone6屏幕宽度
#define SCREEN_WIDTH6 375.0f
// 适配比率
#define RATIO ([UIScreen mainScreen].bounds.size.width) / SCREEN_WIDTH6

// 导航栏高度
#define NAV_HEIGHT 44.0f
#define STATES_HEIGHT 20.0f
#define TAB_HEIGHT 49.0f
#define NavAndStatus_HEIGHT 64.0f


#pragma mark - 颜色相关
#pragma mark

#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

#define UIColorFromHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0f]

#define UIColorFromHexA(rgbValue, a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:a * 1.0f]

// 全局的文本高亮状态时的颜色
#define GlobalTextHighColor UIColorFromHexA(0xffffff, 0.5)

// 全局导航栏颜色
#define GlobalNavColor UIColorFromHex(0x7855bf)

// 全局背景颜色
#define GlobalBackgroundColor UIColorFromHex(0xf7f7f7)

#define HHImage(imageName) [UIImage imageNamed:imageName]

#pragma mark - 系统版本
#pragma mark

// 判断版本是否是7.0及以上
#define iOS7  ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
// 判断版本是否是8.0及以上
#define iOS8  ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

// 自定义Log
#ifdef DEBUG
#define HHLog(...) NSLog(__VA_ARGS__)
#else
#define HHLog(...)
#endif

#pragma mark - 版本信息及硬件
#pragma mark
//获取版本及硬件信息
#define sysVersion [HHInfo getSystemVersion]  //获取系统版本
#define jtlw_appVersion [HHInfo formatAppVersion]  //appVersion
#define deviceID [HHInfo getDeviceID]    //获取手机唯一标识 UUID
#define HHDeviceModel [HHInfo getDeviceModel]   // 获取手机类型  iPhone5s
#define terminalInfo [HHInfo getTerminalInfo]  //获取终端信息
#define HHNetUseFul [HHInfo isNetworkUseful]  //网络是否可用
#define HHNetType [HHInfo getNetType]  //获取当前网络连接类型 wifi/4G/3G
#define HHGetLocation [[HHLocation sharedinstance] getLocation] //获取定位json串
#define HHGetLongitude [[HHLocation sharedinstance] getLongitude]  //获取经度
#define HHGetLatitude [[HHLocation sharedinstance] getLatitude]  //获取纬度

#define HHGetProvince [[HHLocation sharedinstance] getProvince]  //获取省
#define HHGetCity [[HHLocation sharedinstance] getCity]  //获取市
#define HHGetZone [[HHLocation sharedinstance] getZone]  //获取区
#define HHGetStreet [[HHLocation sharedinstance] getStreet]  //获取街道
#define HHGetPCZ [[HHLocation sharedinstance] getPCZ]  //获取省市区

#define HHMD5(str) [HHInfo md5:str]  //md5
#define HHGetIpAddr [HHInfo getIPAddress]  //获取连接网络的IP
#define HHGetMacAddr [HHInfo getMacAddress]  //获取mac地址
#define HHGetImgByColor(color) [HHInfo buttonImageFromColor:color]  //获取图片



#define userDefaults [NSUserDefaults standardUserDefaults]
#define userDefaultsForKey(Key) [[NSUserDefaults standardUserDefaults] objectForKey:Key]

// UIApplication对象
#define HHApplication [UIApplication sharedApplication]
#define HHAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define HHWindow [[[UIApplication sharedApplication] delegate] window]


#pragma mark - 提示相关
#pragma mark

#define HHAlertView [HHAlert shareAlertTool]

#define HHAlertWithTitle(_title_, _msg_)  UIAlertController * alertController = [UIAlertController alertControllerWithTitle:_title_ message: _msg_ preferredStyle:UIAlertControllerStyleAlert];\
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];\
    [alertController addAction:otherAction];\
    [self presentViewController:alertController animated:YES completion:nil]


// 提示框alert(带“提示”标题)
#define CommonAlert(_msg_) HHAlertWithTitle(@"提示", _msg_)


#endif /* JTLWMacros_h */
