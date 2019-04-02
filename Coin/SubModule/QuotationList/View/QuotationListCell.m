//
//  QuotationListCell.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "QuotationListCell.h"
#import "QuotationModel.h"

@interface QuotationListCell ()

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * detailTitleLabel;
@property (nonatomic, strong) UILabel * amountLabel;
@property (nonatomic, strong) UILabel * percentLabel;

@end

@implementation QuotationListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString * ID = @"quotation";
    QuotationListCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QuotationListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    self.detailTitleLabel = [[UILabel alloc] init];
    self.detailTitleLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.detailTitleLabel];
    
    self.amountLabel = [[UILabel alloc] init];
    self.amountLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.amountLabel];
    
    self.percentLabel = [[UILabel alloc] init];
    self.percentLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.percentLabel];
    
    // 实现masonry水平固定间隔方法
    NSArray * masonryViewArray = @[self.titleLabel, self.amountLabel, self.percentLabel];
    [masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:kCommonMargin leadSpacing:kCommonMargin tailSpacing:kCommonMargin];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kCommonMargin);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-2);
        make.height.equalTo(@13);
    }];
    
    [self.detailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kCommonMargin);
        make.top.equalTo(self.contentView.mas_centerY).offset(2);
        make.height.equalTo(@11);
        make.width.equalTo(self.titleLabel);
    }];
    
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(kCommonMargin);
        make.top.height.equalTo(self.contentView);
    }];
    
    [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kCommonMargin);
        make.top.height.equalTo(self.contentView);
    }];
}

- (void)setQuotationData:(QuotationModel *)quotationData {
    _quotationData = quotationData;
    
    self.titleLabel.text = quotationData.title;;
    self.detailTitleLabel.text = quotationData.detailTitle;
    self.amountLabel.text = quotationData.amount;
    self.amountLabel.textColor = [self getColorWithColorString:quotationData.amountColor];
    self.percentLabel.text = quotationData.percent;
    self.percentLabel.textColor = [self getColorWithColorString:quotationData.percentColor];
}

- (UIColor *)getColorWithColorString:(NSString *)colorString {
    UIColor * color = [UIColor blackColor];
    if ([colorString isEqualToString:@"red"]) {
        color = [UIColor redColor];
    } else if ([colorString isEqualToString:@"green"]) {
        color = [UIColor greenColor];
    }
    return color;
}

@end
