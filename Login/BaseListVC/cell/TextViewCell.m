//
//  TextViewCell.m
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TextViewCell.h"
//#import "UITextView+APSUIControlTargetAction.h"

@implementation TextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.textView.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.textView.layer.borderWidth = 1;
}

-(void)setModel:(ListModel *)model{
    _model = model;
    
    _textView.keyboardType = _model.keyboardType;
    
    _textlabel.text = _model.formTitle;
    
    _textView.text = _model.value;
    _textView.placeholder = _model.placeholder;
    
    if (_model.maxInputLength > 0) {
        _textView.limitLength =  [NSNumber numberWithInteger:_model.maxInputLength] ;
    }
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
