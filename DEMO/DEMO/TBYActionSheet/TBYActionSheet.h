//
//  TBYActionSheet.h
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBYAction.h"
#import "TBYActionHeaderView.h"

@interface TBYActionSheet : UIViewController



@property (nonatomic, assign) CGFloat tableViewMaxHeight;

+ (instancetype)actionSheetWithTitleModel:(TBYActionHeaderModel *)headerModel;

- (instancetype)initWithSheetWithTitleModel:(TBYActionHeaderModel *)headerModel;

- (void)addAction:(TBYAction *)action;

- (void)show;

@end
