//
//  XBUniversalCell_title_edit.m
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_edit.h"
#import "Masonry.h"
#import "XBUniversalCell_header.h"
#import "XBButton.h"

@interface XBUniversalCell_title_edit ()<UITextFieldDelegate>

@end

@implementation XBUniversalCell_title_edit

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.tf_title.backgroundColor = self.tf_title.backgroundColor;
        [self addNotice];
    }
    return self;
}
- (void)dealloc
{
    [self removeNotice];
}

#pragma mark - 通知
- (void)addNotice
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tfTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)removeNotice
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)tfTextDidChange:(NSNotification *)noti
{
    if (self.i_maxTextLen != 0)
    {
        NSInteger lenght = self.i_maxTextLen;
        if (noti.object == self.tf_title)
        {
            if (self.tf_title.text.length > lenght)
            {
                self.tf_title.text = [self.tf_title.text substringToIndex:lenght];
            }
        }
    }
}

#pragma mark - UITextField 代理
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField != self.tf_title)
    {
        return;
    }
    self.tf_title.btn_rightView.size_image = CGSizeMake(GWidthFactorFun(22), GHeightFactorFun(22));
    self.tf_title.btn_rightView.selected = YES;
    if (self.bl_textFieldBeginEdit)
    {
        typeof(self) __weak weakSelf = self;
        self.bl_textFieldBeginEdit(weakSelf,self.tf_title.text);
    }
//    textField.layer.borderWidth = 1;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField != self.tf_title)
    {
        return;
    }
    self.tf_title.btn_rightView.size_image = CGSizeMake(GWidthFactorFun(18), GHeightFactorFun(18));
    self.tf_title.btn_rightView.selected = false;
    textField.layer.borderWidth = 0;
    if (self.bl_textFieldDidEndEdit)
    {
        typeof(self) __weak weakSelf = self;
        self.bl_textFieldDidEndEdit(weakSelf,textField.text);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField != self.tf_title)
    {
        return YES;
    }
    [textField resignFirstResponder];
    return YES;
}


- (XBUniversalCell_textField *)tf_title
{
    if (_tf_title == nil)
    {
        XBUniversalCell_textField *tf = [XBUniversalCell_textField new];
        _tf_title = tf;
        [self.contentView addSubview:tf];
        tf.delegate = self;
        WEAK_SELF
        tf.bl_rightViewClick = ^(XBButton *weakBtn) {
            if (weakBtn.selected)
            {
                weakSelf.tf_title.text = @"";
            }
            else
            {
                [weakSelf.tf_title becomeFirstResponder];
            }
        };
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
            make.height.mas_equalTo(XBUniversalCell_float_cellHeightNor);
            make.width.mas_equalTo(ScreenWidth);
        }];
        tf.font = XBUniversalCell_font_tf;
    }
    return _tf_title;
}

@end
