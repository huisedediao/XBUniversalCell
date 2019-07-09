//
//  XBUniversalCell_title_switch.m
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_switch.h"
#import "XBUniversalCell_header.h"
#import "Masonry.h"

#define keyPathForOn @"_selected"

@interface XBUniversalCell_title_switch ()
{
    BOOL _isOn;
}

@property (nonatomic,strong) UISwitch *sw_switch;

@end

@implementation XBUniversalCell_title_switch

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.sw_switch.backgroundColor = self.sw_switch.backgroundColor;
    }
    return self;
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
- (UILabel *)lb_title
{
    if (_lb_title == nil)
    {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        
        label.font = XBUniversalCell_font_title;
        label.text = @"title";
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(XBUniversalCell_float_cellHeightNor);
//            make.top.greaterThanOrEqualTo(self.contentView);
            make.centerY.equalTo(self.contentView);
//            make.bottom.lessThanOrEqualTo(self.contentView);
            make.leading.equalTo(self.contentView).offset(XBUniversalCell_float_leadingSpace);
            make.width.mas_equalTo(ScreenWidth - 100);
        }];
        
        _lb_title = label;
        
        [self setTitleLabelTextColor];
    }
    return _lb_title;
}
- (UISwitch *)sw_switch
{
    if (_sw_switch == nil)
    {
        UISwitch *sw = [[UISwitch alloc] init];
        [self.contentView addSubview:sw];
        
        sw.onTintColor = XBUniversalCell_color_blue;
        
        [sw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lb_title);
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
    _lb_title.textColor = _sw_switch.on ? XBUniversalCell_color_title : XBUniversalCell_color_text_disable;
}
@end
