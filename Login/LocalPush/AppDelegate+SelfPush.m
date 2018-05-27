//
//  AppDelegate+SelfPush.m
//  Login
//
//  Created by apple on 2018/5/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AppDelegate+SelfPush.h"
#import <UserNotifications/UserNotifications.h> // ios10推送 需要导入以及遵守协议

@interface AppDelegate ()
<
UIAlertViewDelegate,
UNUserNotificationCenterDelegate
>

@end

@implementation AppDelegate (SelfPush)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"\n ===> 程序启动");
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [self registerAPN];
    return YES;
}



#pragma mark ----------------------- 注册本地通知 ------------------------
- (void)registerAPN
{
    

    // 在此根据版本不同，设置不同的注册方式 以ios8/10为分界线
    if ([UIDevice currentDevice].systemVersion.floatValue >= 10.0)
    {
        // 需要导入 <UserNotifications/UserNotifications.h>
        UNUserNotificationCenter *notifiCenter = [UNUserNotificationCenter currentNotificationCenter];
        notifiCenter.delegate = self;
        [notifiCenter requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted)
            {
                // 注册成功
                [notifiCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                    NSLog(@" 推送注册成功 ");
                }];
            }
            else
            {
                // 注册失败
                NSLog(@"推送注册失败");
            }
        }];
    }
    else if([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        // ios8 - ios10
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
    else
    {
        // ios7以下
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert ];
    }
    
}

#pragma mark ----------------------- 用户允许通知，会进入此回调 ------------------------
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    // 注册通知
    [application registerForRemoteNotifications];
}

#pragma mark ----------------------- 注册成功的回调 获取token ------------------------
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 在此回调中获得deviceToken
    NSString *tokenString = [NSString stringWithFormat:@"%@",deviceToken];
    
    NSLog(@"token = %@",tokenString);
    // 对数据进行处理，删除<、>、空格
    tokenString = [tokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
    tokenString = [tokenString stringByReplacingOccurrencesOfString:@"<" withString:@""];
    tokenString = [tokenString stringByReplacingOccurrencesOfString:@">" withString:@""];
    // 将处理好的tokenString上传给服务器
}

#pragma mark -----------------------  注册失败的回调 ------------------------
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"推送注册失败");
}

#pragma mark ----------------------- 远程推送 回调 在iOS10之后将会变更 ------------------------
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}

#pragma mark ----------------------- LocalPush 点击本地推送通知 进入APP后的回调 在iOS10之后将会变更 ------------------------
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [application cancelLocalNotification:notification];
}

#pragma mark - UNUserNotificationCenterDelegate
// iOS10 推送回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; //收到推送消息的全部内容
    NSNumber *badge = content.badge; // 推送消息的角标
    NSString *body = content.body; // 收到推送消息具体内容
    UNNotificationSound *sound = content.sound; //声音
    NSString *subTitle = content.subtitle; // 推送收到的副标题
    NSString *title = content.title; // 推送收到的标题
    
    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
    {
        NSLog(@"\n>>> iOS10 收到远程通知");
    }
    else
    {
        NSLog(@"\n===> ios10 收到本地通知 title=%@ subTitle=%@ body=%@ userInfo=%@ ",title,subTitle,body,userInfo);
    }
    completionHandler(UNNotificationPresentationOptionBadge |
                      UNNotificationPresentationOptionSound |
                      UNNotificationPresentationOptionAlert );
    // 需要执行此方法，选择是否提醒用户，有以上三种那个类型可选
    
}
#pragma mark -----------------------  通知的点击事件 ------------------------
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler
{
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request;
    UNNotificationContent *content = request.content; //收到推送消息的全部内容
    
    NSNumber *badge = content.badge; // 推送消息的角标
    UNNotificationSound *sound = content.sound; //声音

    NSString *title = content.title; // 推送收到的标题
    NSString *subTitle = content.subtitle; // 推送收到的副标题
    NSString *body = content.body; // 收到推送消息具体内容

    if ([request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
    {
         NSLog(@"\n>>>远程通知的点击事件");
    }
    else
    {
        NSLog(@"\n===> ios10 本地通知点击事件 title=%@ subTitle=%@ userInfo=%@",title,subTitle,userInfo);
    }
    completionHandler(); //系统要求执行此方法
    
}

#pragma mark ----------------------- 回到跳台 ------------------------
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
     NSLog(@"\n ===> 回到前台 !");
    
    //设置应用程序图片右上角的数字(如果想要取消右上角的数字, 直接把这个参数值为0)
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}


- (void)applicationWillResignActive:(UIApplication *)application {

    NSLog(@"\n ===> 程序挂起 !");
    // 比如:当有电话进来或者锁屏，这时你的应用程会挂起，在这时，UIApplicationDelegate委托会收到通知，调用 applicationWillResignActive 方法，你可以重写这个方法，做挂起前的工作，比如关闭网络，保存数据。
}

#pragma mark ----------------------- 进入后台 ------------------------
- (void)applicationDidEnterBackground:(UIApplication *)application
{

    NSLog(@"\n ===> 程序进入后台 !");
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

#pragma mark ----------------------- 程序重新激活 ------------------------
- (void)applicationDidBecomeActive:(UIApplication *)application
{

    NSLog(@"\n ===> 程序激活 !");
    //应用程序在启动时，在调用了 applicationDidFinishLaunching 方法之后也会调用 applicationDidBecomeActive 方法，所以你要确保你的代码能够分清复原与启动，避免出现逻辑上的bug。(大白话就是说:只要启动app就会走此方法)。
}




@end
