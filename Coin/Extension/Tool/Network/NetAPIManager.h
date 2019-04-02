//
//  NetAPIManager.h
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIUrlConstants.h"
#import "Singleton.h"
#import "NSObject+NetworkHandle.h"

@interface NetAPIManager : AFHTTPSessionManager

+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
               block:(APIResultBlock)block;

+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
       autoShowError:(BOOL)autoShowError
               block:(APIResultBlock)block;

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
              block:(APIResultBlock)block;

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
      autoShowError:(BOOL)autoShowError
              block:(APIResultBlock)block;

+ (void)downloadFileWithPath:(NSString *)path
                      params:(NSDictionary *)params
                       block:(APIResultBlock)block;

@end
