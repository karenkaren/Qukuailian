//
//  NewsListController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/11.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "NewsListController.h"
#import "NewsInfoCell.h"
#import "NewsInfoHeader.h"

@interface NewsListController ()

@end

@implementation NewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight - 50) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[NewsInfoCell class] forCellReuseIdentifier:@"NewsInfoCell"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    debugLog(@"index:%ld", self.type);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NewsInfoCell" forIndexPath:indexPath];
    
    NewsInfoModel * newsInfo = [[NewsInfoModel alloc] init];
    cell.newsInfo = newsInfo;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsInfoCell * cell = [[NewsInfoCell alloc] init];
    return [cell getCellHeightWithNews:[[NewsInfoModel alloc] init]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NewsInfoHeader * header = [[NewsInfoHeader alloc] init];
    return header;
}

#pragma mark - private methods
- (void)refreshAction {
    [self startRefresh];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopRefresh];
    });
}

@end
