//
//  QuotationTableHeader.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/16.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "QuotationTableHeader.h"

@interface QuotationTableHeader ()

@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * middleView;
@property (nonatomic, strong) UIView * rightView;

@property (nonatomic, strong) UILabel * leftNameLabel;
@property (nonatomic, strong) UILabel * leftAmountLabel;
@property (nonatomic, strong) UILabel * leftLabel1;
@property (nonatomic, strong) UILabel * leftLabel2;

@property (nonatomic, strong) UILabel * middleNameLabel;
@property (nonatomic, strong) UILabel * middleAmountLabel;
@property (nonatomic, strong) UILabel * middleLabel1;
@property (nonatomic, strong) UILabel * middleLabel2;

@property (nonatomic, strong) UILabel * rightNameLabel;
@property (nonatomic, strong) UILabel * rightAmountLabel;
@property (nonatomic, strong) UILabel * rightLabel1;
@property (nonatomic, strong) UILabel * rightLabel2;

@end

@implementation QuotationTableHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kWhiteColor;
        [self buildUI];
        self.data = nil;
    }
    return self;
}

- (void)buildUI {

    [self addSubview:self.leftView];
    [self addSubview:self.middleView];
    [self addSubview:self.rightView];
    
    UIView * leftLineView = [[UIView alloc] init];
    leftLineView.backgroundColor = kLineColor1;
    [self addSubview:leftLineView];
    
    UIView * rightLineView = [[UIView alloc] init];
    rightLineView.backgroundColor = kLineColor1;
    [self addSubview:rightLineView];

    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.height.equalTo(self);
        make.width.equalTo(self).multipliedBy(1.0 / 3.0);
    }];
    
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@[self.leftView, self.rightView]);
        make.top.height.equalTo(self);
        make.left.equalTo(self.leftView.mas_right);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self);
        make.left.equalTo(self.middleView.mas_right);
    }];
    
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self).offset(-2 * kCommonMargin);
        make.top.equalTo(self).offset(kCommonMargin);
        make.width.equalTo(@[@(kLineThick), rightLineView]);
        make.left.equalTo(self.leftView.mas_right);
    }];
    
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.top.equalTo(leftLineView);
        make.left.equalTo(self.middleView.mas_right);
    }];
}

- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        
        self.leftNameLabel = [self createNameLabel];
        [_leftView addSubview:self.leftNameLabel];
        
        self.leftAmountLabel = [self createAmountLabel];
        [_leftView addSubview:self.leftAmountLabel];
        
        self.leftLabel1 = [self createLeftBottomLabel];
        [_leftView addSubview:self.leftLabel1];
        
        self.leftLabel2 = [self createRightBottomLabel];
        [_leftView addSubview:self.leftLabel2];
        
        [self makeConstraintsWithTop:self.leftNameLabel middle:self.leftAmountLabel left:self.leftLabel1 right:self.leftLabel2 parent:_leftView];
    }
    return _leftView;
}

- (UIView *)middleView {
    if (!_middleView) {
        _middleView = [[UIView alloc] init];
        
        self.middleNameLabel = [self createNameLabel];
        [_middleView addSubview:self.middleNameLabel];
        
        self.middleAmountLabel = [self createAmountLabel];
        [_middleView addSubview:self.middleAmountLabel];
        
        self.middleLabel1 = [self createLeftBottomLabel];
        [_middleView addSubview:self.middleLabel1];
        
        self.middleLabel2 = [self createRightBottomLabel];
        [_middleView addSubview:self.middleLabel2];
        
        [self makeConstraintsWithTop:self.middleNameLabel middle:self.middleAmountLabel left:self.middleLabel1 right:self.middleLabel2 parent:_middleView];
    }
    return _middleView;
}

- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        
        self.rightNameLabel = [self createNameLabel];
        [_rightView addSubview:self.rightNameLabel];
        
        self.rightAmountLabel = [self createAmountLabel];
        [_rightView addSubview:self.rightAmountLabel];
        
        self.rightLabel1 = [self createLeftBottomLabel];
        [_rightView addSubview:self.rightLabel1];
        
        self.rightLabel2 = [self createRightBottomLabel];
        [_rightView addSubview:self.rightLabel2];
        
        [self makeConstraintsWithTop:self.rightNameLabel middle:self.rightAmountLabel left:self.rightLabel1 right:self.rightLabel2 parent:_rightView];
    }
    return _rightView;
}

- (void)makeConstraintsWithTop:(UIView *)top middle:(UIView *)middle left:(UIView *)left right:(UIView *)right parent:(UIView *)parent {
    [top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.top.left.equalTo(parent);
        make.height.equalTo(parent).multipliedBy(1.0 / 3.0);
    }];
    
    [middle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.equalTo(parent);
        make.height.equalTo(parent).multipliedBy(1.0 / 3.0);
        make.top.equalTo(top.mas_bottom);
    }];
    
    [@[left, right] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:5 tailSpacing:5];
    
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(parent).multipliedBy(1.0 / 3.0);
        make.top.equalTo(middle.mas_bottom);
    }];
    
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(parent).multipliedBy(1.0 / 3.0);
        make.top.equalTo(middle.mas_bottom);
    }];
}

- (UILabel *)createNameLabel {
    UILabel * label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    return label;
}

- (UILabel *)createAmountLabel {
    UILabel * label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    return label;
}

- (UILabel *)createLeftBottomLabel {
    UILabel * label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:11];
    return label;
}

- (UILabel *)createRightBottomLabel {
    UILabel * label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:11];
    return label;
}


- (void)setData:(id)data {
    _data = data;
    _leftNameLabel.text = @"BTC";
    _leftAmountLabel.text = @"¥123456.55";
    _leftLabel1.text = @"-1828.34";
    _leftLabel2.text = @"-2.97%";
    
    _middleNameLabel.text = @"ETH";
    _middleAmountLabel.text = @"¥123456.55";
    _middleLabel1.text = @"-1828.34";
    _middleLabel2.text = @"-2.97%";
    
    _rightNameLabel.text = @"BCH";
    _rightAmountLabel.text = @"¥123456.55";
    _rightLabel1.text = @"-1828.34";
    _rightLabel2.text = @"-2.97%";
}

@end
