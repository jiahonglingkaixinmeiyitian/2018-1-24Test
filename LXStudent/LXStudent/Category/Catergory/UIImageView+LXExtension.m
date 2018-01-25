//
//  UIImageView+LXExtension.m
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import "UIImageView+LXExtension.h"

@implementation UIImageView (LXExtension)

+ (instancetype)makeImageViewWithImageName:(NSString *)imageName contentMode:(UIViewContentMode)mode maskToBounds:(BOOL)maskToBounds alpha:(float)alpha userInteractionEnabled:(BOOL)userInteractionEnabled{
    UIImageView *localimage = [[UIImageView alloc]init];
    if (![imageName isEqualToString:@""]) {
        localimage.image = [UIImage imageNamed:imageName];
    }
    localimage.contentMode = mode;
//    localimage.layer.cornerRadius
    localimage.layer.masksToBounds = maskToBounds;
    localimage.alpha = alpha;
    localimage.userInteractionEnabled = userInteractionEnabled;
    return localimage;
}
+ (instancetype)makeImageViewWithImageName:(NSString *)imageName contentMode:(UIViewContentMode)mode maskToBounds:(BOOL)maskToBounds{
   return [self makeImageViewWithImageName:imageName contentMode:mode maskToBounds:maskToBounds alpha:1 userInteractionEnabled:false];
}
@end
