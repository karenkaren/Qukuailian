//
//  ControllersManager.m
//  Coin
//
//  Created by LiuFeiFei on 2018/4/10.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "ControllersManager.h"
#import "ProjectRootController.h"

@implementation ControllersManager

+ (void)loadRrojectRootController {
    ProjectRootController * rootVc = [[ProjectRootController alloc] init];
    [GlobalManager mainWindow].rootViewController = rootVc;
}

@end
