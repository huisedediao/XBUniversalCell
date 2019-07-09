//
//  XBUniversalCell_title_switch.h
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBUniversalCell_header.h"

@interface XBUniversalCell_title_switch : UITableViewCell

@property (nonatomic,strong) UILabel *lb_title;
@property (nonatomic,copy) XBUniversalCellSwitchBlock bl_switch;

@property (nonatomic,assign) BOOL isOn;
@end
