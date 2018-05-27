//
//  LogoCell.m
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LogoCell.h"

@implementation LogoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(ListModel *)model{
    _model = model;
    
    self.logoImage.image = [UIImage imageNamed:_model.logoImageNmae];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
