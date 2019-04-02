//
//  QuotationModel.h
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseModel.h"

@interface QuotationModel : BaseModel

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * detailTitle;
@property (nonatomic, copy) NSString * amount;
@property (nonatomic, copy) NSString * amountColor;
@property (nonatomic, copy) NSString * percent;
@property (nonatomic, copy) NSString * percentColor;

+ (instancetype)quotationWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
