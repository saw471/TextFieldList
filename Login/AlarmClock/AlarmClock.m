//
//  AlarmClock.m
//  Login
//
//  Created by apple on 2018/5/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AlarmClock.h"
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>
@implementation AlarmClock


+(void)saveClockFromTittle:(NSString *)tittle location:(NSString *)location time:(id)time {

    //事件市场
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    //6.0及以上通过下面方式写入事件
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        // the selector is available, so we must be on iOS 6 or newer
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error)
                {
                    NSLog(@"错误 = %@",error);
                }
                else if (!granted)
                {
                    NSLog(@"被用户拒绝，不允许访问日历");
                    UIAlertView *alert = [[UIAlertView alloc]  initWithTitle:@"被用户拒绝，不允许访问日历"  message:nil delegate:nil  cancelButtonTitle:@"知道了"  otherButtonTitles:nil];
                    [alert show];
                }
                else
                {

                    //事件保存到日历
                    //创建事件
                    EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
                    event.title     = tittle;
                    event.location = location;
                    
//                    NSDateFormatter *tempFormatter = [[NSDateFormatter alloc]init];
//                    [tempFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
                    
                    event.startDate = [[NSDate alloc]init];
                    
                    NSLog(@"%@",[[NSDate alloc]init]);
                    
                    event.endDate   = [[NSDate alloc]init];
                    event.allDay = YES;
                    
                    //添加提醒
//                    [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f * -60.0f * 24]];
                    
                    [event addAlarm:[EKAlarm alarmWithAbsoluteDate:[[NSDate alloc]init]]];

                    [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f * -15.0f]];
                    
                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                    NSError *err;
                    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
                    NSLog(@"保存成功");
                    
                }
            });
        }];
    }
    else
    {
        // this code runs in iOS 4 or iOS 5
        // ***** do the important stuff here *****
        
        //4.0和5.0通过下述方式添加
        
        //保存日历
        EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
        event.title     = @"哈哈哈，我是日历事件啊";
        event.location = @"我在上海市普陀区";
        
        NSDateFormatter *tempFormatter = [[NSDateFormatter alloc]init];
        [tempFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
        
        event.startDate = [[NSDate alloc]init ];
        event.endDate   = [[NSDate alloc]init ];
        event.allDay = YES;
        
        
        [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f * -60.0f * 24]];
        [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f * -15.0f]];
        
        [event setCalendar:[eventStore defaultCalendarForNewEvents]];
        NSError *err;
        [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Event Created"
                              message:@"Yay!?"
                              delegate:nil
                              cancelButtonTitle:@"Okay"
                              otherButtonTitles:nil];
        [alert show];
        
        NSLog(@"保存成功");
        
    }
    
    
    
    
    
}
@end
