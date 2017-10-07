//
//  TBYActionHeaderModel.h
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TBYActionHeaderModel : NSObject


/**
 头文字
 */
@property (nonatomic, strong) NSString * titleStr;

/**
 头左侧图标
 */
@property (nonatomic, strong) NSString * leftIconStr;

/**
 头右侧图标
 */
@property (nonatomic, strong) NSString * rightIconStr;

/**
 头文字颜色
 */
@property (nonatomic, strong) UIColor * textColor;

/**
 头文字大小
 */
@property (nonatomic, strong) UIFont * textFont;

/**
 对齐方式
 */
@property (nonatomic, assign) NSTextAlignment textAlign;

+ (instancetype)headerModelWithTitleStr:(NSString *)titleStr textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

- (instancetype)initWithHeaderModelWithTitleStr:(NSString *)titleStr textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

@end
