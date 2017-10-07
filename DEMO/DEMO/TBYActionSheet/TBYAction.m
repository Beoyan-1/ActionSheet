//
//  TBYAction.m
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import "TBYAction.h"



@implementation TBYAction

@synthesize titleStr;

+ (instancetype)actionWithTitle:(NSString *)title tbyStyle:(TBYActionStyle)style handler:(handeler)handler{
    
    TBYAction * action = [[TBYAction alloc] init];
    
    action.titleStr = title;
    
    action.tbyStyle = style;
    
    action.handelerBlock = handler;
    
    action.textAlign = NSTextAlignmentCenter;
    
    return action;
    
}

@end
