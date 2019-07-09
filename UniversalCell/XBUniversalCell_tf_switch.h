//
//  XBUniversalCell_tf_switch.h
//  aw1_plus
//
//  Created by xxb on 2018/5/29.
//  Copyright © 2018年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBUniversalCell_header.h"

@class XBUniversalCell_tf_switch;

@interface XBUniversalCell_tf_switch : UITableViewCell

@property (nonatomic,strong) UITextField *tf_title;
@property (nonatomic,copy) XBUniversalCellSwitchBlock bl_switch;
@property (nonatomic,copy) XBUniversalCellTfEndEditBlock bl_tfEndEdit;

@property (nonatomic,assign) BOOL isOn;
@end
