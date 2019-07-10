//
//  XBUniversalCell_iconTopTitle_subTitle_rightIcon.m
//  TongMeng
//
//  Created by 谢贤彬 on 2019/1/24.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBUniversalCell_iconTopTitle_subTitle_rightIcon.h"
#import "XBUniversalCell_header.h"
#import "Masonry.h"
#import "XBButton.h"

@implementation XBUniversalCell_iconTopTitle_subTitle_rightIcon

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
    self.btn_iconTitle = ({
        XBButton *btn = [XBButton new];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(GWidthFactorFun(100));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(0);
        }];
        btn.size_image = CGSizeMake(GWidthFactorFun(30), GWidthFactorFun(30));
        btn.enum_contentType = XBBtnTypeImageTop;
        btn.font_title = XBUniversalCell_font_iconTitleText;
        btn.color_titleNormal = XBUniversalCell_color_dark_text;
        btn.userInteractionEnabled = NO;
        btn;
    });
    
    self.imgV_rightIcon.backgroundColor = self.imgV_rightIcon.backgroundColor;
    self.lb_subTitle.backgroundColor = self.lb_subTitle.backgroundColor;
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
            make.right.equalTo(self.contentView).offset(- XBUniversalCell_float_leadingSpace);
            make.centerY.equalTo(self.contentView);
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
        
        label.textColor = XBUniversalCell_color_text_disable;
        label.font = XBUniversalCell_font_subTitle;
        label.text = @"subTitle";
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imgV_rightIcon);
            make.right.equalTo(self.imgV_rightIcon.mas_left).offset(- XBUniversalCell_float_subTitleSpaceToRightIcon);
        }];
        
        _lb_subTitle = label;
    }
    return _lb_subTitle;
}

@end
