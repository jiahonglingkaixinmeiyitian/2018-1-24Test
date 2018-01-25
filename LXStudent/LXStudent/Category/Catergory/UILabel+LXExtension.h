//
//  UILabel+LXExtension.h
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LXExtension)

+ (instancetype)makeLabelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr numofLine:(int)num alignment:(NSTextAlignment)alignment;

+ (instancetype)makeLabelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr;
@end
