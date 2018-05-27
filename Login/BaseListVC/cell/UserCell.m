//
//  UserCell.m
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UserCell.h"
@interface UserCell ()
@property(nonatomic,strong)UILabel *label;

@property(nonatomic,strong)UIButton *button;


@property(nonatomic,assign)NSInteger shijian;

@property(nonatomic,strong)NSTimer *timer;

@end

@implementation UserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.testField.leftView = self.label;
    self.testField.leftViewMode = UITextFieldViewModeAlways;
    self.testField.layer.masksToBounds = YES;
    self.testField.layer.cornerRadius = self.testField.frame.size.height/2;
    self.testField.layer.borderWidth = 1;
    self.testField.layer.borderColor = [UIColor blackColor].CGColor;
}



-(void)setModel:(ListModel *)model{
    _model = model;
    
    
    _testField.keyboardType = _model.keyboardType;
    
    _label.text = _model.formTitle;
    
    
//    _label.adjustsLetterSpacingToFitWidth = YES;
    
    _testField.text= _model.value;
    
     self.testField.placeholder = _model.placeholder;
    
    if (_model.rightViewName.length > 0)
    {

        self.testField.rightView = self.button;
        self.testField.rightViewMode = UITextFieldViewModeAlways;
        
        [self.button setTitle:_model.rightViewName forState:(UIControlStateNormal)];
        [self.button addTarget:self action:@selector(sendMessage:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    

}


#pragma mark ----------------------- 发验证码 ------------------------

-(void)sendMessage:(UIButton *)sender
{
    NSLog(@"发验证码");
    self.shijian = 5;
    self.timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(openTimer) userInfo:nil repeats:YES];
    [self.timer fire];
    self.button.enabled = NO;
    
}



-(void)openTimer{
    
    NSString *str = _model.rightViewName;
    if (_shijian == 0)
    {
        [self.timer invalidate];
        self.button.enabled = YES;
    }
    else
    {
        self.button.enabled = NO;
        str = [NSString stringWithFormat:@"倒计时 %zd 秒",_shijian];
    }
    [self.button setTitle:str forState:(UIControlStateNormal)];
    _shijian--;
}


-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, self.testField.frame.size.height)];
        _label.textColor = [UIColor blackColor];
        
    }
    return _label;
}

-(UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _button .frame = CGRectMake(10, 0, 120, self.testField.frame.size.height);
        
        [_button setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
        
        
        [_button setTitleColor:[UIColor redColor] forState:(UIControlStateDisabled)];
    }
    return _button;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
