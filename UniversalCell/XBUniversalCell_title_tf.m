//
//  XBUniversalCell_title_tf.m
//  TongMeng
//
//  Created by xxb on 2019/1/29.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_tf.h"
#import "XBUniversalCell_header.h"

@interface XBUniversalCell_title_tf ()<UITextFieldDelegate>

@end

@implementation XBUniversalCell_title_tf

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
    self.lb_title = ({
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XBUniversalCell_float_leadingSpace);
            make.centerY.equalTo(self.contentView);
        }];
        label.textColor = XBUniversalCell_color_title;
        label.font = XBUniversalCell_font_title;
        label.text = @"title";
        label;
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
