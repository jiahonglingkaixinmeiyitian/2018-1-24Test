//
//  UIFont+LXExtension.m
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import "UIFont+LXExtension.h"

@implementation UIFont (LXExtension)
+ (UIFont *)fontWithFontSize:(CGFloat)fontSize{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    return font;
}
@end
