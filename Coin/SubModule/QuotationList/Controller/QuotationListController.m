//
//  QuotationListController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/14.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "QuotationListController.h"
#import "QuotationGroupModel.h"
#import "QuotationListCell.h"
#import "QuotationListHeaderView.h"
#import "QuotationTableHeader.h"
#import "QuotationButtonCell.h"

@interface QuotationListController ()<QuotationListHeaderViewDelegate, QuotationButtonCellDelegate>

@property (nonatomic, strong) NSArray * groups;

@end

@implementation QuotationListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight - 50) style:UITableViewStyleGrouped];
    self.tableView.rowHeight = 50;
    
    self.tableView.tableHeaderView = [[QuotationTableHeader alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
}

- (NSArray *)groups
{
    if (_groups == nil) {
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Quotations.plist" ofType:nil]];
        
        NSMutableArray * groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            QuotationGroupModel * group = [QuotationGroupModel groupWithDict:dict];
            [groupArray addObject:group];
        }
        
        _groups = groupArray;
    }
    return _groups;
}

#pragma mark - data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    QuotationGroupModel * group = self.groups[section - 1];
    return (group.isOpened ? group.quotations.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section) {
        QuotationListCell * cell = [QuotationListCell cellWithTableView:tableView];
        QuotationGroupModel * group = self.groups[indexPath.section - 1];
        cell.quotationData = group.quotations[indexPath.row];
        return cell;
    } else {
        QuotationButtonCell * cell = [QuotationButtonCell cellWithTableView:tableView];
        cell.delegate = self;
        return cell;
    }
    
}

#pragma mark - table view delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section) {
        QuotationListHeaderView * header = [QuotationListHeaderView headerViewWithTableView:tableView];
        header.delegate = self;
        header.group = self.groups[section - 1];
        return header;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section ? 44 : 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section) {
        return 44;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark - headerView的代理方法
- (void)headerViewDidClicked:(QuotationListHeaderView *)headerView {
    [self.tableView reloadData];
}

@end
