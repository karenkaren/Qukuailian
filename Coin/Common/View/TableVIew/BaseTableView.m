//
//  BaseTableView.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
        [self iOS11Adjuest];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self iOS11Adjuest];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initUI];
        [self iOS11Adjuest];
    }
    return self;
}

- (void)initUI
{
    //    self.dataSource = self;
    //    self.delegate = self;
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.separatorColor = kLineColor1;
    self.backgroundColor = kBackgroundColor2;
}

- (void)iOS11Adjuest
{
    //    iOS 11 适配
    if (VERSION_11_0_LATER) {
        [[UITableView appearance] setEstimatedRowHeight:0];
        [[UITableView appearance] setEstimatedSectionFooterHeight:0];
        [[UITableView appearance] setEstimatedSectionHeaderHeight:0];
    }
}


@end
