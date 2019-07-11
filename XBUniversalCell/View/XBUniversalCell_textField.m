//
//  XBUniversalCell_textField.m
//  D11Module
//
//  Created by xxb on 2017/7/18.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "XBUniversalCell_textField.h"
#import "XBUniversalCell_header.h"
#import "Masonry.h"
#import "XBButton.h"

@implementation XBUniversalCell_textField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    
    self.backgroundColor = XBUniversalCell_color_white;
    self.layer.borderColor = XBUniversalCell_color_dark.CGColor;
    self.returnKeyType = UIReturnKeyDone;

    
    self.text = XBUniversalCell_text_Default;
    self.textColor = XBUniversalCell_color_title;
    self.font = XBUniversalCell_font_tf;
    
    UIView *leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, XBUniversalCell_float_leadingSpace + 1, 1);
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.rightView = self.btn_rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
    
    
}
- (XBButton *)btn_rightView
{
    if (_btn_rightView == nil)
    {
        XBButton *btn = [XBButton new];
        btn.frame = CGRectMake(0, 0, XBUniversalCell_float_cellHeightNor, XBUniversalCell_float_cellHeightNor);
        btn.img_selected = XBUniversalCell_Image_XBUniversalCell_delete;
        btn.img_normal = XBUniversalCell_Image_XBUniversalCell_edit;
        btn.size_image = CGSizeMake(XBWidthFactorFun(18), XBWidthFactorFun(18));
        WEAK_SELF
        btn.bl_click = ^(XBButton *weakBtn) {
            if (weakSelf.bl_rightViewClick)
            {
                weakSelf.bl_rightViewClick(weakBtn);
            }
        };
        
        _btn_rightView = btn;
    }
    return _btn_rightView;
}

@end
