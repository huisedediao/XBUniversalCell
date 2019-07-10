//
//  XBUniversalCell_title_subTitle.m
//  d11
//
//  Created by xxb on 2017/9/8.
//  Copyright © 2017年 DreamCatcher. All rights reserved.
//

#import "XBUniversalCell_title_subTitle.h"
#import "Masonry.h"
#import "XBUniversalCell_header.h"

@implementation XBUniversalCell_title_subTitle

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
            make.centerY.equalTo(self.contentView);
            make.leading.equalTo(self.contentView).offset(XBUniversalCell_float_leadingSpace);
            make.width.mas_equalTo(ScreenWidth - 2 * XBUniversalCell_float_leadingSpace);
        }];
        
        _lb_title = label;
    }
    return _lb_title;
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
            make.trailing.equalTo(self.lb_title);
        }];
        
        _lb_subTitle = label;
    }
    return _lb_subTitle;
}

@end
