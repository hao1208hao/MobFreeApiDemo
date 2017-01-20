//
//  QueryInfo.m
//  MobFreeApiDemo
//
//  Created by haohao on 17/1/20.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "QueryInfo.h"

@interface QueryInfo ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *queryTextField;
@property (weak, nonatomic) IBOutlet UIView *showInfoView;

@end

@implementation QueryInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.showTitle;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self autoShowInfo];   //设置UI
    
}

//设置UI
-(void)autoShowInfo{
    NSString* tip =@"";
    if (self.queryType == queryTypePhoneBelong) {
        //手机号归属地
        tip =@"请输入需要查询归属地的手机号";
    }else if(self.queryType == queryTypeIdCardNo){
        //身份证号
        tip =@"请输入需要查询的身份证号";
        //身份证中有包含X 的
        self.queryTextField.keyboardType = UIKeyboardTypeDefault;
    }else if(self.queryType == queryTypeBankCardNo){
        //银行卡号
        tip =@"请输入需要查询的银行卡号";
    }else if(self.queryType == queryTypeBodyHealth){
        //身体健康查询
        tip =@"请输入需要查询的身体部位(头、手、脚等等)";
        self.queryTextField.keyboardType = UIKeyboardTypeDefault;
    }
    
    self.queryTextField.placeholder = tip;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

//查询点击
- (IBAction)queryAction:(id)sender {
    
    NSString* str = self.queryTextField.text;
    
    if(str.length<=0){
        [HHWindow makeToast:@"查询信息不能为空"];
        return;
    }
    
    if (self.queryType == queryTypePhoneBelong) {
        //查询手机号归属地
        if (str.length<=6) {
            [HHWindow makeToast:@"手机号码太短"];
            return;
        }
        
        [MobSDKTool getPhoneBelongWithPhoneNo:str andSuccBlock:^(NSDictionary *succResponseDict) {
            CommonAlert(dictToJson(succResponseDict));
            //self.showInfoView.hidden = NO;
        } andFailBlock:^(NSDictionary *failResponseDict) {
            NSString* errorStr = [failResponseDict[@"error"] localizedDescription];
            NSString* error = [NSString stringWithFormat:@"%@",failResponseDict[@"error"]];
            //HHLog(@"错误信息是%@=======\n%@",error,errorStr);
            CommonAlert(error);
        }];
        
    }else if(self.queryType == queryTypeIdCardNo){
        //查询身份证号   18位
        if(str.length!=18){
            [HHWindow makeToast:@"身份证号码长度不正确"];
            return;
        }
        //idCardNo = @"45102519800411512X";
        [MobSDKTool getIdCardInfoWithIdCardNo:str andSuccBlock:^(NSDictionary *succResponseDict) {
            CommonAlert(dictToJson(succResponseDict));
        } andFailBlock:^(NSDictionary *failResponseDict) {
            NSString* error = [NSString stringWithFormat:@"%@",failResponseDict[@"error"]];
            CommonAlert(error);
        }];
        
    }else if(self.queryType == queryTypeBankCardNo){
        //查询银行卡号
        //bankCardNo =@"6228482898203884775";
        [MobSDKTool getBankCardInfoWithBankCardNo:str andSuccBlock:^(NSDictionary *succResponseDict) {
            CommonAlert(dictToJson(succResponseDict));
        } andFailBlock:^(NSDictionary *failResponseDict) {
            NSString* error = [NSString stringWithFormat:@"%@",failResponseDict[@"error"]];
            CommonAlert(error);
        }];
    }else if(self.queryType == queryTypeBodyHealth){
        
        [MobSDKTool getBodyHealthWithBodyName:str andSuccBlock:^(NSDictionary *succResponseDict) {
            CommonAlert(dictToJson(succResponseDict));
        } andFailBlock:^(NSDictionary *failResponseDict) {
            NSString* error = [NSString stringWithFormat:@"%@",failResponseDict[@"error"]];
            CommonAlert(error);
        }];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString* str = textField.text;
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSUInteger length = textField.text.length - range.length + string.length;
    
    if (self.queryType == queryTypePhoneBelong) {
        if (length>=8) {
            [textField resignFirstResponder]; //关闭键盘
            //查询手机号归属地
            [MobSDKTool getPhoneBelongWithPhoneNo:str andSuccBlock:^(NSDictionary *succResponseDict) {
                CommonAlert(dictToJson(succResponseDict));
                //self.showInfoView.hidden = NO;
            } andFailBlock:^(NSDictionary *failResponseDict) {
                NSString* errorStr = [failResponseDict[@"error"] localizedDescription];
                NSString* error = [NSString stringWithFormat:@"%@",failResponseDict[@"error"]];
                //HHLog(@"错误信息是%@=======\n%@",error,errorStr);
                CommonAlert(error);
            }];
        }
    }
    
    return YES;
}

@end
