//
//  NewsInfoModel.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "NewsInfoModel.h"

@implementation NewsInfoModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"央企已经布局区块链应用";
        self.content = @"中国经济由高速增长转向高质量发展，必须依靠创新驱动，而过去加快创新驱动已迫在眉睫。目前，有多久央企布局区块链应用，并取得了突破。";
    }
    return self;
}

@end
