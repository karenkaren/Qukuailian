//
//  ProjectListController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/10.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "ProjectListController.h"
#import "ProjectInfoCell.h"

@interface ProjectListController ()

@end

@implementation ProjectListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight - 50) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[ProjectInfoCell class] forCellReuseIdentifier:@"ProjectInfoCell"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    debugLog(@"index:%ld", self.type);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProjectInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectInfoCell" forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark - private methods
- (void)refreshAction {
    [self startRefresh];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopRefresh];
    });
}

@end
