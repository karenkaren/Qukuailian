//
//  LoadingViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载loading页面
    [self showAppLoad];
    // 设置root controller
    [ControllersManager loadRrojectRootController];
}

#pragma mark -- 显示启动页
- (void)showAppLoad {

    UIImageView * backgroundImageView = [[UIImageView alloc] init];
    [self.view addSubview:backgroundImageView];
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIImage *imgBg = [UIImage imageNamed:@"Default-568h.png"];
    if ([[UIScreen mainScreen] bounds].size.height == 480.0f) {
        imgBg = [UIImage imageNamed:@"Default"];
    } else if ([[UIScreen mainScreen] bounds].size.height == 667.0f) {
        imgBg = [UIImage imageNamed:@"Default-667h"];
    } else if ([[UIScreen mainScreen] bounds].size.height == 736.0f) {
        imgBg = [UIImage imageNamed:@"Default-736h"];
    } else if ([[UIScreen mainScreen] bounds].size.height == 812.0f) {
        imgBg = [UIImage imageNamed:@"Default-812h"];
    }
    backgroundImageView.image = imgBg;
}

@end
