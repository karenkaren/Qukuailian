//
//  LoadErrorView.h
//  BankOfCommunications
//
//  Created by Mac on 16/10/11.
//  Copyright © 2016年 P&C Information. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, LoadErrorType) {
    LoadErrorTypeDefault = 0,                   //加载失败，接口返回异常
    LoadErrorTypeNetworkNotReachable = 1,       //无网络连接
    LoadErrorTypeDefaultNotReachable = 2        //无网提示,无需顶部无网提示
};

@class LoadErrorView;

typedef void(^RefreshBlock)(LoadErrorView *loadErrorView);

//确认代理
@protocol LoadeErrorViewDelegate <NSObject>
@required

/**
 加载错误页面点击刷新代理

 @param loadErrorView 视图

 */
- (void)loadErrorViewClicked:(LoadErrorView *)loadErrorView;

@end

@interface LoadErrorView : UIView

@property(nonatomic, strong) RefreshBlock refreshHandle;

@property (nonatomic, weak) id<LoadeErrorViewDelegate> delegate;

/**
 加载异常页面

 @param type  错误类型（LoadErrorTypeDefault 接口异常，LoadErrorTypeNetworkNotReachable 无网络连接）

 @return 返回初始化的异常页面
 */
-(instancetype)initWithErrorType:(LoadErrorType)type;

- (instancetype)initWithErrorType:(LoadErrorType)type withFrame:(CGRect)frame;

-(instancetype)initWithErrorType:(LoadErrorType)type WithRefrehHandle:(RefreshBlock)handle;

//设置视图内部内容偏移
- (void)setContentOffset:(CGPoint)offset;

//视图内内容顶部位置
- (CGFloat)contentTop;

//视图内内容底部位置
- (CGFloat)contentBottom;


@end
