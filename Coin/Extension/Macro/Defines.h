//
//  Defines.h
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

#pragma mark - 测试宏
#define kAlwaysShowIntroductionGuide YES // 是否总是显示引导页

#pragma mark - 版本判断
#define VERSION_8_0_LATER [[UIDevice currentDevice].systemVersion doubleValue] >= 8.0
#define VERSION_9_0_LATER [[UIDevice currentDevice].systemVersion doubleValue] >= 9.0
#define VERSION_10_0_LATER [[UIDevice currentDevice].systemVersion doubleValue] >= 10.0
#define VERSION_11_0_LATER [[UIDevice currentDevice].systemVersion doubleValue] >= 11.0

#pragma mark - weakSelf、kStrongSelf
#define kWeakSelf __weak typeof (self) weakSelf = self;
#define kStrongSelf __strong __typeof(&*weakSelf)strongSelf = weakSelf;

#pragma mark - 日志输出宏定义
#if defined(ADHOC) || defined(DEBUG)
#define debugLog(...)    NSLog(__VA_ARGS__)
#define debugMethod()    NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#pragma mark - Block
typedef void (^VoidBlock)(void);
typedef void (^ErrorBlock)(NSError *error);
typedef void (^HandlerBlock)(id sender);
typedef void (^APIResultBlock)(id response, NSError *error);
typedef void (^APIResultDataBlock)(id response, id data, NSError *error);

#pragma mark - Dispatch
extern void DispatchSyncOnMainThread(dispatch_block_t block);
extern void DispatchAsyncOnMainThread(dispatch_block_t block);
extern void DispatchOnGlobalQueue(dispatch_queue_priority_t priority, dispatch_block_t block);
extern void DispatchOnDefaultQueue(dispatch_block_t block);
extern void DispatchOnHighQueue(dispatch_block_t block);
extern void DispatchOnLowQueue(dispatch_block_t block);
extern void DispatchOnBackgroundQueue(dispatch_block_t block);
/** After `delayTime`, dispatch `block` on the main thread. */
extern void DispatchAfter(NSTimeInterval delayTime, dispatch_block_t block);

#endif /* Defines_h */
