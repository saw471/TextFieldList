//
//  Header.h
//  ZhiBoYuan
//
//  Created by mac on 2018/4/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#ifndef Header_h
#define Header_h
//#import <UIKit/UIKit.h>
// --------------屏幕宽高--------------------
#import "AppDelegate.h"
//#import "SDAutoLayout.h"

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define Screenheight ([UIScreen mainScreen].bounds.size.height)

#define SCREEN_HEIGHT Screenheight

//#define HTTPP @"http://zby.huahualive.net/index.php?" // 原来测试

#define HTTPP @"http://rapi.rrnjnx.com/index.php?"  // 新测试

#define Teacher ((AppDelegate *)[UIApplication sharedApplication].delegate).teacher

#ifdef DEBUG
#   define NNSLog(fmt, ...) NSLog((@"【】%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define NNSLog(...)
#endif

//打印
#ifdef DEBUG
#define ZYLog(fmt,...) NSLog((@"%s [line %d] " fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define ZYLog(...)
#endif

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define ZhuTiColor RGB(76,186,198)

#define ZhuTiColorAlpha(alpha) RGBA(76, 186, 198, alpha)

#define hui1Color [UIColor colorWithWhite:0.902 alpha:1.000]// 1灰

#define hui2Color [UIColor colorWithWhite:0.800 alpha:1.000]// 2灰

#define hui3Color [UIColor colorWithWhite:0.702 alpha:1.000]// 3灰

#define hui4Color [UIColor colorWithWhite:0.600 alpha:1.000]// 4灰

#define hui5Color [UIColor colorWithWhite:0.502 alpha:1.000]// 5灰

#define hui6Color [UIColor colorWithWhite:0.498 alpha:1.000]// 6灰

#define hui7Color [UIColor colorWithWhite:0.400 alpha:1.000]// 7灰

#define hui8Color [UIColor colorWithWhite:0.298 alpha:1.000]// 8灰

#define hui9Color [UIColor colorWithWhite:0.200 alpha:1.000]// 9灰

#define hui10Color [UIColor colorWithWhite:0.098 alpha:1.000]// 10灰

// 随机色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:1]


// 弱引用 weakSelf
#define K_WEAK_SELF __weak __typeof(&*self)weakSelf = self

// button添加点击事件
#define BTN_MSG_FUNC(btn,func) [btn addTarget:self action:@selector(func) forControlEvents:UIControlEventTouchUpInside]

// button添加点击事件
#define BTN_MSG_FUNC(btn,func) [btn addTarget:self action:@selector(func) forControlEvents:UIControlEventTouchUpInside];

// 判断是否是iPhone 5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone 6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone plus
#define iPhone7plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)

// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)

// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)

// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

// 按照像素处理值
#define SNRealValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

//按照比例做适配
#define KscreenWidth  (iPhoneX ? ScreenWidth/375 : ScreenWidth/414)
#define KscreenHeight (iPhoneX ? Screenheight/812 : Screenheight/736)

#define WidthConfig(value)  (iPhoneX ? ScreenWidth / 375 * value : ScreenWidth / 414 * value )
#define HeightConfig(value) (iPhoneX ? Screenheight / 812 * value : Screenheight / 736* value )


#define HEIGHT 45

#define IMG_EmptyDefault @"图层62"

#define NoNetWorkMessage @"哦，您的网络不太好"

#define PlaceHoldImage [UIImage imageNamed:@"lessonPlace"]

#define rechNotifyName @"rechNotifyName"

#define XING_EMOJI @"⭐"

#define FourClassHight 100

UIKIT_STATIC_INLINE UIViewController *ZYCurrentViewController() {
    
    UIViewController *topViewController = [[UIApplication sharedApplication].keyWindow rootViewController];
    
    if ([topViewController isKindOfClass:[UITabBarController class]]) {
        
        topViewController = ((UITabBarController *)topViewController).selectedViewController;
    }
    
    if ([topViewController presentedViewController]) {
        
        topViewController = [topViewController presentedViewController];
    }
    
    if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *)topViewController topViewController]) {
        
        return [(UINavigationController*)topViewController topViewController];
    }
    
    return topViewController;
}

#endif /* Header_h */
