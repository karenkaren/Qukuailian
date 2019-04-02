//
//  BaseTableViewController.h
//  Coin
//
//  Created by LiuFeiFei on 2018/2/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"
#import "MJRefresh.h"

@interface BaseTableViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, assign) NSInteger currentPage;
//@property (nonatomic, assign) NSInteger pageSize;
//@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, strong) BaseTableView * tableView;
// 创建table view
- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (void)createTableViewWithStyle:(UITableViewStyle)style;

// 默认全为YES
@property (nonatomic, assign) BOOL enableHeaderRefresh;
@property (nonatomic, assign) BOOL enableFooterRefresh;
@property (nonatomic, assign) BOOL enableRefresh;

// 刷新时执行的方法
- (void)refreshAction;
// 开始刷新
- (void)startRefresh;
// 停止刷新
- (void)stopRefresh;
// 是否正在刷新，返回YES时表示有头部或底部正在刷新
- (BOOL)isRefreshing;
// 接口原因错误页面,网络原因错误页面
- (void)loadFailedView:(NSInteger)style;
// 点击错误页面的重新加载错误
- (void)loadErrorViewClicked;

@end
