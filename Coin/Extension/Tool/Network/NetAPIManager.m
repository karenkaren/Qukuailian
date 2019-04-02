//
//  NetAPIManager.m
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "NetAPIManager.h"
#import "GlobalManager.h"
#import "UIDevice+Info.h"

//#define kNetworkMethodName @[@"Get", @"Post"]

static NetAPIManager * _shareManager;

@implementation NetAPIManager

static NSString * pathKey(NSString *path, NSDictionary *parameters) {
    if(parameters){
        return [path stringByAppendingFormat:@"?%@", AFQueryStringFromParameters(parameters)];
    }
    return path;
}
    
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[NetAPIManager alloc] init];
        _shareManager.requestSerializer.timeoutInterval = 10;
        _shareManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", @"multipart/form-data", @"image/jpeg", @"image/png", nil];
    });
    return _shareManager;
}
    
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
               block:(APIResultBlock)block {
    [self postWithPath:path params:params autoShowError:YES block:block];
}
    
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
       autoShowError:(BOOL)autoShowError
               block:(APIResultBlock)block {
    path = esString(path);
    if (!path || path.length <= 0) {
        return;
    }

    // log请求数据
    debugLog(@"\n===========post===========\n%@:\n%@", [NSString netAbsolutePath:path], params);
    
    // 封装基础参数
    params = [self configParameters:params.mutableCopy];
    
    // 发起请求
    [[NetAPIManager shared] POST:[NSString netAbsolutePath:path] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        debugLog(@"\n===========response===========\n%@:\n%@", [NSString netAbsolutePath:path], responseObject);
        id error = [self handleResponse:responseObject autoShowError:autoShowError];
        if (block) {
            if (error) {
                block(nil, error);
            } else {
                block(responseObject, nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        debugLog(@"\n===========response===========\n%@:\n%@", [NSString netAbsolutePath:path], error.localizedDescription);
        if (autoShowError) {
            [NSObject showError:error];
        }
        if (block) {
            block(nil, error);
        }
    }];
}
    
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
              block:(APIResultBlock)block {
    [self getWithPath:path params:params autoShowError:YES block:block];
}
    
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
      autoShowError:(BOOL)autoShowError
              block:(APIResultBlock)block {
    path = esString(path);
    if (!path || path.length <= 0) {
        return;
    }

    // log请求数据
    debugLog(@"\n===========post===========\n%@:\n%@", [NSString netAbsolutePath:path], params);
    
    // 封装基础参数
    params = [self configParameters:params.mutableCopy];
    
    // 发起请求
    // 根据需求，部分Get请求需要增加缓存机制
    NSMutableString * localPath;
    NSArray * cachePaths = [APIUrlConstants getCachePaths];
    if ([cachePaths containsObject:path]) {
        localPath = [NSString netAbsolutePath:path].mutableCopy;
        if (params) {
            [localPath appendString:params.description];
        }
    }
    [[NetAPIManager shared] GET:[NSString netAbsolutePath:path] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        debugLog(@"\n===========response===========\n%@:\n%@", [NSString netAbsolutePath:path], responseObject);
        NSError * error = [self handleResponse:responseObject autoShowError:autoShowError];
        if (error) {
            responseObject = [NSObject loadResponseWithPath:pathKey(localPath, params)];
            if (block) {
                block(responseObject, error);
            }
        } else {
            // 如果需要缓存，则缓存
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                [NSObject saveResponseData:responseObject toPath:pathKey(localPath, params)];
            }
            if (block) {
                block(responseObject, nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        debugLog(@"\n===========response===========\n%@:\n%@", [NSString netAbsolutePath:path], error.localizedDescription);
        if (autoShowError) {
            [NSObject showError:error];
        }
        id responseObject = [NSObject loadResponseWithPath:pathKey(localPath, params)];
        if (block) {
            block(responseObject, error);
        }
    }];
}
    
+ (NSMutableDictionary *)configParameters:(NSMutableDictionary *)parameters {
    if (!parameters) {
        parameters = [NSMutableDictionary dictionary];
    }

    // 基础参数
    /*
     String appVersion 版本号
     String systemType  系统类型 “android” “ios”
     String systemVersion 系统版本
     String deviceModel 设备型号
     */
    [parameters setValue:[GlobalManager appVersion] forKey:@"appVersion"];
    [parameters setValue:@"ios" forKey:@"systemType"];
    [parameters setValue:[UIDevice systemVersion] forKey:@"systemVersion"];
    [parameters setValue:[UIDevice deviceModel] forKey:@"deviceModel"];
    
    return parameters;
}

+ (void)downloadFileWithPath:(NSString *)path
                      params:(NSDictionary *)params
                       block:(APIResultBlock)block {
    path = esString(path);
    if (!path || path.length <= 0) {
        return;
    }
    
    // log请求数据
    debugLog(@"\n===========post===========\n%@:\n%@", [NSString netAbsolutePath:path], params);
    
    // 封装基础参数
    params = [self configParameters:params.mutableCopy];
    
    // 发起请求
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    [[NetAPIManager shared] downloadTaskWithRequest:request progress:nil destination:nil completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            if (block) {
                block(nil, error);
            }
        } else {
            NSError * error = [self handleResponse:response autoShowError:NO];
            if (error) {
                if (block) {
                    block(response, error);
                }
            } else {
                if (block) {
                    block(response, nil);
                }
            }
        }
    }];
}

@end
