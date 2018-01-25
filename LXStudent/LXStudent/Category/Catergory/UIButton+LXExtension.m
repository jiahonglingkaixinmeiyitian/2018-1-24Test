//
//  UIButton+LXExtension.m
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import "UIButton+LXExtension.h"
#import "UIColor+LXExtension.h"
#import <objc/runtime.h>

static UIButton *btn;

@implementation UIButton (LXExtension)

+ (instancetype)makeButtonWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr selectColor:(NSString *)selectHexStr norImage:(NSString *)norImageName selImage:(NSString *)selImageName alignment:(NSTextAlignment)alignment target:(id)target sel:(SEL)sel{
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexStr:hexStr] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexStr:selectHexStr] forState:UIControlStateSelected];
    
    if (![selImageName isEqualToString:@""]) {
        [button setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    }
    if (![norImageName isEqualToString:@""]) {
        [button setImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    }
    
    button.titleLabel.textAlignment = alignment;
    
    if (target != nil && sel != nil) {
        [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

+ (instancetype)makeButtonWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr norImage:(NSString *)norImageName selImage:(NSString *)selImageName{
    
    return [self makeButtonWithTitle:title font:fontSize textColor:hexStr selectColor:@"" norImage:norImageName selImage:selImageName alignment:0 target:nil sel:nil];
}

+ (instancetype)makeButtonWithTitle:(NSString *)title{
    return [self makeButtonWithTitle:title norImage:@""];
}

+ (instancetype)makeButtonWithTitle:(NSString *)title norImage:(NSString *)norImageName{
    return [self makeButtonWithTitle:title font:12 textColor:@"" norImage:norImageName selImage:@""];
}


+ (UIButton *(^)(NSString *))makeBtnTitle{
    btn = [[UIButton alloc]init];
    return ^(NSString *title){
        [btn setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(CGFloat))makeBtnFont{
    return ^(CGFloat fontSize){
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UIButton *(^)(NSString *))makeNormalTextColor{
    return ^(NSString *hexStr){
        [btn setTitleColor:[UIColor colorWithHexStr:hexStr] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *))makeBtnSelectTextColor{
    return ^(NSString *hexStr){
        [btn setTitleColor:[UIColor colorWithHexStr:hexStr] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(NSString *))makeNormalImage{
    return ^(NSString *imageName){
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *))makeSelectImage{
    return ^(NSString *selectImageName){
        [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(NSTextAlignment))makeTextAlignment{
    return ^(NSTextAlignment alignment){
        btn.titleLabel.textAlignment = alignment;
        return self;
    };
}

- (UIButton *(^)(id, SEL))makeTaggetAndSEL{
    return ^(id target,SEL sel){
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}



@end
