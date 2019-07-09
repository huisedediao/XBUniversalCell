//
//  XBUniversalCell_btn_tf.m
//  XBUniversalCell
//
//  Created by xxb on 2019/2/21.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBUniversalCell_btn_tf.h"

@interface XBUniversalCell_btn_tf ()<UITextFieldDelegate>

@end

@implementation XBUniversalCell_btn_tf

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews
{
    self.btn_title = ({
        XBButton *btn = [XBButton new];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XBUniversalCell_float_leadingSpace);
            make.centerY.equalTo(self.contentView);
            make.height.mas_equalTo(XBUniversalCell_float_cellHeightNor);
            make.width.mas_equalTo(70);
        }];
        btn.font_title = XBUniversalCell_font_title;
        btn.color_titleNormal = XBUniversalCell_color_title;
        btn.str_titleNormal = @"title";
        btn.img_normal = XBUniversalCell_Image_XBUniversalCell_downArrow;
        btn.size_image = CGSizeMake(13, 9);
        btn.enum_contentAlign = XBBtnAlignEachSide;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    self.tf_content = ({
        UITextField *tf = [UITextField new];
        [self.contentView addSubview:tf];
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XBUniversalCell_float_titleTFCellTFLeadingSpace);
            make.centerY.equalTo(self.contentView);
            make.top.bottom.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(- XBUniversalCell_float_leadingSpace);
        }];
        tf.font = XBUniversalCell_font_title;
        tf.textColor = XBUniversalCell_color_title;
        tf.placeholder = @"placeholder";
        tf;
    });
}
- (void)btnClick:(XBButton *)btn
{
    if (self.bl_btnClick)
    {
        self.bl_btnClick(btn);
    }
}

- (void)updateTitleBtnWidth:(CGFloat)width
{
    [self.btn_title mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}

#pragma mark - textField代理
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.tf_content)
    {
        if (self.bl_endEditing)
        {
            self.bl_endEditing(textField.text);
        }
    }
}
@end
