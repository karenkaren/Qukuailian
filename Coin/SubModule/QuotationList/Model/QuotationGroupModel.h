//
//  QuotationGroupModel.h
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseModel.h"

@interface QuotationGroupModel : BaseModel

@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) NSArray * quotations;
@property (nonatomic, assign, getter = isOpened) BOOL opened;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
