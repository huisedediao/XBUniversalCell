//
//  XBUniversalCell_title_tf_btn.h
//  XBUniversalCell
//
//  Created by xxb on 2019/2/21.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBUniversalCell_header.h"

@class XBButton;
NS_ASSUME_NONNULL_BEGIN

@interface XBUniversalCell_title_tf_btn : UITableViewCell
@property (nonatomic,strong) UILabel *lb_title;
@property (nonatomic,strong) UITextField *tf_content;
@property (nonatomic,strong) XBButton *btn_send;
@property (nonatomic,copy) void (^bl_endEditing)(NSString *content);
@property (nonatomic,copy) void (^bl_sendBtnClick)(XBButton *btn);
@property (nonatomic,copy) BOOL (^bl_sendBtnWillDisable)(void);
@end

NS_ASSUME_NONNULL_END
