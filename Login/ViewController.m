//
//  ViewController.m
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"

#import "testViewController.h"

#import "LocalPush.h"

#import "AlarmClock.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    testViewController *vc = [[testViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


// 提醒
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [AlarmClock saveClockFromTittle:@"下午三点有课" location:@"北京世纪饭店" time:nil];
//}


// 登录列表
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    testViewController *vc = [[testViewController alloc]init];

    [self.navigationController pushViewController:vc animated:YES];
}


// 本地推送
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [LocalPush SharePushFromTitle:@"小明对你说：" subtitle:@"你今天中午吃的啥呀啊？" userInfo:@{@"2":@"yyyuuuui"}];
//
//    [LocalPush SharePushFromTitle:@"行程提醒" subtitle:@"下午三点有会，请准时参加！" body:nil userInfo:nil afterDelay:10];
////    [LocalPush SharePushFromTitle:@"行程提醒" subtitle:@"下午三点有会，请准时参加！" body:nil userInfo:nil afterDelay:20];
////    [LocalPush SharePushFromTitle:@"行程提醒" subtitle:@"下午三点有会，请准时参加！" body:nil userInfo:nil afterDelay:30];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
