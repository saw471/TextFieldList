//
//  ListViewController.h
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"


#import "ListModel.h"

@interface ListViewController : UIViewController
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *arr;

- (void)changeed:(UITextField *)textField;

- (void)logSender:(UIButton *)sender;
- (void)segmentedControlSender:(UISegmentedControl *)segmentedControl ;
@end
