//
//  Singleton.h
//  LingTouNiaoZF
//
//  Created by LiuFeifei on 16/10/24.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

///**
// *  在.h文件中定义的宏，arc
// *
// *  singleton_interface(className) 这个是宏
// *  + (instancetype)shared##className;这个是被代替的方法， ##代表着shared+name 高度定制化
// *  在外边我们使用 “singleton_interface(gege)” 那么在.h文件中，定义了一个方法"+ (instancetype)sharedgege",所以，第一个字母要大写
// *
// *  @return 一个搞定好的方法名
// */
//#define singleton_interface(className) + (className *)shared;
//
//
///**
// *  在.m文件中处理好的宏 arc
// *
// *  singleton_implementation(className) 这个是宏,因为是多行的东西，所以每行后面都有一个"\",最后一行除外，
// * 之所以还要传递一个“className”,是因为有个方法要命名"+ (instancetype)shared##className"
// *  @return 单例
// */
//#define singleton_implementation(className) \
//static id _instance;  \
//+ (id)shared  \
//{   \
//if (_instance == nil) { \
//_instance = [[self alloc] init];    \
//}   \
//return _instance;   \
//}   \
//+ (instancetype)allocWithZone:(struct _NSZone *)zone  \
//{   \
//static dispatch_once_t once;    \
//dispatch_once(&once, ^{ \
//_instance = [super allocWithZone:zone]; \
//}); \
//return _instance;   \
//}   \
//- (instancetype)copyWithZone:(NSZone *)zone{  \
//return _instance;   \
//}

#define singleton_interface(className) + (className *)shared;
#define singleton_implementation(className) \
+ (instancetype)shared  \
{   \
    id instance = objc_getAssociatedObject(self, className);  \
    \
    if (!instance)  \
    {   \
        instance = [[super allocWithZone:NULL] init];   \
        NSLog(@"单例创建=====%@=====",instance);    \
        objc_setAssociatedObject(self, className, instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);   \
    }   \
    return instance;    \
}   \
+ (instancetype) allocWithZone:(struct _NSZone *)zone  \
{   \
    return [self shared] ;  \
}   \
- (instancetype) copyWithZone:(struct _NSZone *)zone   \
{   \
    Class selfClass = [self class]; \
    return [selfClass shared]; \
}


////定义单例模式类 INTERFACE_SINGLETON(类名)
//#undef  INTERFACE_SINGLETON
//#define INTERFACE_SINGLETON( __class) \
//- (__class *)sharedInstance; \
//+ (__class *)sharedInstance;
//
////实现单例模式类
//#undef  IMPLEMENTATION_SINGLETON
//#define IMPLEMENTATION_SINGLETON( __class) \
//- (__class *)sharedInstance \
//{ \
//return [__class sharedInstance]; \
//} \
//+ (__class *)sharedInstance \
//{ \
//static dispatch_once_t once; \
//static __class * __singleton__; \
//dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
//return __singleton__; \
//} \

#endif /* Singleton_h */
