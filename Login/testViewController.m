//
//  testViewController.m
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.arr removeAllObjects];
    
    ListModel *l = [[ListModel alloc]init];
    l.cellType = CellTypeFomLogo;
    l.logoImageNmae  = @"666";
    [self.arr addObject:l];
    
    ListModel *l2 = [[ListModel alloc]init];
    l2.cellType = CellTypeFomTextField;
    l2.formTitle  = @"  账号";
    l2.placeholder = @"请输入账号";
    [self.arr addObject:l2];
    
    ListModel *ll = [[ListModel alloc]init];
    ll.cellType = CellTypeFomTextField;
    ll.formTitle  = @"  密码";
    ll.placeholder = @"请输入密码";
    
    [self.arr addObject:ll];
    
    ListModel *ll2 = [[ListModel alloc]init];
    ll2.cellType = CellTypeFomSex;
    ll2.formTitle  = @"  性别";
    
    ll2.segmentArr = @[@"11",@"22",@"33"];
    
    
    [self.arr addObject:ll2];


    
    ListModel *l3 = [[ListModel alloc]init];
    l3.cellType = CellTypeFomTextView;
    l3.formTitle  = @"  内容";
    l3.placeholder = @"请输入内容";
    [self.arr addObject:l3];

    
    ListModel *l4 = [[ListModel alloc]init];
    l4.cellType = CellTypeFomButton;
    l4.buttonTittle = @"提交";
    [self.arr addObject:l4];
    
    [self.tableView reloadData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:(UIBarButtonItemStyleDone) target:self action:@selector(add)];
}

-(void)add{
    
    ListModel *ll = [[ListModel alloc]init];
    ll.cellType = CellTypeFomTextField;
    ll.formTitle  = @"  密码";
    ll.placeholder = @"请输入密码";
    [self.arr insertObject:ll atIndex:self.arr.count -2];
    
    [self.tableView reloadData];
    
    
}

- (void)changeed:(UITextField *)textField
{
    [super changeed:textField];

//    NSLog(@"行 = %zd  输入内容 = %@",textField.tag,textField.text);
    
    
}

- (void)logSender:(UIButton *)sender
{
    [super logSender:sender];
    
    NSLog(@"登录");
}


- (void)segmentedControlSender:(UISegmentedControl *)segmentedControl {
    [super segmentedControlSender:segmentedControl];
    
    
//     NSLog(@"性别 = %zd",segmentedControl.selectedSegmentIndex);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
