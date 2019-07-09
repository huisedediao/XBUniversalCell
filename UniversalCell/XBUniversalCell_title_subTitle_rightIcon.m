//
//  XBUniversalCell_title_subTitle_rightIcon.m
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "XBUniversalCell_title_subTitle_rightIcon.h"
#import "Masonry.h"
#import "XBUniversalCell_header.h"

@implementation XBUniversalCell_title_subTitle_rightIcon

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.lb_subTitle.backgroundColor = self.lb_subTitle.backgroundColor;
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

- (UILabel *)lb_subTitle
{
    if (_lb_subTitle == nil)
    {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        
        label.textColor = XBUniversalCell_color_subTitle;
        label.font = XBUniversalCell_font_subTitle;
        label.text = @"subTitle";
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lb_title);
            make.trailing.equalTo(self.imgV_rightIcon.mas_leading).offset(- XBUniversalCell_float_subTitleSpaceToRightIcon);
        }];
        
        _lb_subTitle = label;
    }
    return _lb_subTitle;
}

@end
