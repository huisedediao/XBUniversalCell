//
//  XBUniversalCell_title_edit.h
//  D11Module
//
//  Created by xxb on 2017/7/22.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBUniversalCell_textField.h"
#import "xbuniversalcell_header.h"

@interface XBUniversalCell_title_edit : UITableViewCell
@property (nonatomic,strong) XBUniversalCell_textField *tf_title;
@property (nonatomic,assign) int i_maxTextLen;
@property (nonatomic,copy) XBUniversalCellTfEndEditBlock bl_textFieldDidEndEdit;
@property (nonatomic,copy) XBUniversalCellTfBeginEditBlock bl_textFieldBeginEdit;
@end
