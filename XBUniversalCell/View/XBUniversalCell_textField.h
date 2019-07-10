//
//  XBUniversalCell_textField.h
//  D11Module
//
//  Created by xxb on 2017/7/18.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBButton.h"


@interface XBUniversalCell_textField : UITextField

@property (nonatomic,strong) XBButton *btn_rightView;

@property (nonatomic,copy) XBActionBlock bl_rightViewClick;

@end
