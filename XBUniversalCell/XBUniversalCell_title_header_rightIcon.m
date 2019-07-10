//
//  XBUniversalCell_title_header_rightIcon.m
//  XBUniversalCell
//
//  Created by xxb on 2019/1/18.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_header_rightIcon.h"
#import "Masonry.h"
#import "XBUniversalCell_header.h"

@implementation XBUniversalCell_title_header_rightIcon


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.lb_title.backgroundColor = self.lb_title.backgroundColor;
        self.imgV_header.backgroundColor = self.imgV_header.backgroundColor;
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
            make.centerY.equalTo(self.contentView);
            make.leading.equalTo(self.contentView).offset(XBUniversalCell_float_leadingSpace);
            make.width.mas_equalTo(ScreenWidth - 2 * XBUniversalCell_float_leadingSpace);
        }];
        
        _lb_title = label;
    }
    return _lb_title;
}

- (UIImageView *)imgV_rightIcon
{
    if (_imgV_rightIcon == nil)
    {
        UIImageView *imgv = [UIImageView new];
        [self.contentView addSubview:imgv];
        
        imgv.image = XBUniversalCell_Image_cellRightIcon;
        
        [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(7, 12));
            make.trailing.centerY.equalTo(self.lb_title);
        }];
        
        _imgV_rightIcon = imgv;
    }
    return _imgV_rightIcon;
}

- (UIImageView *)imgV_header
{
    if (_imgV_header == nil)
    {
        _imgV_header = [UIImageView new];
        [self.contentView addSubview:_imgV_header];
        [_imgV_header mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.height.mas_equalTo(XBUniversalCell_float_headerCellHeaderWidth);
            make.right.equalTo(self.imgV_rightIcon.mas_left).offset(- XBUniversalCell_float_subTitleSpaceToRightIcon);
            make.width.equalTo(self->_imgV_header.mas_height);
        }];
    }
    return _imgV_header;
}

@end
