//
//  ViewController.m
//  XBMediaTool
//
//  Created by xxb on 2018/12/3.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBUniversalCell_title_subTitle.h"
#import "XBUniversalCell_title_rightIcon.h"
#import "XBUniversalCell_title_edit.h"
#import "XBUniversalCell_title_subTitle_rightIcon.h"
#import "XBUniversalCell_title_select.h"
#import "XBUniversalCell_title_switch.h"
#import "XBUniversalCell_textField.h"
#import "XBUniversalCell_tf_switch.h"
#import "XBUniversalCell_title_header_rightIcon.h"
#import "XBUniversalCell_title_tf.h"
#import "XBUniversalCell_iconTopTitle_subTitle_rightIcon.h"
#import "XBUniversalCell_icon_title_subTitle_rightIcon.h"
#import "XBUniversalCell_btn_tf.h"
#import "XBUniversalCell_title_tf_btn.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tbv_content;
@property (nonatomic,strong) NSArray *arr_dataSource;
@end

@implementation ViewController

//dispatch_source_t _timers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    self.tbv_content = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tbv_content];
    self.tbv_content.delegate = self;
    self.tbv_content.dataSource = self;
    [self.tbv_content registerClass:[XBUniversalCell_title_subTitle class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_subTitle];
    [self.tbv_content registerClass:[XBUniversalCell_title_rightIcon class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_rightIcon];
    [self.tbv_content registerClass:[XBUniversalCell_title_edit class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_edit];
    [self.tbv_content registerClass:[XBUniversalCell_title_subTitle_rightIcon class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_subTitle_rightIcon];
    [self.tbv_content registerClass:[XBUniversalCell_title_select class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_select];
    [self.tbv_content registerClass:[XBUniversalCell_title_switch class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_switch];
    [self.tbv_content registerClass:[XBUniversalCell_tf_switch class] forCellReuseIdentifier:Reuse_XBUniversalCell_tf_switch];
    [self.tbv_content registerClass:[XBUniversalCell_title_header_rightIcon class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_header_rightIcon];
    [self.tbv_content registerClass:[XBUniversalCell_title_tf class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_tf];
    [self.tbv_content registerClass:[XBUniversalCell_iconTopTitle_subTitle_rightIcon class] forCellReuseIdentifier:Reuse_XBUniversalCell_iconTopTitle_subTitle_rightIcon];
    [self.tbv_content registerClass:[XBUniversalCell_icon_title_subTitle_rightIcon class] forCellReuseIdentifier:Reuse_XBUniversalCell_icon_title_subTitle_rightIcon];
    [self.tbv_content registerClass:[XBUniversalCell_btn_tf class] forCellReuseIdentifier:Reuse_XBUniversalCell_btn_tf];
    [self.tbv_content registerClass:[XBUniversalCell_title_tf_btn class] forCellReuseIdentifier:Reuse_XBUniversalCell_title_tf_btn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr_dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    if (index == 0)
    {
        XBUniversalCell_title_subTitle *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_subTitle];
        cell.lb_title.text = self.arr_dataSource[index];
        return cell;
    }
    else if (index == 1)
    {
        XBUniversalCell_title_rightIcon *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_rightIcon];
        cell.lb_title.text = self.arr_dataSource[index];
        return cell;
    }
    else if (index == 2)
    {
        XBUniversalCell_title_edit *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_edit];
        cell.tf_title.text = self.arr_dataSource[index];
        cell.bl_textFieldDidEndEdit = ^(UITableViewCell *cell, NSString *text) {
            NSLog(@"XBUniversalCell_title_edit end edit");
        };
        return cell;
    }
    else if (index == 3)
    {
        XBUniversalCell_title_subTitle_rightIcon *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_subTitle_rightIcon];
        cell.lb_title.text = self.arr_dataSource[index];
        return cell;
    }
    else if (index == 4)
    {
        XBUniversalCell_title_select *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_select];
        cell.lb_title.text = self.arr_dataSource[index];
        cell.bl_selectStatusChange = ^(UITableViewCell *cell) {
            NSLog(@"XBUniversalCell_title_select select status change");
        };
        return cell;
    }
    else if (index == 5)
    {
        XBUniversalCell_title_switch *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_switch];
        cell.lb_title.text = self.arr_dataSource[index];
        cell.bl_switch = ^(UITableViewCell *cell) {
            NSLog(@"XBUniversalCell_title_switch switch");
        };
        cell.isOn = YES;
        return cell;
    }
    else if (index == 6)
    {
        XBUniversalCell_tf_switch *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_tf_switch];
        cell.tf_title.text = self.arr_dataSource[index];
        cell.bl_switch = ^(UITableViewCell *cell) {
            NSLog(@"XBUniversalCell_tf_switch switch");
        };
        cell.bl_tfEndEdit = ^(UITableViewCell *cell, NSString *text) {
            NSLog(@"XBUniversalCell_tf_switch end edit");
        };
        return cell;
    }
    else if (index == 7)
    {
        XBUniversalCell_title_header_rightIcon *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_header_rightIcon];
        cell.lb_title.text = self.arr_dataSource[index];
        cell.imgV_header.backgroundColor = [UIColor redColor];
        return cell;
    }
    else if (index == 8)
    {
        XBUniversalCell_title_tf *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_tf];
        
        return cell;
    }
    else if (index == 9)
    {
        XBUniversalCell_iconTopTitle_subTitle_rightIcon *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_iconTopTitle_subTitle_rightIcon];
        cell.btn_iconTitle.img_normal = XBUniversalCell_Image_cellRightIcon;
        cell.btn_iconTitle.str_titleNormal = @"title";
        return cell;
    }
    else if (index == 10)
    {
        XBUniversalCell_icon_title_subTitle_rightIcon *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_icon_title_subTitle_rightIcon];
        cell.btn_iconTitle.img_normal = XBUniversalCell_Image_cellRightIcon;
        cell.btn_iconTitle.str_titleNormal = @"title";
        return cell;
    }
    else if (index == 11)
    {
        XBUniversalCell_btn_tf *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_btn_tf];
        return cell;
    }
    else if (index == 12)
    {
        XBUniversalCell_title_tf_btn *cell = [tableView dequeueReusableCellWithIdentifier:Reuse_XBUniversalCell_title_tf_btn];
        return cell;
    }
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return XBUniversalCell_float_headerCellHeight + 10;
//    if (indexPath.row == 8)
//    {
//        return XBUniversalCell_float_headerCellHeight;
//    }
//    return XBUniversalCell_float_cellHeightNor;
}

- (NSArray *)arr_dataSource
{
    if (_arr_dataSource == nil)
    {
        _arr_dataSource = @[@"XBUniversalCell_title_subTitle",
                            @"XBUniversalCell_title_rightIcon",
                            @"XBUniversalCell_title_edit",
                            @"XBUniversalCell_title_subTitle_rightIcon",
                            @"XBUniversalCell_title_select",
                            @"XBUniversalCell_title_switch",
                            @"XBUniversalCell_tf_switch",
                            @"XBUniversalCell_title_header_rightIcon",
                            @"XBUniversalCell_title_tf",
                            @"XBUniversalCell_iconTopTitle_subTitle_rightIcon",
                            @"XBUniversalCell_icon_title_subTitle_rightIcon",
                            @"XBUniversalCell_btn_tf",
                            @"XBUniversalCell_title_tf_btn"];
    }
    return _arr_dataSource;
}


@end
