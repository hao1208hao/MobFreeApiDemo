//
//  NSString+Size.h
//  AutoResizeTableViewCell2
//
//  Created by zhengbing on 6/27/16.
//  Copyright © 2016 zhengbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Size)

+(CGSize)textString:(NSString *)text fontSize:(CGFloat)fontSize maxWidth:(CGFloat)maxWidth;

@end
