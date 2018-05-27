//
//  SexCell.m
//  Login
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SexCell.h"

@implementation SexCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(ListModel *)model{
    _model = model;
    
    _tittleLabel.text = _model.formTitle;
    
//    self.segmentedControl.tintColor = [UIColor whiteColor];

//    self.segmentedControl.backgroundColor = [UIColor blackColor];
    
//    [self.segmentedControl setBackgroundColor:[UIColor blackColor]];

    
    
//    [self.segmentedControl setBackgroundImage:[UIImage imageNamed:@"666"] forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];
    
    
//    [self.segmentedControl setImage:[UIImage imageNamed:@"666"] forSegmentAtIndex:0];
    
    
    
    NSLog(@"%zd  == %zd ",self.segmentedControl.numberOfSegments,_model.segmentArr.count);
    
    if (self.segmentedControl.numberOfSegments == _model.segmentArr.count) {
        
        for (int i = 0; i<_model.segmentArr.count; i++)
        {
            [self.segmentedControl setTitle:_model.segmentArr[i]  forSegmentAtIndex:i];
        }
    }else{
        // 清空segmentedControl中现有item
        [self.segmentedControl removeAllSegments];
        
        // 从数组中拿到新的item 并插入segmentedControl中
        for (int i = 0; i<_model.segmentArr.count; i++)
        {
            [self.segmentedControl insertSegmentWithTitle:_model.segmentArr[i] atIndex:i animated:YES];
        }
    }
    


    if (_model.segmentArr.count >= [_model.value integerValue])
    {
        self.segmentedControl.selectedSegmentIndex = [_model.value integerValue];
    }

    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
