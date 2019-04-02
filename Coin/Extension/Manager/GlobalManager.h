//
//  GlobalManager.h
//  Coin
//
//  Created by LiuFeiFei on 2018/3/27.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;

@interface GlobalManager : NSObject

+ (AppDelegate *)appDelegate;
+ (UIViewController *)appRootViewController;
+ (UIWindow *)mainWindow;
+ (UIWindow *)keyWindow;

/**
 *  app版本号
 */
+ (NSString *)appVersion;
/**
 *  app build号
 */
+ (NSString *)buildVersion;
/**
 *  app名称
 */
+ (NSString *)displayName;
/**
 *  appstore下载链接
 */
+ (NSString *)appDownloadUrl;

#pragma mark - 是否为第一次加载
+ (BOOL)isFreshLaunch;
#pragma mark - 初始设置
+ (void)globleSetting;
#pragma mark - 清空cookies
+ (void)deleteAllHTTPCookies;

@end
