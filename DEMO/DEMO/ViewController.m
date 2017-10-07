//
//  ViewController.m
//  DEMO
//
//  Created by 佟博研 on 2017/10/6.
//  Copyright © 2017年 tby. All rights reserved.
//

#import "ViewController.h"
#import "TBYActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    TBYActionHeaderModel * model = [[TBYActionHeaderModel alloc] initWithHeaderModelWithTitleStr:@"测试demo" textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:16]];
    
    TBYActionSheet * actonSheet1 = [TBYActionSheet actionSheetWithTitleModel:model];
    
    
    TBYAction * action1 = [TBYAction actionWithTitle:@"action1" tbyStyle:TBYActionStyleDefault handler:^(TBYAction *action) {
        
        NSLog(@"点击了action1");
    }];
    
    TBYAction * action2 = [TBYAction actionWithTitle:@"取消" tbyStyle:TBYActionStyleCancel handler:^(TBYAction *action) {
        
        NSLog(@"点击了取消");
    }];
    
    
    [actonSheet1 addAction:action1];
    [actonSheet1 addAction:action2];
    
    [actonSheet1 show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
