//
//  ValueJudge.h
//  Coin
//
//  Created by LiuFeiFei on 2018/3/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValueJudge : NSObject

@end

NSString * esString(id obj);
NSInteger esInteger(id obj);
BOOL esBool(id obj);
BOOL isDictionary(id obj);
BOOL isArray(id obj);

BOOL ESIntVal(int *var, id obj);
BOOL ESUIntVal(unsigned int *var, id obj);
BOOL ESIntegerVal(NSInteger *var, id obj);
BOOL ESUIntegerVal(NSUInteger *var, id obj);
BOOL ESLongVal(long *var, id obj);
BOOL ESULongVal(unsigned long *var, id obj);
BOOL ESLongLongVal(long long *var, id obj);
BOOL ESULongLongVal(unsigned long long *var, id obj);
BOOL ESFloatVal(float *var, id obj);
BOOL ESDoubleVal(double *var, id obj);
/**
 * If #obj is a NSString instance, returns YES on encountering one of "Y",
 * "y", "T", "t", or a digit 1-9. It ignores any trailing characters.
 */
BOOL ESBoolVal(BOOL *var, id obj);
BOOL ESStringVal(NSString **var, id obj);
BOOL ESURLVal(NSURL **var, id obj);
