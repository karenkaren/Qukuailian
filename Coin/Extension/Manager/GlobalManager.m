//
//  GlobalManager.m
//  Coin
//
//  Created by LiuFeiFei on 2018/3/27.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "GlobalManager.h"
#import "IQKeyboardManager.h"
#import "AppDelegate.h"

@implementation GlobalManager

#pragma mark - 初始设置
+ (void)globleSetting
{
    // 键盘
    [self initIQKeyboardManager];
    // 显示
    [self initializeGlobleApprence];
    // 分享
    //    [self shareSetting];
    // 推送
}

#pragma mark -- 全局显示
+ (void)initializeGlobleApprence
{
    // tab bar
    [[UITabBar appearance] setTintColor:kMainColor];
    [[UITabBar appearance] setBarTintColor:kNeuterColor10];
    
    //navigation bar
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
//    [WRNavigationBar wr_setBlacklist:@[@"SpecialController",
//                                       @"TZPhotoPickerController",
//                                       @"TZGifPhotoPreviewController",
//                                       @"TZAlbumPickerController",
//                                       @"TZPhotoPreviewController",
//                                       @"TZVideoPlayerController"]];
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:kWhiteColor];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:kNeuterColor10];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:kNeuterColor10];
    // 统一设置状态栏样式
//    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:NO];
    
//    NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:[CustomFont boldHeiti:18], NSFontAttributeName, kColor333333,NSForegroundColorAttributeName, nil];
//    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
//    [[UINavigationBar appearance] setBarTintColor:kWhiteColor];
    
    // text field
    [UITextField appearance].tintColor = kNeuterColor10;
}

#pragma mark -- 键盘设置
+ (void)initIQKeyboardManager {
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside     = YES;
    [IQKeyboardManager sharedManager].shouldShowToolbarPlaceholder = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar              = NO;
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField  = 80;
    [IQKeyboardManager sharedManager].enable = YES;
}

#pragma mark - app 相关
+ (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (UIWindow *)mainWindow {
    return [[self appDelegate] window];
}

+ (UIWindow *)keyWindow {
    return [UIApplication sharedApplication].keyWindow;
}

+ (UIViewController *)appRootViewController {
    return [[self mainWindow] rootViewController];
}

+ (NSString *)appVersion {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)buildVersion {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return version;
}

+ (NSString *)displayName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (NSString *)appDownloadUrl {
    // todo:
    return @"";
}

#define kCheckFreshLaunchAppVersion @"CheckFreshLaunchAppVersion"
+ (BOOL)isFreshLaunch {
    static NSString *__previousVersion = nil;
    static BOOL __isFreshLaunch = NO;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __previousVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kCheckFreshLaunchAppVersion];
        NSString *current = [GlobalManager appVersion];
        if (__previousVersion && [__previousVersion compare:current] == NSOrderedSame) {
            __isFreshLaunch = NO;
        } else {
            __isFreshLaunch = YES;
            [[NSUserDefaults standardUserDefaults] setObject:current forKey:kCheckFreshLaunchAppVersion];
        }
    });
    return __isFreshLaunch;
}

+ (void)deleteAllHTTPCookies {
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *c in cookieStorage.cookies) {
        [cookieStorage deleteCookie:c];
    }
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

@end
