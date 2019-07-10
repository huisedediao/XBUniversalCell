//
//  XBUniversalCell_title_select.h
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xbuniversalcell_header.h"

@class XBButton;

@interface XBUniversalCell_title_select : UITableViewCell
@property (nonatomic,copy) XBUniversalCellSelectStatusDidChangeBlock bl_selectStatusChange;
@property (nonatomic,strong) UILabel *lb_title;
@property (nonatomic,strong) XBButton *btn_select;
@end
