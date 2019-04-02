//
//  MineViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/9.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"

@interface MineViewController ()

@property (nonatomic, strong) NSArray * cellData;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    [self createTableViewWithFrame:CGRectMake(0, 10, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight - 10) style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 85)];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self initCellData];
}

- (void)initCellData {
    self.cellData = @[@[@{
                          @"title" : @"币资产",
                          @"style" : @"ColorDetail",
                          @"detail" : @"¥0.00 0.00% 今日"
                          },
                        @{
                            @"title" : @"备忘录",
                            @"style" : @"None",
                            @"detail" : @""
                            },
                        @{
                            @"title" : @"悬浮窗设置",
                            @"style" : @"None",
                            @"detail" : @""
                            }],
                      @[@{
                            @"title" : @"加入我们",
                            @"style" : @"None",
                            @"detail" : @""
                            }],
                      @[@{
                            @"title" : @"红涨绿跌",
                            @"style" : @"Switch",
                            @"detail" : @""
                            },
                        @{
                            @"title" : @"夜间模式",
                            @"style" : @"Switch",
                            @"detail" : @""
                            },
                        @{
                            @"title" : @"币价显示",
                            @"style" : @"Detail",
                            @"detail" : @"人民币（CNY）"
                            },
                        @{
                            @"title" : @"语言",
                            @"style" : @"None",
                            @"detail" : @""
                            }]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * array = self.cellData[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    NSDictionary * cellDic = self.cellData[indexPath.section][indexPath.row];
    cell.textLabel.text = cellDic[@"title"];
    NSString * style = cellDic[@"style"];
    if ([style isEqualToString:@"Switch"]) {
        cell.accessoryView = [[UISwitch alloc] init];
        cell.detailTextLabel.text = @"";
        cell.detailTextLabel.textColor = [UIColor blackColor];
    } else if ([style isEqualToString:@"Detail"]) {
        cell.accessoryView = nil;
        cell.detailTextLabel.text = cellDic[@"detail"];
        cell.detailTextLabel.textColor = [UIColor blackColor];
    } else if ([style isEqualToString:@"ColorDetail"]) {
        cell.accessoryView = nil;
        cell.detailTextLabel.text = cellDic[@"detail"];
        cell.detailTextLabel.textColor = [UIColor redColor];
    } else {
        cell.accessoryView = nil;
        cell.detailTextLabel.text = @"";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
