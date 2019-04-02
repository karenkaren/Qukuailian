//
//  BaseViewController.h
//  Coin
//
//  Created by LiuFeiFei on 2018/2/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationViewController.h"

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL showCloseButton;
@property (nonatomic, assign) BaseNavigationViewController * baseNavigationController;

@end
