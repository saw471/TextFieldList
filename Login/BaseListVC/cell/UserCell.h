//
//  UserCell.h
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ListModel.h"


@interface UserCell : UITableViewCell

@property(nonatomic,copy) ListModel *model;

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *placeHolder;

@property(nonatomic,strong)NSString *butNmae;
@property (weak, nonatomic) IBOutlet UITextField *testField;

@end
