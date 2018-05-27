//
//  LogoCell.h
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

@interface LogoCell : UITableViewCell

@property(nonatomic,copy) ListModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;

@end
