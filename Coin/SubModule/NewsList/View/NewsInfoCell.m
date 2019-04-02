//
//  NewsInfoCell.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "NewsInfoCell.h"

@interface NewsInfoCell ()

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIButton * shareButton;

@end

@implementation NewsInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.titleLabel = [[UILabel alloc] init];
//    self.titleLabel.text = ;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
//    self.contentLabel.text = ;
    self.contentLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.contentLabel];
    
    self.shareButton = [[UIButton alloc] init];
    self.shareButton.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.shareButton setImage:[UIImage imageNamed:@"902"] forState:UIControlStateNormal];
    [self.shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [self.shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
//    self.shareButton.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.shareButton];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.width.equalTo(self.contentView).offset(-kCommonMargin * 2);
        make.left.equalTo(self.contentView).offset(kCommonMargin);
        make.height.equalTo(@15);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kCommonMargin);
        make.left.width.equalTo(self.titleLabel);
        make.height.greaterThanOrEqualTo(@13);
    }];
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(kCommonMargin);
        make.right.equalTo(self.contentView).offset(-kCommonMargin);
        make.height.equalTo(@11);
        make.width.equalTo(@80);
    }];
}

- (void)share:(UIButton *)button {
    debugLog(@"分享");
}

- (void)setNewsInfo:(NewsInfoModel *)newsInfo {
    _newsInfo = newsInfo;
    
    self.titleLabel.text = newsInfo.title;
    self.contentLabel.text = newsInfo.content;
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
}

- (CGFloat)getCellHeightWithNews:(NewsInfoModel *)news
{
    self.newsInfo = news;
    return self.shareButton.bottom;
}

@end
