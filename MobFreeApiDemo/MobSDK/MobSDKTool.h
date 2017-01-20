//
//  MobSDKTool.h
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/19.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^succBlock)(NSDictionary* succResponseDict);  //成功信息
typedef void(^failBlock)(NSDictionary* failResponseDict);  //失败信息

@interface MobSDKTool : NSObject

/**
 查询手机号码归属地

 @param phoneNo   要查询的手机号
 @param succBlock 查询成功信息
 @param failBlock 查询失败信息
 */
+(void)getPhoneBelongWithPhoneNo:(NSString*)phoneNo andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock;


/**
 查询身份证信息

 @param idCardNo  要查询的银行卡号
 @param succBlock 查询成功信息
 @param failBlock 查询失败信息
 */
+(void)getIdCardInfoWithIdCardNo:(NSString*)idCardNo andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock;

/**
 查询银行卡信息

 @param bankCardNo 要查询的银行卡号
 @param succBlock  查询成功信息
 @param failBlock  查询失败信息
 */
+(void)getBankCardInfoWithBankCardNo:(NSString*)bankCardNo andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock;


/**
 查询身体健康

 @param bodyName  身体部位
 @param succBlock 查询成功信息
 @param failBlock 查询失败信息
 */
+(void)getBodyHealthWithBodyName:(NSString*)bodyName andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock;

@end
