//
//  PageContentView.h
//  Huim
//
//  Created by huim on 2017/4/28.
//  Copyright © 2017年 huim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PageContentView;

@protocol PageContentViewDelegate <NSObject>

@optional

/**
 PageContentView开始滑动

 @param contentView PageContentView
 */
- (void)contentViewWillBeginDragging:(PageContentView *)contentView;

/**
 PageContentView滑动调用

 @param contentView PageContentView
 @param startIndex 开始滑动页面索引
 @param endIndex 结束滑动页面索引
 @param progress 滑动进度
 */
- (void)contentViewDidScroll:(PageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress;

/**
 PageContentView结束滑动

 @param contentView FSPageContentView
 @param startIndex 开始滑动索引
 @param endIndex 结束滑动索引
 */
- (void)contenViewDidEndDecelerating:(PageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

/**
 scrollViewDidEndDragging

 @param contentView FSPageContentView
 */
- (void)contenViewDidEndDragging:(PageContentView *)contentView;

@end

@interface PageContentView : UIView

/**
 对象方法创建PageContentView

 @param frame frame
 @param childVCs 子VC数组
 @param parentVC 父视图VC
 @param delegate delegate
 @return PageContentView
 */
- (instancetype)initWithFrame:(CGRect)frame childVCs:(NSArray *)childVCs parentVC:(UIViewController *)parentVC delegate:(id<PageContentViewDelegate>)delegate;

@property (nonatomic, weak) id<PageContentViewDelegate>delegate;

/**
 设置contentView当前展示的页面索引，默认为0
 */
@property (nonatomic, assign) NSInteger contentViewCurrentIndex;

/**
 设置contentView能否左右滑动，默认YES
 */
@property (nonatomic, assign) BOOL contentViewCanScroll;

@end
