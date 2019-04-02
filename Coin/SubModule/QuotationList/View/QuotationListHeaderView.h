//
//  QuotationListHeaderView.h
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuotationListHeaderView, QuotationGroupModel;

@protocol QuotationListHeaderViewDelegate <NSObject>

@optional
- (void)headerViewDidClicked:(QuotationListHeaderView *)headerView;

@end

@interface QuotationListHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) QuotationGroupModel * group;

@property (nonatomic, weak) id<QuotationListHeaderViewDelegate> delegate;

@end
