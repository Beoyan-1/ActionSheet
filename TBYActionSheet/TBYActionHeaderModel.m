//
//  TBYActionHeaderModel.m
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import "TBYActionHeaderModel.h"

@implementation TBYActionHeaderModel


+ (instancetype)headerModelWithTitleStr:(NSString *)titleStr textColor:(UIColor *)textColor textFont:(UIFont *)textFont{
    
    return [[self alloc] initWithHeaderModelWithTitleStr:titleStr textColor:textColor textFont:textFont];
    
}

- (instancetype)initWithHeaderModelWithTitleStr:(NSString *)titleStr textColor:(UIColor *)textColor textFont:(UIFont *)textFont{
    
    if (self = [super init]) {
     
        
        self.titleStr = titleStr;
        
        self.textColor = textColor;
        
        self.textFont = textFont;

    }
    
    return self;
}


-(NSTextAlignment)textAlign{
    
    
    if (!_textAlign) {
        
        _textAlign = NSTextAlignmentCenter;
    }
    return _textAlign;
}
@end
