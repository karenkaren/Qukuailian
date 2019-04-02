//
//  BaseViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/2/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if ([self.navigationController isKindOfClass:[BaseNavigationViewController class]]) {
        self.baseNavigationController = (BaseNavigationViewController *)self.navigationController;
    }
    
    self.view.backgroundColor = kBackgroundColor2;
    
//    [self showCloseButton:self.showCloseButton];
//    [self showBackButton:!self.showCloseButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
