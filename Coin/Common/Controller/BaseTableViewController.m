//
//  BaseTableViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/2/28.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "BaseTableViewController.h"
#import "LoadErrorView.h"

@interface BaseTableViewController ()<LoadeErrorViewDelegate>

// 接口错误或网络原因展示页面
@property (nonatomic, strong) LoadErrorView * codeErrorView;

@end

@implementation BaseTableViewController

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self.tableView removeFromSuperview];
    self.tableView = nil;
    self.tableView = [[BaseTableView alloc] initWithFrame:frame style:style];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self setEnableFooterRefresh:self.enableFooterRefresh];
    [self setEnableHeaderRefresh:self.enableHeaderRefresh];
    [self.view addSubview:self.tableView];
}

- (void)createTableViewWithStyle:(UITableViewStyle)style {
    [self.tableView removeFromSuperview];
    self.tableView = nil;
    
    self.tableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight) style:style];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self setEnableFooterRefresh:self.enableFooterRefresh];
    [self setEnableHeaderRefresh:self.enableHeaderRefresh];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableViewWithStyle:UITableViewStylePlain];
    self.enableFooterRefresh = YES;
    self.enableHeaderRefresh = YES;
    //    self.pageSize = 20;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)setEnableHeaderRefresh:(BOOL)enableHeaderRefresh {
    _enableHeaderRefresh = enableHeaderRefresh;
    
    if (enableHeaderRefresh) {
        kWeakSelf
        // 下拉刷新
        self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
            kStrongSelf
            //            strongSelf.currentPage = 0;
            [strongSelf refreshAction];
        }];
    } else {
        self.tableView.mj_header = nil;
    }
}

- (void)setEnableFooterRefresh:(BOOL)enableFooterRefresh {
    _enableFooterRefresh = enableFooterRefresh;
    
    if (enableFooterRefresh) {
        // 上拉刷新
        kWeakSelf
        self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
            kStrongSelf
            //            strongSelf.currentPage++;
            [strongSelf refreshAction];
        }];
    } else {
        self.tableView.mj_footer = nil;
    }
}

- (void)setEnableRefresh:(BOOL)enableRefresh {
    _enableRefresh = enableRefresh;
    self.enableHeaderRefresh = enableRefresh;
    self.enableFooterRefresh = enableRefresh;
}

- (void)refreshAction {
}

- (void)startRefresh {
    [self.tableView.mj_header beginRefreshing];
}

- (void)stopRefresh {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

- (BOOL)isRefreshing {
    if ([self.tableView.mj_header isRefreshing]) {
        return YES;
    }
    if ([self.tableView.mj_footer isRefreshing]) {
        return YES;
    }
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

#pragma mark - 接口原因错误页面,网络原因错误页面
- (void)loadFailedView:(NSInteger)style {
    
    if (self.codeErrorView == nil) {
        self.codeErrorView = [[LoadErrorView alloc] initWithErrorType:style];
        self.codeErrorView.delegate = self;
    }
    [self.view addSubview:self.codeErrorView];
    // 隐藏其他页面
    self.tableView.hidden = YES;
}

#pragma mark - 加载错误页面点击刷新代理
- (void)loadErrorViewClicked:(LoadErrorView *)loadErrorView {
    // 移除接口失败页面
    [self.codeErrorView removeFromSuperview];
    [self loadErrorViewClicked];
}

- (void)loadErrorViewClicked {
    
}

@end
