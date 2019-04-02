//
//  ProjectViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/9.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "ProjectViewController.h"
#import "ScrollContentView.h"
#import "ProjectListController.h"

#define kDefaultSelectedIndex 0

@interface ProjectViewController ()<PageContentViewDelegate, SegmentTitleViewDelegate>

@property (nonatomic, strong) PageContentView * pageContentView;
@property (nonatomic, strong) SegmentTitleView * titleView;

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"项目";
    
    NSArray * titles = @[@"进行中", @"即将开始", @"已结束"];
    self.titleView = [[SegmentTitleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50) titles:titles delegate:self indicatorType:IndicatorTypeCustom];
    self.titleView.backgroundColor = kWhiteColor;
    self.titleView.titleSelectColor = kMainColor;
    self.titleView.indicatorColor = kMainColor;
    self.titleView.selectIndex = kDefaultSelectedIndex;
    self.titleView.indicatorExtension = -10;
    [self.view addSubview:self.titleView];
    
    NSMutableArray * childControllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < titles.count; i++) {
        ProjectListController * projectController = [[ProjectListController alloc] init];
        projectController.type = i;
        [childControllers addObject:projectController];
    }
    
    self.pageContentView = [[PageContentView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight) childVCs:childControllers parentVC:self delegate:self];
    self.pageContentView.contentViewCurrentIndex = kDefaultSelectedIndex;
    [self.view addSubview:self.pageContentView];
}

#pragma mark - delegate
- (void)segmentTitleView:(SegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)contenViewDidEndDecelerating:(PageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.titleView.selectIndex = endIndex;
}

@end
