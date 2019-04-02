//
//  BaseModel.m
//  Coin
//
//  Created by LiuFeiFei on 2018/4/2.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}
    
@end
 
