//
//  XBUniversalCell_title_rightIcon.m
//  aw1_plus
//
//  Created by xxb on 2018/5/8.
//  Copyright © 2018年 sven. All rights reserved.
//

#import "XBUniversalCell_title_rightIcon.h"
#import "Masonry.h"
#import "XBUniversalCell_header.h"

@implementation XBUniversalCell_title_rightIcon


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.imgV_rightIcon.backgroundColor = self.imgV_rightIcon.backgroundColor;
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


@end
