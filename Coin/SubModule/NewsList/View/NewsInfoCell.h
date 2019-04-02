//
//  NewsInfoCell.h
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsInfoModel.h"

@interface NewsInfoCell : UITableViewCell

@property (nonatomic, strong) NewsInfoModel * newsInfo;
- (CGFloat)getCellHeightWithNews:(NewsInfoModel *)news;

@end
