//
//  MobSDKTool.m
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/19.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "MobSDKTool.h"
#import <MobAPI/MobAPI.h>
#import <MOBFoundation/MOBFoundation.h>


@implementation MobSDKTool

//查询手机号码归属地
+(void)getPhoneBelongWithPhoneNo:(NSString*)phoneNo andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock{
    [self sendRequest:[MOBAPhoneRequest addressRequestByPhone:phoneNo] andSuccBlock:succBlock andFailBlock:failBlock];
}

//查询身份证信息
+(void)getIdCardInfoWithIdCardNo:(NSString*)idCardNo andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock{
    
    [self sendRequest:[MOBAIdRequest idcardRequestByCardno:idCardNo] andSuccBlock:succBlock andFailBlock:failBlock];
}

//查询银行卡信息
+(void)getBankCardInfoWithBankCardNo:(NSString*)bankCardNo andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock{    
    [self sendRequest:[MOBABankCardRequest bankCardRequestWithCard:bankCardNo] andSuccBlock:succBlock andFailBlock:failBlock];
}

//查询身体健康
+(void)getBodyHealthWithBodyName:(NSString*)bodyName andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock{
    [self sendRequest:[MOBAHealthRequest healthRequestWithKeyword:bodyName page:nil size:nil] andSuccBlock:succBlock andFailBlock:failBlock];
}

#pragma mark -- 网络请求方法
#pragma mark
//加载框
+ (void)waitLoading:(BOOL)flag
{
    static UIView *loadingView = nil;
    if (!loadingView)
    {
        loadingView = [[UIView alloc] initWithFrame:[[[UIApplication sharedApplication]delegate]window].bounds];
        loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView sizeToFit];
        indicatorView.frame = CGRectMake((loadingView.frame.size.width - indicatorView.frame.size.width) / 2, (loadingView.frame.size.height - indicatorView.frame.size.height) / 2, indicatorView.frame.size.width, indicatorView.frame.size.height);
        indicatorView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
        [indicatorView startAnimating];
        [loadingView addSubview:indicatorView];
        
        [[[[UIApplication sharedApplication]delegate]window] addSubview:loadingView];
    }
    
    loadingView.hidden = !flag;
}

//网络请求
+ (void)sendRequest:(MOBARequest *)request andSuccBlock:(succBlock)succBlock andFailBlock:(failBlock)failBlock{
    [self waitLoading:YES];
    [MobAPI sendRequest:request onResult:^(MOBAResponse *response)
     {
         [self waitLoading:NO];  //隐藏加载框
         NSDictionary* resultDict = [self resultWithResponse:response];
         NSString* retCode = resultDict[@"retCode"];  //成功 200
         //NSString* msg = resultDict[@"msg"];  //success
         if ([retCode isEqualToString:@"200"]) {
             //提示
             succBlock(resultDict[@"result"]);             
         }else{
             failBlock(resultDict);
         }
     }];
}

/**
 *  Api 返回信息处理
 *
 *  @param response
 */
+ (NSDictionary*)resultWithResponse:(MOBAResponse *)response
{
    NSDictionary *resDict = nil;
    if (response.error){
        NSString* errStr = response.error;
        resDict = @{@"error":errStr};
    }else{
        NSString* succStr = [MOBFJson jsonStringFromObject:response.responder];
        //响应数据,打印方便查看日志
        NSLog(@"响应结果是:\n%@",succStr);
        resDict = [self jsonToDict:succStr];
    }
    return resDict;
}

+(NSDictionary*)jsonToDict:(NSString*)json{
    if (json == nil) {
        return nil;
    }
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/**
 *  字典转json
 *
 *  @param dict 字典
 *
 *  @return 返回转换成的json 数据格式
 */
+(NSString*)dictToJson:(NSDictionary*)dict{
    if (dict == nil) {
        return @"";
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+(NSArray<NSDictionary*>*)jsonToArray:(NSString *)jsonArrayStr{
    if (!jsonArrayStr.length) return nil;
    NSData * data = [jsonArrayStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError * err;
    NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
    if (err) {        
        return nil;
    } else {
        return array;
    }
}

@end
