//
//  APIUrlConstants.h
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <Foundation/Foundation.h>

//界面管理
extern NSString * const kInterfaceManagerUrl;
// 获取白名单、开关等数据
extern NSString * const  kInterfaceManagerOtherUrl;
// 获取tab bar 数组
extern NSString * const  kInterfaceManagerTabArrayUrl;

@interface APIUrlConstants : NSObject

+ (NSArray *)getCachePaths;
    
@end
