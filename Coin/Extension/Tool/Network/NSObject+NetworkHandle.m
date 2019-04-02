//
//  NSObject+NetworkHandle.m
//  Coin
//
//  Created by LiuFeiFei on 2018/4/4.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "NSObject+NetworkHandle.h"

@implementation NSObject (NetworkHandle)

#pragma mark - Net Error Handle
- (id)handleResponse:(id)response {
    return [self handleResponse:response autoShowError:YES];
}

- (id)handleResponse:(id)response autoShowError:(BOOL)autoShowError {
    NSError *error = nil;
    //STATUS为1值时，表示无错
    NSInteger errorCode = [(NSNumber *)[response valueForKeyPath:@"STATUS"] integerValue];
    if (errorCode != 1) {
        error = [NSError errorWithDomain:kAppBaseUrl code:errorCode userInfo:response];
        //错误提示
        if (autoShowError) {
            [NSObject showError:error];
        }
    }
    return error;
}

- (BOOL)showError:(NSError *)error {
    NSString * tipStr = [self tipFromError:error];
//    DispatchSyncOnMainThread(^{
        [NSObject showHudTipStr:tipStr];
//    });
    return YES;
}

- (NSString *)tipFromError:(NSError *)error{
    if (error && error.userInfo) {
        NSString * tipStr;
        if ([error.userInfo objectForKey:@"MSG"]) {
            tipStr = esString([error.userInfo objectForKey:@"MSG"]);
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                tipStr = [NSString stringWithFormat:@"ErrorCode%ld", error.code];
            }
        }
        return tipStr;
    }
    return nil;
}

@end
