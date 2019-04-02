//
//  ProjectInfoCell.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/10.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "ProjectInfoCell.h"

@interface ProjectInfoCell ()

@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) UIView * bottomView;

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * companyLabel;
@property (nonatomic, strong) UILabel * companyTypeLabel;
@property (nonatomic, strong) UILabel * levelLabel;
@property (nonatomic, strong) UILabel * deadlineLabel;
@property (nonatomic, strong) UILabel * coinLabel;
@property (nonatomic, strong) UILabel * statusLabel;

@end

@implementation ProjectInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    
    [self.contentView addSubview:self.topView];
    [self.contentView addSubview:self.bottomView];
    
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor = kLineColor1;
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_bottom).multipliedBy(13.0 / 20.0);
        make.width.equalTo(self.contentView).offset(-30);
        make.left.equalTo(self.contentView).offset(15);
        make.height.equalTo(@(1.0 / [UIScreen mainScreen].scale));
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.width.left.equalTo(@[self.contentView, self.bottomView]);
        make.bottom.equalTo(lineView.mas_bottom);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.height.equalTo(self.contentView).multipliedBy(7.0 / 20.0);
    }];
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
//        _topView.backgroundColor = [UIColor greenColor];
        
        self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"901"]];
        [_topView addSubview:self.iconImageView];
        
        self.companyLabel = [[UILabel alloc] init];
        self.companyLabel.text =  @"BitRewards";
        self.companyLabel.font = [UIFont systemFontOfSize:13];
        [_topView addSubview:self.companyLabel];
        
        self.companyTypeLabel = [[UILabel alloc] init];
        self.companyTypeLabel.text =  @"区块链服务";
        self.companyTypeLabel.font = [UIFont systemFontOfSize:11];
        [_topView addSubview:self.companyTypeLabel];
        
        self.levelLabel = [[UILabel alloc] init];
        self.levelLabel.text =  @"评级：中";
        self.levelLabel.font = [UIFont systemFontOfSize:15];
        [_topView addSubview:self.levelLabel];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_topView).offset(15);
            make.centerY.equalTo(_topView);
            make.width.height.equalTo(@40);
        }];
        
        [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(30);
            make.bottom.equalTo(self.iconImageView.mas_centerY).offset(-5);
            make.height.equalTo(@13);
            make.width.equalTo(@100);
        }];
        
        [self.companyTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(30);
            make.top.equalTo(self.iconImageView.mas_centerY).offset(5);
            make.height.equalTo(@11);
            make.width.equalTo(@100);
        }];
        
        [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_topView.mas_right).offset(-15);
            make.centerY.equalTo(self.iconImageView.mas_centerY);
            make.height.equalTo(@15);
            make.width.equalTo(@80);
        }];
    }
    return _topView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
//        _bottomView.backgroundColor = [UIColor blueColor];
        
        self.deadlineLabel = [[UILabel alloc] init];
        self.deadlineLabel.text =  @"截止：26d left";
        self.deadlineLabel.font = [UIFont systemFontOfSize:11];
        [_bottomView addSubview:self.deadlineLabel];
        
        self.coinLabel = [[UILabel alloc] init];
        self.coinLabel.textAlignment = NSTextAlignmentRight;
        self.coinLabel.text =  @"$15,000,000/$25,000,000";
        self.coinLabel.font = [UIFont systemFontOfSize:11];
        [_bottomView addSubview:self.coinLabel];
        
        self.statusLabel = [[UILabel alloc] init];
        self.statusLabel.text =  @"暂无";
        self.statusLabel.font = [UIFont systemFontOfSize:11];
        [_bottomView addSubview:self.statusLabel];
        
        [self.deadlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bottomView).offset(15);
            make.centerY.height.equalTo(_bottomView);
            make.width.equalTo(@100);
        }];
        
        [self.coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.deadlineLabel.mas_right).offset(5);
            make.centerY.height.equalTo(_bottomView);
            make.width.equalTo(@200);
        }];
        
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_bottomView.mas_right).offset(-15);
            make.centerY.height.equalTo(_bottomView);
            make.width.equalTo(@30);
        }];
    }
    return _bottomView;
}

@end
