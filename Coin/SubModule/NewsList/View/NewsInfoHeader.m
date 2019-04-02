//
//  NewsInfoHeader.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "NewsInfoHeader.h"

@interface NewsInfoHeader ()

@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation NewsInfoHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    UIImageView * iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"903"]];
    [self addSubview:iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"今天04月25日 星期三";
    [self addSubview:self.titleLabel];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@30);
        make.left.equalTo(@(kCommonMargin));
        make.centerY.equalTo(self);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(5);
        make.height.centerY.equalTo(self);
        make.width.equalTo(@(kScreenWidth - 2 * kCommonMargin - 30 - 5));
    }];
}

@end
