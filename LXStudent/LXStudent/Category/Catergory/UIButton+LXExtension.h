//
//  UIButton+LXExtension.h
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LXExtension)

+ (instancetype)makeButtonWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr selectColor:(NSString *)selectHexStr norImage:(NSString *)norImageName selImage:(NSString *)selImageName alignment:(NSTextAlignment)alignment target:(id)target sel:(SEL)sel;

+ (instancetype)makeButtonWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(NSString *)hexStr norImage:(NSString *)norImageName selImage:(NSString *)selImageName;

+ (instancetype)makeButtonWithTitle:(NSString *)title;

+ (instancetype)makeButtonWithTitle:(NSString *)title norImage:(NSString *)norImageName;

//+ (instancetype)makeButtonWithnorImage:(NSString *)norImageName;


///// 分类中的button 使用关联对象关联
////@property (nonatomic,strong) UIButton *baseButton;
///**
// 设置按钮的title
// */
//- (UIButton*(^)(NSString *title))makeBtnTitle;
///**
// 设置按钮的字体
// */
//- (UIButton*(^)(CGFloat fontSize))makeBtnFont;
///**
// 设置按钮的text的normal颜色
// */
//- (UIButton*(^)(NSString *hexStr))makeNormalTextColor;
///**
// 设置按钮的选中的text颜色
// */
//- (UIButton*(^)(NSString *hexSelStr))makeBtnSelectTextColor;
//
///**
// 设置按钮的normal的图片
// */
//- (UIButton*(^)(NSString *normalImageName))makeNormalImage;
///**
// 设置按钮的选中的图片
// */
//- (UIButton*(^)(NSString *selectImageName))makeSelectImage;
///**
// 设置按钮的文本的样式
// */
//- (UIButton*(^)(NSTextAlignment alignment))makeTextAlignment;
///**
// 设置按钮的点击方法
// */
//- (UIButton*(^)(id target,SEL sel))makeTaggetAndSEL;


@end
