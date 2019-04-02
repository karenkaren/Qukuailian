//
//  QuotationGroupModel.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "QuotationGroupModel.h"
#import "QuotationModel.h"

@implementation QuotationGroupModel

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray * quotationArray = [NSMutableArray array];
        for (NSDictionary * dict in self.quotations) {
            QuotationModel * quotation = [QuotationModel quotationWithDict:dict];
            [quotationArray addObject:quotation];
        }
        self.quotations = quotationArray;
    }
    return self;
}

@end
