//
//  QuotationListHeaderView.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "QuotationListHeaderView.h"
#import "QuotationGroupModel.h"

@interface QuotationListHeaderView ()

@property (nonatomic, weak) UIButton * headerButton;
@property (nonatomic, strong) UIButton * detailButton;

@end

@implementation QuotationListHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    static NSString * ID = @"listHeader";
    QuotationListHeaderView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[QuotationListHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}


- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = kWhiteColor;
        
        UIView * topLineView = [[UIView alloc] init];
        topLineView.backgroundColor = kLineColor1;
        [self.contentView addSubview:topLineView];
        
        UIView * bottomLineView = [[UIView alloc] init];
        bottomLineView.backgroundColor = kLineColor1;
        [self.contentView addSubview:bottomLineView];
        
        [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.width.equalTo(self);
            make.height.equalTo(@[bottomLineView, @(kLineThick)]);
        }];
        
        [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.width.equalTo(self);
        }];
        
        UIButton * headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [headerButton setImage:[UIImage imageNamed:@"arrow_circle"] forState:UIControlStateNormal];
        [headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        headerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        headerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        headerButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [headerButton addTarget:self action:@selector(headerClick) forControlEvents:UIControlEventTouchUpInside];

        headerButton.imageView.contentMode = UIViewContentModeCenter;
        headerButton.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:headerButton];
        self.headerButton = headerButton;
        
        [headerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        kWeakSelf
        self.detailButton = [UIButton createButtonWithIconName:@"arrow_normal" block:^(UIButton *button) {
            kStrongSelf
            [strongSelf showDetail];
        }];
        [self.contentView addSubview:self.detailButton];
        
        [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(self.contentView.mas_height);
            make.right.top.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setGroup:(QuotationGroupModel *)group {
    _group = group;
    [self.headerButton setTitle:group.name forState:UIControlStateNormal];
    [self rotation];
}


- (void)headerClick {
    self.group.opened = !self.group.isOpened;
    
//    [self rotation];
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClicked:)]) {
        [self.delegate headerViewDidClicked:self];
    }

}

- (void)rotation {
    if (self.group.opened) {
        self.headerButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.headerButton.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

- (void)showDetail {
    debugLog(@"show detail");
}

@end
