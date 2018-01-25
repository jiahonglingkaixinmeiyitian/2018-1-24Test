//
//  Header.h
//  linkTrustEducationPlatform
//
//  Created by 尚 on 2017/10/31.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//



#ifndef Header_h
#define Header_h

#pragma mark 尺寸相关
//状态栏高度
#define kStatusBar_Height 20
//NavBar高度
#define kNavigationBar_Height 44
//状态栏 ＋ 导航栏 高度
#define kStatus_And_Navigation_Height 64
//内容高度 = 屏幕高度 - 状态栏高度 - 导航栏高度
#define kContent_Height ([UIScreen mainScreen].bounds.size.height - 64)

#pragma mark  字体大小
#define size9   (CGFloat)9
#define size10  (CGFloat)10
#define size11  (CGFloat)11
#define size12  (CGFloat)12
#define size13  (CGFloat)13
#define size14  (CGFloat)14
#define size15  (CGFloat)15
#define size16  (CGFloat)16
#define size17  (CGFloat)17
#define size18  (CGFloat)18
#define size19  (CGFloat)19





#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenBounds [UIScreen mainScreen].bounds




#endif /* Header_h */



