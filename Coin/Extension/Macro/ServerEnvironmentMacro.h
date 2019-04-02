//
//  ServerEnvironmentMacro.h
//  Coin
//
//  Created by LiuFeiFei on 2018/4/4.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#ifndef ServerEnvironmentMacro_h
#define ServerEnvironmentMacro_h

//add the following as we pass the definitions from Makefile
#if !defined BUILD_FOR_UAT && !defined BUILD_FOR_GRAY && !defined BUILD_FOR_RELEASE

//使用测试服务器
#define BUILD_FOR_UAT

//使用灰度服务器
//#define BUILD_FOR_GRAY

//使用生产服务器
//#define BUILD_FOR_RELEASE

#endif

#ifdef BUILD_FOR_UAT

    //测试 域名
    #define kAppBaseUrl             @"https://www.baidu.com"
#endif

#ifdef BUILD_FOR_GRAY
    //测试 域名
    #define kAppBaseUrl             @"https://www.baidu.com"
#endif

#ifdef BUILD_FOR_RELEASE
    //生产 域名
    #define kAppBaseUrl             @"https://www.baidu.com"
#endif

#endif /* ServerEnvironmentMacro_h */
