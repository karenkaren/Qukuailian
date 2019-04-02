//
//  GlobalAppearance.h
//  Coin
//
//  Created by LiuFeiFei on 2018/3/27.
//  Copyright © 2018年 LiuFeiFei. All rights reserved.
//

#ifndef GlobalAppearance_h
#define GlobalAppearance_h

#pragma mark - 字体
#define kFont(size)     [UIFont systemFontOfSize:(size)]
#define kBoldFont(size) [UIFont boldSystemFontOfSize:(size)]
#define kStringSize(string, fontSize) [string sizeWithAttributes:@{NSFontAttributeName : kFont(fontSize)}]

#pragma mark - 颜色
#define kHexColor(hexColor) [UIColor colorWithHex:hexColor]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:arc4random_uniform(10) / 10.0]

#pragma mark - 常用颜色
#define kMainColor          kHexColor(0x3e73ff) // 主色
#define kAssistRedColor     kHexColor(0xff4158) // 辅助红色
#define kAssistGreenColor   kHexColor(0x09b581) // 辅助绿色
#define kAssistOrangeColor  kHexColor(0xff7919) // 辅助橙色
#define kNeuterColor1       kHexColor(0xffffff) // 中性色
#define kNeuterColor2       kHexColor(0xfbfbfb) // 中性色
#define kNeuterColor3       kHexColor(0xf4f6f8) // 中性色
#define kNeuterColor4       kHexColor(0xf2f2f2) // 中性色
#define kNeuterColor5       kHexColor(0xe8e8e8) // 中性色
#define kNeuterColor6       kHexColor(0xd7d7d7) // 中性色
#define kNeuterColor7       kHexColor(0x999999) // 中性色
#define kNeuterColor8       kHexColor(0x666666) // 中性色
#define kNeuterColor9       kHexColor(0x41474c) // 中性色
#define kNeuterColor10      kHexColor(0x333333) // 中性色
#define kNeuterColor11      kHexColor(0xcccccc) // 中性色
#define kNeuterColor12      kHexColor(0xe8f1fa) // 中性色
#define kBackgroundColor1   kNeuterColor1       // 背景色
#define kBackgroundColor2   kHexColor(0xf4f5f7) // 背景色
#define kBackgroundColor3   kNeuterColor3       // 背景色
#define kBackgroundColor4   kNeuterColor11      // 背景色
#define kLineColor1         kNeuterColor5       // 分隔线
#define kLineColor2         kNeuterColor6       // 分隔线
#define kWhiteColor         kNeuterColor1       // 白色

#endif /* GlobalAppearance_h */
