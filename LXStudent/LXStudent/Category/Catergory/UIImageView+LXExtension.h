//
//  UIImageView+LXExtension.h
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LXExtension)
+ (instancetype)makeImageViewWithImageName:(NSString *)imageName contentMode:(UIViewContentMode)mode maskToBounds:(BOOL)maskToBounds alpha:(float)alpha userInteractionEnabled:(BOOL)userInteractionEnabled;
+ (instancetype)makeImageViewWithImageName:(NSString *)imageName contentMode:(UIViewContentMode)mode maskToBounds:(BOOL)maskToBounds;
@end
