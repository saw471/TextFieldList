//
//  ListModel.h
//  Login
//
//  Created by apple on 2018/5/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/** 表单cell类型 */
typedef NS_ENUM(NSInteger, CellTypeFom) {
    
    CellTypeFomLogo = 0,     // logo
    CellTypeFomTextField ,    //单行或多行输入
    CellTypeFomTextView ,    //包含textView输入
    CellTypeFomSex ,   //选择 性别
    CellTypeFomSelImage ,   //选图
    CellTypeFomButton ,   //提交
};


/** 表单条目选择回调 */
//typedef void(^FormItemSelectHandle)(SelwynFormItem *item);
@interface ListModel : NSObject

/** 表单cell类型 */
@property (nonatomic, assign) CellTypeFom cellType;

/** item 缺省高度 缺省44*/
@property (nonatomic, assign) CGFloat defaultCellHeight;

/** 标题 */
@property (nonatomic, copy) NSString *formTitle;
/** 占位提示 */
@property (nonatomic, copy) NSString *placeholder;

/**  输入框内容保存  */
@property(nonatomic,strong)NSString *value;

/** 富文本标题 可配置标题颜色等*/
@property (nonatomic, strong) NSAttributedString *formAttributedTitle;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;

/** logo */
@property (nonatomic, copy) NSString *logoImageNmae;


@property(nonatomic,strong)NSIndexPath *indexPath;

/** 键盘类型 */
@property (nonatomic, assign) UIKeyboardType keyboardType;


/*  segment item  */
@property (nonatomic, strong) NSArray *segmentArr;


/** 提交按钮名字 */
@property(nonatomic,copy)NSString *buttonTittle;


/*  右视图 接收验证码按钮名字  */
@property(nonatomic,copy)NSString *rightViewName;
/*  计时器时间  */
@property(nonatomic,assign)NSInteger timeCount;


/** 是否是必填（必选） */
@property (nonatomic, assign) BOOL required;
/** 是否可编辑 */
@property (nonatomic, assign) BOOL editable;
/** 是否是详情页面 */
@property (nonatomic, assign) BOOL isDetail;

/** 附件图片 */
@property (nonatomic, strong) NSArray *images;
/** 附件最大图片选择数量 缺省4张*/
@property (nonatomic, assign) NSInteger maxImageCount;

/** 表单条目选择回调 */
//@property (nonatomic, copy) FormItemSelectHandle selectHandle;
/** 表单输入字数限制 缺省为0（无限制）*/
@property (nonatomic, assign) NSInteger maxInputLength;
/** 对齐方式 */
@property (nonatomic, assign) NSTextAlignment textAlignment;
@end
