//
//  UILabel+LXExtension.m
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import "UILabel+LXExtension.h"
#import "UIFont+LXExtension.h"
#import "UIColor+LXExtension.h"
@implementation UILabel (LXExtension)

+ (instancetype)makeLabelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr numofLine:(int)num alignment:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont fontWithFontSize:fontSize];
    label.text = title;
    label.textAlignment = alignment;
    label.textColor = [UIColor colorWithHexStr:hexStr];
    return label;
}

+ (instancetype)makeLabelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr{
    return [self makeLabelWithTitle:title font:fontSize textColor:hexStr numofLine:1 alignment:1];
}

@end
