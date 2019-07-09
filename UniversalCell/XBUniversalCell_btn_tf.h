//
//  XBUniversalCell_btn_tf.h
//  XBUniversalCell
//
//  Created by xxb on 2019/2/21.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBUniversalCell_header.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBUniversalCell_btn_tf : UITableViewCell
@property (nonatomic,strong) XBButton *btn_title;
@property (nonatomic,strong) UITextField *tf_content;
@property (nonatomic,copy) void (^bl_endEditing)(NSString *content);
@property (nonatomic,copy) void (^bl_btnClick)(XBButton *btn);
- (void)updateTitleBtnWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
