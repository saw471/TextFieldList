//
//  SexCell.h
//  Login
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
@interface SexCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@property(nonatomic,copy) ListModel *model;

@end
