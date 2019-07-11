//
//  XBUniversalCell_header.h
//  WDB80
//
//  Created by xxb on 2019/1/7.
//  Copyright © 2019年 DreamCatcher. All rights reserved.
//

#ifndef XBUniversalCell_header_h
#define XBUniversalCell_header_h

#import "XBUniversalCell_Header_color.h"
#import "XBUniversalCell_Header_image.h"
#import "XBUniversalCell_Header_text.h"
#import "XBUniversalCell_Header_number.h"
#import "XBUniversalCell_Header_block.h"
#import "XBUniversalCell_Header_notice.h"
#import "XBUniversalCell_Header_key.h"
#import "XBUniversalCell_Header_enum.h"
#import "XBUniversalCell_header_font.h"


#define WEAK_SELF __typeof(self) __weak weakSelf = self;


#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b)        RGBA(r, g, b, 1.0)


#define PNGIMAGE(NAME)      [UIImage imageNamed:NAME]



//根据传入的文字、宽度和字体计算出合适的size (CGSize)
#define getAdjustSizeWith_text_width_font(text,width,font) ({[text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :font} context:NULL].size;})

//根据传入的文字和字体获取宽度 (CGFloat)
#define getWidthWith_title_font(title,font) ({\
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];\
label.text = title;\
label.font = font;\
[label sizeToFit];\
label.frame.size.width;\
})



//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


//======================================== font ========================================

#define XB_Font_Text(x)                                    [UIFont systemFontOfSize:x]//

//屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define XBConsultHeight 568.0
#define XBConsultWidth 320.0

#define XBScreenCondition(x) ((kScreenHeight == x) || (kScreenWidth == x))

#define isIpadScreen (XBScreenCondition(480.0) ? YES : NO)
#define isIphone5Screen (XBScreenCondition(568.0) ? YES : NO)
#define isIphone6Screen (XBScreenCondition(667.0) ? YES : NO)
#define isIphone6PScreen (XBScreenCondition(736.0) ? YES : NO)
#define isIphoneXScreen (XBScreenCondition(812.0) ? YES : NO)
#define isIphoneXScreen (XBScreenCondition(812.0) ? YES : NO)
#define isIphoneXROrXSMAXScreen (XBScreenCondition(896.0) ? YES : NO)

#define XBWidthFactor (MIN(kScreenWidth, kScreenHeight)/XBConsultWidth)
#define XBHeightFactor \
({\
CGFloat result = XBConsultHeight;\
if (isIphoneXScreen)\
{\
result = 667/XBConsultHeight;\
}\
else if (isIphoneXROrXSMAXScreen)\
{\
result = 736/XBConsultHeight;\
}\
else if (isIpadScreen)\
{\
result = 568/XBConsultHeight;\
}\
else\
{\
result = MAX(kScreenWidth, kScreenHeight)/XBConsultHeight;\
}\
result;\
})

#define XBWidthFactorFun(x) (x * XBWidthFactor)
#define XBHeightFactorFun(x) (x * XBHeightFactor)


//======================================== 复用标识 ========================================
#define Reuse_XBUniversalCell_title_rightIcon     @"XBUniversalCell_title_rightIcon"
#define Reuse_XBUniversalCell_title_edit          @"XBUniversalCell_title_edit"
#define Reuse_XBUniversalCell_title_subTitle      @"XBUniversalCell_title_subTitle"
#define Reuse_XBUniversalCell_title_select        @"XBUniversalCell_title_select"
#define Reuse_XBUniversalCell_title_switch        @"XBUniversalCell_title_switch"
#define Reuse_XBUniversalCell_tf_switch           @"XBUniversalCell_tf_switch"
#define Reuse_XBUniversalCell_title_subTitle_rightIcon        @"XBUniversalCell_title_subTitle_rightIcon"
#define Reuse_XBUniversalCell_title_header_rightIcon        @"XBUniversalCell_title_header_rightIcon"
#define Reuse_XBUniversalCell_title_tf        @"XBUniversalCell_title_tf"
#define Reuse_XBUniversalCell_iconTopTitle_subTitle_rightIcon        @"XBUniversalCell_iconTopTitle_subTitle_rightIcon"
#define Reuse_XBUniversalCell_icon_title_subTitle_rightIcon        @"XBUniversalCell_icon_title_subTitle_rightIcon"
#define Reuse_XBUniversalCell_btn_tf        @"Reuse_XBUniversalCell_btn_tf"
#define Reuse_XBUniversalCell_title_tf_btn        @"Reuse_XBUniversalCell_title_tf_btn"



#endif /* XBUniversalCell_header_h */
