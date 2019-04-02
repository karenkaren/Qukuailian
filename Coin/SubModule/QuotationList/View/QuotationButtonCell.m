//
//  QuotationButtonCell.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/18.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "QuotationButtonCell.h"

@interface QuotationButtonCell ()

@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;

@end

@implementation QuotationButtonCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString * ID = @"quotationButton";
    QuotationButtonCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QuotationButtonCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = kWhiteColor;
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.leftButton = [self createButtonWithImageName:@"pig" title:@"资金流向"];
    [self.leftButton addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.leftButton];
    
    self.rightButton = [self createButtonWithImageName:@"brick" title:@"短线精灵"];
    [self.rightButton addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.rightButton];
    
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor = kLineColor1;
    [self addSubview:lineView];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView).multipliedBy(1.0 / 2.0);
        make.top.left.height.equalTo(self.contentView);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.leftButton);
        make.top.height.equalTo(self.contentView);
        make.left.equalTo(self.leftButton.mas_right);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kLineThick));
        make.height.equalTo(self.contentView).offset(-2 * kCommonMargin);
        make.left.equalTo(self.leftButton.mas_right);
        make.top.equalTo(self.contentView).offset(kCommonMargin);
    }];
}

- (UIButton *)createButtonWithImageName:(NSString *)imageName title:(NSString *)title {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setTitleColor:kNeuterColor8 forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居
    
    return button;
}

- (void)clickLeftButton:(UIButton *)btn {
    debugLog(@"资金流向");
    if (self.delegate && [self.delegate respondsToSelector:@selector(buttonCellDidClickedLeft:)]) {
        [self.delegate buttonCellDidClickedLeft:btn];
    }
}

- (void)clickRightButton:(UIButton *)btn {
    debugLog(@"短线精灵");
    if (self.delegate && [self.delegate respondsToSelector:@selector(buttonCellDidClickedRight:)]) {
        [self.delegate buttonCellDidClickedRight:btn];
    }
}

@end
