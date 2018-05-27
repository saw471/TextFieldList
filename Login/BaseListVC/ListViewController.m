//
//  ListViewController.m
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ListViewController.h"

#import "UITextView+APSUIControlTargetAction.h"




#import "LogoCell.h"
static NSString  *identLogo = @"LogoCell";
#import "UserCell.h"
static NSString  *identUser = @"UserCell";
#import "LogButtonCell.h"
static NSString  *identButton = @"LogButtonCell";
#import "TextViewCell.h"

static NSString  *identTextView = @"TextViewCell";

#import "SexCell.h"
static NSString  *identSex = @"SexCell";





@interface ListViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListModel *model = self.arr[indexPath.row];
    
    
    if (model.cellType == CellTypeFomLogo) // 徽标
    {
        LogoCell *cell  = [tableView dequeueReusableCellWithIdentifier:identLogo forIndexPath:indexPath];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.model = model;
        return cell;
    }
    else if (model.cellType == CellTypeFomTextField) // 徽标输入框
    {
        UserCell *cell =  [tableView dequeueReusableCellWithIdentifier:identUser forIndexPath:indexPath];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        if (indexPath.row == 1)
        {
            cell.butNmae = @"获取验证码";
        }
        cell.testField.tag = indexPath.row;
        [cell.testField addTarget:self action:@selector(changeed:) forControlEvents:(UIControlEventEditingChanged)];
        cell.model = model;
        return cell;
    }
    else if (model.cellType == CellTypeFomTextView) // 多行输入框
    {
        TextViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identTextView forIndexPath:indexPath];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.model = model;
        
        [cell.textView addTarget:self action:@selector(textViewChangge:) forControlEvents:(UIControlEventEditingChanged)];

        return cell;

    }
    else if (model.cellType == CellTypeFomSex) // 性别
    {
        SexCell *cell =[tableView dequeueReusableCellWithIdentifier:identSex forIndexPath:indexPath];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.model = model;
        
        [cell.segmentedControl addTarget:self action:@selector(segmentedControlSender:) forControlEvents:(UIControlEventValueChanged)];
        
        return cell;
        
    }
    else
    {
        LogButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:identButton forIndexPath:indexPath];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.model = model;
        BTN_MSG_FUNC(cell.loginButton, logSender:);
        return cell;
    }
}


#pragma mark ----------------------- textView ------------------------

-(void)textViewChangge:(UITextView *)textView{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TextViewCell *)textView.superview.superview];
    ListModel *model = self.arr[indexPath.row];
    model.value = textView.text;
    [self.arr replaceObjectAtIndex:indexPath.row withObject:model];
    
    
    NSLog(@" %@ = %@",model.formTitle,textView.text);
}

#pragma mark ----------------------- 性别切换 ------------------------
- (void)segmentedControlSender:(UISegmentedControl *)segmentedControl {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(SexCell *)segmentedControl.superview.superview];
    ListModel *model = self.arr[indexPath.row];
    model.value = [NSString stringWithFormat:@"%zd",segmentedControl.selectedSegmentIndex];
    [self.arr replaceObjectAtIndex:indexPath.row withObject:model];
    
    
    NSLog(@" %@ = %@ ",model.formTitle,model.segmentArr[segmentedControl.selectedSegmentIndex]);
    
}

#pragma mark ----------------------- 输入框------------------------
- (void)changeed:(UITextField *)textField
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UserCell *)textField.superview.superview];
    ListModel *model = self.arr[indexPath.row];
    model.value = textField.text;
    [self.arr replaceObjectAtIndex:indexPath.row withObject:model];
    
    
    NSLog(@" %@ = %@",model.formTitle,textField.text);
}
#pragma mark ----------------------- 登录 ------------------------
- (void)logSender:(UIButton *)sender
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        CGRect fram =CGRectMake(0,  NAVIGATION_BAR_HEIGHT,
                                ScreenWidth,  Screenheight- NAVIGATION_BAR_HEIGHT);
        
        UITableView *  tableView = [[UITableView alloc] initWithFrame:fram style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.delegate        = self;
        tableView.dataSource      = self;
        tableView.estimatedRowHeight = 44.0f; //推测高度，必须有，可以随便写多少
        tableView.rowHeight = UITableViewAutomaticDimension; //iOS8之后默认就是这个值，可以省略
        if (@available(iOS 11.0, *))
        {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        if (iPhoneX)
        {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, 34, 0);
            tableView.scrollIndicatorInsets = tableView.contentInset;
        }

        [tableView registerNib:[UINib nibWithNibName:identLogo bundle:nil] forCellReuseIdentifier:identLogo];
        [tableView registerNib:[UINib nibWithNibName:identUser bundle:nil] forCellReuseIdentifier:identUser];
        [tableView registerNib:[UINib nibWithNibName:identButton bundle:nil] forCellReuseIdentifier:identButton];
        
//
        
        [tableView registerNib:[UINib nibWithNibName:identTextView bundle:nil] forCellReuseIdentifier:identTextView];
        
        [tableView registerNib:[UINib nibWithNibName:identSex bundle:nil] forCellReuseIdentifier:identSex];
        
        
        [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
//        __weak __typeof(&*self)weakSelf = self;
        
        // 下拉刷新
        //        tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //
        //            weakSelf.pageIndex = 1;
        //
        //            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //                [weakSelf.tableView.mj_header endRefreshing];
        //            });
        //        }];
        //
        //        // 上拉加载
        //        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //
        //            if ( weakSelf.pageIndex < -1 ) {  weakSelf.pageIndex = 1;  }
        //
        //            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //                [weakSelf.tableView.mj_footer endRefreshing];
        //            });
        //        }];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resider)];
        
        [tableView addGestureRecognizer:tap];
        
        
        _tableView = tableView;
        
    }
    return _tableView;
}

-(void)resider
{
        [self.view endEditing:YES];
}


-(NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
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
