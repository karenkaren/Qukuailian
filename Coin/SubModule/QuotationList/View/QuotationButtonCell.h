//
//  QuotationButtonCell.h
//  Coin
//
//  Created by LiuFeiFei on 2018/5/18.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QuotationButtonCellDelegate <NSObject>

@optional
- (void)buttonCellDidClickedLeft:(UIButton *)button;
- (void)buttonCellDidClickedRight:(UIButton *)button;

@end

@interface QuotationButtonCell : UITableViewCell

@property (nonatomic, weak) id<QuotationButtonCellDelegate> delegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
