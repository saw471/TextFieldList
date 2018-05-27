//
//  TextViewCell.h
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
#import "UITextView+YLTextView.h"

@interface TextViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *textlabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property(nonatomic,copy) ListModel *model;
@end
