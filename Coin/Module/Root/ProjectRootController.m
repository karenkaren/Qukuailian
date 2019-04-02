//
//  ProjectRootController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/2/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "ProjectRootController.h"

#import "BaseNavigationViewController.h"

#import "QuotationViewController.h"
#import "InformationViewController.h"
#import "ProjectViewController.h"
#import "MineViewController.h"


@interface ProjectRootController ()<UITabBarControllerDelegate>

@end

@implementation ProjectRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置代理
    self.delegate = self;
    // 背景色
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:kWhiteColor]];
    // 初始化视图控制器
    [self createControllers];
}

- (void)createControllers {
    
    NSMutableArray * controllers = [NSMutableArray array];

    // 行情
    QuotationViewController * quotationController = [[QuotationViewController alloc] init];
    BaseNavigationViewController * quotationNav = [[BaseNavigationViewController alloc] initWithRootViewController:quotationController];
    [self createItemWithTitle:@"行情"
             defaultImageName:@"tab_normal_quotation"
     defaultSelectedImageName:@"tab_highlight_quotation"
                forController:quotationNav];
    [controllers addObject:quotationNav];
    
    // 资讯
    InformationViewController * informationController = [[InformationViewController alloc] init];
    BaseNavigationViewController * informationNav = [[BaseNavigationViewController alloc] initWithRootViewController:informationController];
    [self createItemWithTitle:@"资讯"
             defaultImageName:@"tab_normal_information"
     defaultSelectedImageName:@"tab_highlight_information"
                forController:informationNav];
    [controllers addObject:informationNav];
    
    // 项目
    ProjectViewController * projectController = [[ProjectViewController alloc] init];
    BaseNavigationViewController * projectNav = [[BaseNavigationViewController alloc] initWithRootViewController:projectController];
    [self createItemWithTitle:@"项目"
             defaultImageName:@"tab_normal_project"
     defaultSelectedImageName:@"tab_highlight_project"
                forController:projectNav];
    [controllers addObject:projectNav];
    
    // 我的
    MineViewController * mineController = [[MineViewController alloc] init];
    BaseNavigationViewController * mineNav = [[BaseNavigationViewController alloc] initWithRootViewController:mineController];
    [self createItemWithTitle:@"我的"
             defaultImageName:@"tab_normal_mine"
     defaultSelectedImageName:@"tab_highlight_mine"
                forController:mineNav];
    [controllers addObject:mineNav];

    self.viewControllers = controllers;
}

- (UITabBarItem *)createItemWithTitle:(NSString *)title defaultImageName:(NSString *)defaultImageName defaultSelectedImageName:(NSString *)defaultSelectedImageName forController:(UIViewController *)controller {
    UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:title
                                                         image:[[UIImage imageNamed:defaultImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                 selectedImage:[[UIImage imageNamed:defaultSelectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    item.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    item.titlePositionAdjustment = UIOffsetMake(0, -5);
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kNeuterColor10} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kMainColor} forState:UIControlStateSelected];
    controller.tabBarItem = item;
    
    return item;
}


@end
