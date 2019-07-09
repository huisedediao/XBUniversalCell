//
//  XBUniversalCell_title_select.m
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_select.h"
#import "Masonry.h"

@implementation XBUniversalCell_title_select

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.btn_select.backgroundColor = self.btn_select.backgroundColor;
    }
    return self;
}


- (UILabel *)lb_title
{
    if (_lb_title == nil)
    {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        
        label.textColor = XBUniversalCell_color_title;
        label.font = XBUniversalCell_font_title;
        label.text = @"title";
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(XBUniversalCell_float_cellHeightNor);
//            make.top.greaterThanOrEqualTo(self.contentView);
            make.centerY.equalTo(self.contentView);
//            make.bottom.lessThanOrEqualTo(self.contentView);
            make.leading.equalTo(self.contentView).offset(XBUniversalCell_float_leadingSpace);
            make.width.mas_equalTo(ScreenWidth - 2 * XBUniversalCell_float_leadingSpace);
        }];
        
        _lb_title = label;
    }
    return _lb_title;
}
- (XBButton *)btn_select
{
    if (_btn_select == nil)
    {
        _btn_select = [XBButton new];
        [self.contentView addSubview:_btn_select];
        _btn_select.img_normal = XBUniversalCell_Image_accessorySel;
        _btn_select.size_image = CGSizeMake(22, 22);
        _btn_select.enum_contentAlign = XBBtnAlignRight;
        _btn_select.f_spaceOfContentAndBorderForAlign = XBUniversalCell_float_leadingSpace;
        [_btn_select mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self);
            make.width.equalTo(self->_btn_select.mas_height).multipliedBy(1.1);
            make.centerY.equalTo(self.lb_title);
            make.trailing.equalTo(self.contentView);
        }];
        typeof(self) __weak weakSelf = self;
        _btn_select.bl_click = ^(XBButton *weakBtn) {
            if (weakSelf.bl_selectStatusChange)
            {
                weakSelf.bl_selectStatusChange(weakSelf);
            }
        };
    }
    return _btn_select;
}
@end
