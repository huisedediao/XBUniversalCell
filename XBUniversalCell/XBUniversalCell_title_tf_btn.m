//
//  XBUniversalCell_title_tf_btn.m
//  XBUniversalCell
//
//  Created by xxb on 2019/2/21.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_tf_btn.h"
#import "XBTimer.h"
#import "Masonry.h"
#import "XBButton.h"

#define kBtnWidth (80)
#define kMaxTimerCount (60)

@interface XBUniversalCell_title_tf_btn ()<UITextFieldDelegate>
@property (nonatomic,strong) XBTimer *timer;
@property (nonatomic,assign) NSTimeInterval endTimerTime;
@end

@implementation XBUniversalCell_title_tf_btn
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubviews];
        [self addNotice];
    }
    return self;
}

- (void)dealloc
{
    [self removeNotice];
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
    
    self.btn_send = ({
        XBButton *btn = [XBButton new];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(- XBUniversalCell_float_leadingSpace);
            make.centerY.equalTo(self.contentView);
            make.width.mas_equalTo(kBtnWidth);
            make.height.mas_equalTo(35);
        }];
        btn.layer.cornerRadius = 5;
        btn.str_titleNormal = @"获取验证码";
        btn.color_titleNormal = XBUniversalCell_color_white;
        btn.backgroundColor = XBUniversalCell_color_blue;
        btn.color_backgroundSelected = XBUniversalCell_color_text_disable;
        btn.font_title = XBUniversalCell_font_iconTitleText;
        [btn addTarget:self action:@selector(sendCodeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    self.tf_content = ({
        UITextField *tf = [UITextField new];
        [self.contentView addSubview:tf];
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XBUniversalCell_float_titleTFCellTFLeadingSpace);
            make.centerY.equalTo(self.contentView);
            make.top.bottom.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(- XBUniversalCell_float_leadingSpace * 2 - kBtnWidth);
        }];
        tf.font = XBUniversalCell_font_title;
        tf.textColor = XBUniversalCell_color_title;
        tf.placeholder = @"placeholder";
        tf.keyboardType = UIKeyboardTypeNumberPad;
        tf;
    });
}

#pragma mark - 通知相关
- (void)addNotice
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tfTextChange:) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)removeNotice
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)tfTextChange:(NSNotification *)noti
{
    if (noti.object == self.tf_content)
    {
        if (self.tf_content.text.length > 6)
        {
            self.tf_content.text = [self.tf_content.text substringToIndex:6];
        }
    }
}

#pragma mark - 点击事件
- (void)sendCodeBtnClick:(XBButton *)btn
{
    if (btn.selected)
    {
        return;
    }
    if (self.bl_sendBtnWillDisable)
    {
        if (self.bl_sendBtnWillDisable() == NO)
        {
            return;
        }
    }
//    [self.tf_content becomeFirstResponder];
    [self setSendCodeBtnEnable:NO];
    self.endTimerTime = [[NSDate date] timeIntervalSince1970] + kMaxTimerCount;
    [self.timer startOnMainThread:NO delay:YES];
    if (self.bl_sendBtnClick)
    {
        self.bl_sendBtnClick(self.btn_send);
    }
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
#pragma mark - 懒加载
- (XBTimer *)timer
{
    if (_timer == nil)
    {
        WEAK_SELF
        _timer = [[XBTimer alloc] initWithTimeInterval:1 owner:self repeats:YES block:^(XBTimer *timer) {
            NSInteger residue = weakSelf.endTimerTime - [[NSDate date] timeIntervalSince1970];
            if (residue <= 0)
            {
                [timer stop];
                [weakSelf setSendCodeBtnEnable:YES];
            }
            else
            {
                [weakSelf setSendCodeBtnEnable:NO];
            }
        }];
    }
    return _timer;
}

#pragma mark - 被调用方法
- (void)setSendCodeBtnEnable:(BOOL)enable
{
    self.btn_send.selected = !enable;
    self.btn_send.enabled = enable;
//    if (enable)
//    {
//        //        self.btn_send.layer.borderColor = Setting_Color_textGray_light.CGColor;
//        self.btn_send.layer.borderWidth = 0;
//    }
//    else
//    {
//        self.btn_send.layer.borderColor = XBUniversalCell_color_text_disable.CGColor;
//        self.btn_send.layer.borderWidth = 1;
//    }
}

@end
