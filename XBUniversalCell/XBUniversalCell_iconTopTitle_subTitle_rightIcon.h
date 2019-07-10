//
//  XBUniversalCell_iconTopTitle_subTitle_rightIcon.h
//  TongMeng
//
//  Created by 谢贤彬 on 2019/1/24.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XBButton;

@interface XBUniversalCell_iconTopTitle_subTitle_rightIcon : UITableViewCell
@property (nonatomic,strong) XBButton *btn_iconTitle;
@property (nonatomic,strong) UILabel *lb_subTitle;
@property (nonatomic,strong) UIImageView *imgV_rightIcon;
@end

NS_ASSUME_NONNULL_END
