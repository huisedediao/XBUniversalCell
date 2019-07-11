//
//  XBUniversalCell_tf_switch.m
//  aw1_plus
//
//  Created by xxb on 2018/5/29.
//  Copyright © 2018年 sven. All rights reserved.
//

#import "XBUniversalCell_tf_switch.h"
#import "Masonry.h"
#import "XBButton.h"

#define keyPathForOn @"_selected"

@interface XBUniversalCell_tf_switch () <UITextFieldDelegate>
{
    BOOL _isOn;
}

@property (nonatomic,strong) UISwitch *sw_switch;

@end

@implementation XBUniversalCell_tf_switch


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.sw_switch.backgroundColor = self.sw_switch.backgroundColor;
        [self addNotice];
    }
    return self;
}
- (void)dealloc
{
    [self removeNotice];
}
- (void)setIsOn:(BOOL)isOn
{
    _isOn = isOn;
    self.sw_switch.on = isOn;
    [self setTitleLabelTextColor];
}
- (BOOL)isOn
{
    return self.sw_switch.on;
}
- (UITextField *)tf_title
{
    if (_tf_title == nil)
    {
        UITextField *tf = [UITextField new];
        _tf_title = tf;
        [self.contentView addSubview:tf];
        tf.font = XBUniversalCell_font_tf;
        tf.text = @"title";
        tf.delegate = self;
        tf.returnKeyType = UIReturnKeyDone;
        
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(XBUniversalCell_float_cellHeightNor);
//            make.top.greaterThanOrEqualTo(self.contentView);
            make.centerY.equalTo(self.contentView);
//            make.bottom.lessThanOrEqualTo(self.contentView);
            make.leading.equalTo(self.contentView).offset(XBUniversalCell_float_leadingSpace);
            make.width.mas_equalTo(kScreenWidth - 100);
        }];
        [self setTitleLabelTextColor];
    }
    return _tf_title;
}

- (UISwitch *)sw_switch
{
    if (_sw_switch == nil)
    {
        UISwitch *sw = [[UISwitch alloc] init];
        [self.contentView addSubview:sw];
        
        sw.onTintColor = XBUniversalCell_color_blue;
        
        [sw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.tf_title);
            make.trailing.equalTo(self.contentView).offset(-XBUniversalCell_float_leadingSpace);
        }];
        [sw addTarget:self action:@selector(switchStatusChange:) forControlEvents:UIControlEventValueChanged];
        
        _sw_switch = sw;
    }
    return _sw_switch;
}

- (void)switchStatusChange:(UISwitch *)sw
{
    if (self.bl_switch)
    {
        WEAK_SELF
        self.bl_switch(weakSelf);
    }
    [self setTitleLabelTextColor];
}

- (void)setTitleLabelTextColor
{
    _tf_title.textColor = _sw_switch.on ? XBUniversalCell_color_title : XBUniversalCell_color_text_disable;
}


- (void)addNotice
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tfTextDidChangee:) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)removeNotice
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)tfTextDidChangee:(NSNotification *)noti
{
    if (noti.object == self.tf_title)
    {
        NSInteger count = 30;
        if ([CurrentLanguage hasPrefix:@"zh"])
        {
            count = 10;
        }
        if (self.tf_title.text.length > count)
        {
            self.tf_title.text = [self.tf_title.text substringToIndex:count];
        }
    }
}


#pragma mark - tf代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
//    if (textField == self.tf_title)
//    {
//        if (self.isOn)
//        {
//            return YES;
//        }
//    }
//    return NO;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.tf_title resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    WEAK_SELF
    if (self.bl_tfEndEdit)
    {
        self.bl_tfEndEdit(weakSelf, weakSelf.tf_title.text);
    }
}
@end
