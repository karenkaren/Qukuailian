//
//  QuotationListCell.h
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuotationModel;

@interface QuotationListCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) QuotationModel * quotationData;

@end
