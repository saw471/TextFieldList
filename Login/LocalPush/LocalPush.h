//
//  LocalPush.h
//  Login
//
//  Created by apple on 2018/5/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <CoreLocation/CoreLocation.h>
#import<MobileCoreServices/MobileCoreServices.h>


@interface LocalPush : NSObject

//+(void)SharePush;
+ (void)SharePushFromTitle:(NSString *)title  subtitle:(NSString *)subtitle  body:(NSString *)body userInfo:(NSDictionary *)userInfo afterDelay:(NSTimeInterval)afterDelay;

+ (void)SharePushFromTitle:(NSString *)title  subtitle:(NSString *)subtitle  userInfo:(NSDictionary *)userInfo;

+ (void)SharePushFromTitle:(NSString *)title  subtitle:(NSString *)subtitle;

+ (void)deleteLocalPush;


@end
