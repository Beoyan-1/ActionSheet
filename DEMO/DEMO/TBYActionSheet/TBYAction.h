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
@property (nonatomic, strong) UIColor * textColor UI_APPEARANCE_SELECTOR;

/**
 文字字体
 */
@property (nonatomic, strong) UIFont * textFont UI_APPEARANCE_SELECTOR ;

/**
 左侧头像
 */
@property (nonatomic, strong) NSString * leftImageStr;

/**
 右侧头像
 */
@property (nonatomic, strong) NSString * rightIamgeStr;

/**
 对齐方式
 */
@property (nonatomic, assign) NSTextAlignment textAlign UI_APPEARANCE_SELECTOR;


@property (nonatomic, copy) handeler handelerBlock;




@end
