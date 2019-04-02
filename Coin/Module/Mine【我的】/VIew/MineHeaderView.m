//
//  MineHeaderView.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UIButton * vertifyButton;

@end

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kWhiteColor;
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"904"]];
    [self addSubview:self.iconImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:13];
    self.nameLabel.text = @"1******@qq.com";
    [self.nameLabel sizeToFit];
    [self addSubview:self.nameLabel];
    
    self.vertifyButton = [[UIButton alloc] init];
    self.vertifyButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.vertifyButton setTitleColor:kNeuterColor8 forState:UIControlStateNormal];
    [self.vertifyButton setTitle:@"未验证，点击获取验证邮箱" forState:UIControlStateNormal];
    [self.vertifyButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.vertifyButton sizeToFit];
    [self addSubview:self.vertifyButton];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@40);
        make.left.equalTo(@(kCommonMargin));
        make.centerY.equalTo(self);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.bottom.equalTo(self.mas_centerY);
    }];
    
    [self.vertifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.top.equalTo(self.mas_centerY);
    }];
}

- (void)click:(UIButton *)btn {
    debugLog(@"点击按钮");
}

@end
