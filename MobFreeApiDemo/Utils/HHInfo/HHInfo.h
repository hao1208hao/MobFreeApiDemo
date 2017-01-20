//
//  HHInfo.h
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/20.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHInfo : NSObject

/** 获取系统版本 */
+(NSString*)getSystemVersion;
/** 应用版本 */
//+(NSString*)getAppVersion;
/**appVersion*/
+(NSString *)formatAppVersion;

/** md5加密 */
+(NSString*)md5:(NSString *)input;
/** 手机设备号 */
+(NSString*)getDeviceID;
/** 获得设备型号 */
+ (NSString *)getDeviceModel;
/** 终端信息 */
+(NSString*)getTerminalInfo;
/** 获取网络类型 */
+(BOOL)isNetworkUseful;
+(NSString*)getNetType;
/** json 转字典 */
+(NSDictionary*)jsonToDict:(NSString*)json;
/** 字典转json */
+(NSString*)dictToJson:(NSDictionary*)dict;
/**字典转JSON数组*/
+(NSArray<NSDictionary*>*)jsonToArray:(NSString *)jsonArrayStr;
+(NSString *)getField5f34WithICData:(NSString *)ICData;

+(NSString *)parseCardNum:(NSString *)trackInfo;

/**
 *  获取地址
 *
 *  @return wifi 地址 和 mac 地址
 */
+(NSString *)getIPAddress;
+(NSString *)getMacAddress;

/** 根据颜色生成图片 */
+(UIImage *)buttonImageFromColor:(UIColor *)color;

/** 获取当前语言状态设置 */
+ (NSString*)getPreferredLanguage;

/** 是否是繁体语言设置（如果不是,全部当做简体） */
+(BOOL)isHantLanguage;

@end
