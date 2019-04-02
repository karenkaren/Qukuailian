//
//  NSObject+NetworkHandle.h
//  Coin
//
//  Created by LiuFeiFei on 2018/4/4.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NetworkHandle)

#pragma mark - Net Error Handle
- (id)handleResponse:(id)response;
- (id)handleResponse:(id)response autoShowError:(BOOL)autoShowError;

@end
