//
//  InformationViewController.m
//  Coin
//
//  Created by LiuFeiFei on 2018/5/9.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#import "InformationViewController.h"
#import "ScrollContentView.h"
#import "NewsListController.h"

#define kDefaultSelectedIndex 0

@interface InformationViewController ()<PageContentViewDelegate, SegmentTitleViewDelegate>

@property (nonatomic, strong) PageContentView * pageContentView;
@property (nonatomic, strong) SegmentTitleView * titleView;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"资讯";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray * titles = @[@"快讯", @"要闻"];
    self.titleView = [[SegmentTitleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50) titles:titles delegate:self indicatorType:IndicatorTypeCustom];
    self.titleView.backgroundColor = kWhiteColor;
    self.titleView.titleSelectColor = kMainColor;
    self.titleView.indicatorColor = kMainColor;
    self.titleView.selectIndex = kDefaultSelectedIndex;
    self.titleView.indicatorExtension = -10;
    [self.view addSubview:self.titleView];
    
    NSMutableArray * childControllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < titles.count; i++) {
        NewsListController * newsController = [[NewsListController alloc] init];
        newsController.type = i;
        [childControllers addObject:newsController];
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
