//
//  NSString+Size.m
//  AutoResizeTableViewCell2
//
//  Created by zhengbing on 6/27/16.
//  Copyright © 2016 zhengbing. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)


+(CGSize)textString:(NSString *)text fontSize:(CGFloat)fontSize maxWidth:(CGFloat)maxWidth{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size;
}
@end
