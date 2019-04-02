//
//  LoadErrorView.m
//  BankOfCommunications
//
//  Created by Mac on 16/10/11.
//  Copyright © 2016年 P&C Information. All rights reserved.
//

#import "LoadErrorView.h"
//#import "NIErrorViewController.h"
//
//#import "HomePageViewController.h"
//#import "PersonViewController.h"
//#import "FinanceViewController.h"
//#import "WelfareViewController.h"

@interface LoadErrorView ()<UIGestureRecognizerDelegate >
@property(nonatomic ,strong) UIView *topView;
@property(nonatomic ,strong) UIImageView *topImageV;
@property(nonatomic ,strong) UIImageView *imageV;
@property(nonatomic ,strong) UILabel *titleLab;
@property(nonatomic ,strong) UILabel *labA;
@property(nonatomic ,strong) UIButton *reloadBtn;

@end

@implementation LoadErrorView
-(instancetype)initWithErrorType:(LoadErrorType)type{
    self = [super init];
    if (self) {
        //CGRect frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64);
        //ADD BY Theo 2017-11-8 适配iPhone X
        CGRect frame = CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight);
        [self initView:type withFrame:frame];
    }
    return self;
}

-(instancetype)initWithErrorType:(LoadErrorType)type WithRefrehHandle:(RefreshBlock)handle{
    self = [self initWithErrorType:type];
    self.refreshHandle = handle;
    return self;
}

- (instancetype)initWithErrorType:(LoadErrorType)type withFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        [self initView:type withFrame:frame];
    }
    return self;
}

-(void)initView:(LoadErrorType)type withFrame:(CGRect)frame {
    self.frame = frame;
    self.backgroundColor = kWhiteColor;
    
    self.imageV = [[UIImageView alloc]init];
    self.imageV.frame = CGRectMake((self.frame.size.width - 100) / 2.0, self.topView.bottom + 150 * kScreenHeight / 750, 100, 100);
    
    self.labA = [[UILabel alloc]init];
    self.labA.textColor = kNeuterColor8;
    self.labA.textAlignment = NSTextAlignmentCenter;
    self.labA.font = [UIFont systemFontOfSize:15];
    
    self.reloadBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
    self.reloadBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    self.reloadBtn.layer.masksToBounds = YES;
    self.reloadBtn.layer.cornerRadius = 15;
    self.reloadBtn.layer.borderWidth = 0.5;
    self.reloadBtn.layer.borderColor =[UIColor colorWithHex:0x2072cf].CGColor;
//    [self.reloadBtn setTitleColor:ButtonPressedColor forState:UIControlStateHighlighted];
    [self.reloadBtn setTitleColor:[UIColor colorWithHex:0x2072cf] forState:UIControlStateNormal];
    [self.reloadBtn addTarget:self action:@selector(again:) forControlEvents:UIControlEventTouchUpInside];
    
    if (type == LoadErrorTypeNetworkNotReachable ||type == LoadErrorTypeDefaultNotReachable) {
        
        if (type == LoadErrorTypeNetworkNotReachable){
            
            self.topView =[[UIView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,40)];
            self.topView.backgroundColor = [UIColor colorWithHex:0xffe8ec];
            self.topImageV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 11, 18, 18)];
            self.topImageV.image = [UIImage imageNamed:@"TextFieldError.png"];
            self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(43, 0, self.frame.size.width-43, 40)];
            self.titleLab.textColor = [UIColor colorWithHex:0x666666];
            self.titleLab.text = @"当前网络不可用，请检查你的网络";
            self.titleLab.font = [UIFont systemFontOfSize:13];
          
            UIImageView *arrowRightImg=[[UIImageView alloc]initWithFrame:CGRectMake(self.topView.width-23, self.topView.height/2-15/2, 8, 15)];
            arrowRightImg.image=[UIImage imageNamed:@"arrowRight.png"];
            
            //首页时背景为黑色,白字
            UINavigationController *navigationVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
            if (navigationVC.viewControllers.count==1){
              self.topView.backgroundColor = [UIColor colorWithHex:0x41474c];
              self.titleLab.textColor = [UIColor whiteColor];
            }
           
            [self.topView addSubview:self.topImageV];
            [self.topView addSubview:self.titleLab];
            [self.topView addSubview:arrowRightImg];
          
            self.topView.userInteractionEnabled = YES;
            [self addSubview:self.topView];
        }
        
        
        self.imageV.image=[UIImage imageNamed:@"no_network.png"];
        self.labA.text = @"无网络连接";
        self.labA.frame = CGRectMake((self.frame.size.width-100)/2.0,self.imageV.bottom+10,100,22.5);
        self.reloadBtn.frame=CGRectMake((self.frame.size.width-120)/2.0, self.labA.bottom + 20, 120, 30);
    }else{
        
        self.imageV = [[UIImageView alloc]init];
        self.imageV.frame = CGRectMake((self.frame.size.width - 100)/2.0, 150 * kScreenHeight/750, 100, 100);
        self.imageV.image = [UIImage imageNamed:@"load_failure.png"];
        
        self.labA.text = @"加载失败";
        self.labA.frame = CGRectMake((self.frame.size.width-100)/2.0, self.imageV.bottom+10, 100, 22.5);
        self.reloadBtn.frame=CGRectMake((self.frame.size.width-120)/2.0,self.labA.bottom +20,120,30);
    }
    
    [self addSubview:self.imageV];
    [self addSubview:self.labA];
    [self addSubview:self.reloadBtn];
    
    UITapGestureRecognizer *gestureRecognizerSet = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goQuestion:)];
  
    [self.topView addGestureRecognizer:gestureRecognizerSet];
    
    
}
-(void)goQuestion:(id)sender{
    
//    NIErrorViewController * notNetVC=[[NIErrorViewController alloc]initWithNibName:@"NIErrorViewController" bundle:nil];
//    
//    if ([[self findViewController:self] isKindOfClass:[WelfareViewController class]] ||[[self findViewController:self] isKindOfClass:[HomePageViewController class]]||[[self findViewController:self] isKindOfClass:[PersonViewController class]]||[[self findViewController:self] isKindOfClass:[FinanceViewController class]]) {
//         [[self findViewController:self].tabBarController.navigationController pushViewController:notNetVC animated:YES ];
//    }else{
//        [[self findViewController:self].navigationController pushViewController:notNetVC animated:YES ];
//    }
}

- (UIViewController *)findViewController:(UIView *)sourceView
{
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}

-(void)again:(id)sender{
   //失败页面,延迟加载
//    [PNCGifWaitView showWaitViewInView:self style:DefaultWaitStyle];
   
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [PNCGifWaitView hideWaitViewInView:self];
      
        if (self.refreshHandle) {
            self.refreshHandle(self); //有 Block 优先使用 block
        }else{
            if (self.delegate && [self.delegate respondsToSelector:@selector(loadErrorViewClicked:)]) {
                [self.delegate loadErrorViewClicked:self];
            }
        }
//    });
    
    
}


- (void)setContentOffset:(CGPoint)offset{
    if (self.imageV) {
        self.imageV.top = self.imageV.top + offset.y;
        self.imageV.right = self.imageV.right + offset.x;
    }
    if (self.labA) {
        self.labA.top = self.labA.top + offset.y;
        self.labA.right = self.labA.right + offset.x;
    }
    if (self.reloadBtn) {
        self.reloadBtn.top = self.reloadBtn.top + offset.y;
        self.reloadBtn.right = self.reloadBtn.right + offset.x;
    }
    
}

//视图内内容顶部位置
- (CGFloat)contentTop{
    return self.imageV.top;
}

//视图内内容底部位置
- (CGFloat)contentBottom{
    return self.reloadBtn.bottom;
}

@end
