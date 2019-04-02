//
//  BaseNavigationViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/2/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "Category.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([self.topViewController isKindOfClass:[viewController class]]) {
        return;
    }
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
