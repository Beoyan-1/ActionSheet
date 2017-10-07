//
//  TBYAction.h
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TBYAction;

typedef enum : NSUInteger {
    TBYActionStyleDefault = 0,
    TBYActionStyleCancel,
    TBYActionStyleDestructive
} TBYActionStyle;


typedef void(^handeler)(TBYAction * action);

@interface TBYAction : NSObject


+ (instancetype)actionWithTitle:(NSString *)title tbyStyle:(TBYActionStyle)style handler:(handeler)handler;

/**
 action字符
 */
@property (nonatomic, strong) NSString * titleStr;

/**
 action类型
 */
@property (nonatomic, assign) TBYActionStyle tbyStyle;

/**
 文字颜色
 */
@property (nonatomic, strong) UIColor * textColor;

/**
 文字字体
 */
@property (nonatomic, strong) UIFont * textFont;

/**
 左侧图片
 */
@property (nonatomic, strong) NSString * leftImageStr;

/**
 右侧图片
 */
@property (nonatomic, strong) NSString * rightIamgeStr;

/**
 对齐方式
 */
@property (nonatomic, assign) NSTextAlignment textAlign;


@property (nonatomic, copy) handeler handelerBlock;




@end
