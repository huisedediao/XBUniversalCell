//
//  XBUniversalCell_Header_color.h
//  aw1_plus
//
//  Created by xxb on 2018/5/5.
//  Copyright © 2018年 sven. All rights reserved.
//

#ifndef XBUniversalCell_Header_color_h
#define XBUniversalCell_Header_color_h

//RGB颜色
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define XBUniversalCell_color_btnBG                                     ColorRGBA(241, 174, 76, 1)
#define XBUniversalCell_color_white                                     [UIColor whiteColor]
#define XBUniversalCell_color_blue                                      XBUniversalCell_color_btnBG
#define XBUniversalCell_color_dark                                      ColorRGBA(127, 127, 127, 1)
#define XBUniversalCell_color_dark_text                                 ColorRGBA(36, 42, 63, 1)
#define XBUniversalCell_color_text_disable                              ColorRGBA(179, 179, 179, 1)


#define XBUniversalCell_color_title     XBUniversalCell_color_dark_text
#define XBUniversalCell_color_subTitle  XBUniversalCell_color_text_disable

#endif /* XBUniversalCell_Header_color_h */
