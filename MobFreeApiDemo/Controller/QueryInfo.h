//
//  QueryInfo.h
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/20.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    queryTypePhoneBelong = 0,
    queryTypeIdCardNo,
    queryTypeBankCardNo,
    queryTypeBodyHealth
}queryType;

@interface QueryInfo : UIViewController

//显示查询的标题
@property(nonatomic,copy) NSString* showTitle;
//查询类型
@property(nonatomic,assign) queryType queryType;
@end
