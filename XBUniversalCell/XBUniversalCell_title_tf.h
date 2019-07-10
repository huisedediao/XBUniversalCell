//
//  XBUniversalCell_title_tf.h
//  TongMeng
//
//  Created by xxb on 2019/1/29.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBUniversalCell_title_tf : UITableViewCell
@property (nonatomic,strong) UILabel *lb_title;
@property (nonatomic,strong) UITextField *tf_content;
@property (nonatomic,copy) void (^bl_endEditing)(NSString *content);
@end

NS_ASSUME_NONNULL_END
