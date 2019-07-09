//
//  XBUniversalCell_Header_block.h
//  aw1_plus
//
//  Created by xxb on 2018/5/5.
//  Copyright © 2018年 sven. All rights reserved.
//

#ifndef XBUniversalCell_Header_block_h
#define XBUniversalCell_Header_block_h

typedef void (^XBUniversalCellSwitchBlock) (UITableViewCell *cell);

typedef void (^XBUniversalCellSelectStatusDidChangeBlock)(UITableViewCell *cell);

typedef void (^XBUniversalCellTfEndEditBlock)(UITableViewCell *cell,NSString *text);

typedef void (^XBUniversalCellTfBeginEditBlock)(UITableViewCell *cell,NSString *text);

#endif /* XBUniversalCell_Header_block_h */
