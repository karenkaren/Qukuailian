//
//  BaseModel.h
//  Coin
//
//  Created by LiuFeiFei on 2018/4/2.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

@interface BaseModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString * STATUS;
@property (nonatomic, copy) NSString * MSG;

@end
