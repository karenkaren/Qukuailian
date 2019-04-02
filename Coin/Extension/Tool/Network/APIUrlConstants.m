//
//  APIUrlConstants.m
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "APIUrlConstants.h"

//界面管理
NSString * const kInterfaceManagerUrl = @"/common/visualmenu.do";
// 获取白名单、开关等数据
NSString * const  kInterfaceManagerOtherUrl = @"common/visualmenufunctionlist.do";
// 获取tab bar 数组
NSString * const  kInterfaceManagerTabArrayUrl = @"common/visualmenumodule.do";

@implementation APIUrlConstants

+ (NSArray *)getCachePaths {
    NSArray * cachePaths = @[@""];
    return cachePaths;
}
    
@end
