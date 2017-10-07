//
//  TBYActionSheet.m
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import "TBYActionSheet.h"
#import "TBYActionCell.h"
#import "AppDelegate.h"


#define rowheight 50
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface TBYActionSheet ()<UITableViewDelegate , UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) TBYActionHeaderModel * headerModel;

@property (nonatomic , strong) UITableView * tableview;

@property (nonatomic , strong) NSMutableArray * dataList;

@property (nonatomic , strong) UIView * customerView;

@property (nonatomic, strong) TBYAction * cancleAction;

@end


static NSString * cellReuseIdentifier = @"cellReuseIdentifier";

static NSString * headReuseIdentifier = @"headReuseIdentifier";

@implementation TBYActionSheet



#pragma mark - init

- (instancetype)initWithSheetWithTitleModel:(TBYActionHeaderModel *)headerModel{
    
    if (self = [super init]) {
        
        self.headerModel = headerModel;
        
        self.view.backgroundColor = [UIColor colorWithRed:102/255 green:102/255 blue:102/255 alpha:0.4];
        
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
        AppDelegate * appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        appdelegate.window.rootViewController.definesPresentationContext = YES;
        
        
    }
    return self;
}

+ (instancetype)actionSheetWithTitleModel:(TBYActionHeaderModel *)headerModel{
    
    return [[self alloc] initWithSheetWithTitleModel:headerModel];
    
}


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    
    tapGesture.delegate = self;
    
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self initView];
}


- (void)initView{
    
    self.tableview.frame = CGRectMake(10, 0, ScreenWidth - 20, [self.dataList count] * rowheight + 45);
    
    if (self.tableViewMaxHeight == 0) {
        
       
        
        self.tableview.scrollEnabled = NO;
        
    }else{
        CGRect rect = self.tableview.frame;
        
        rect.size.height = self.tableViewMaxHeight;
        
        
        self.tableview.frame = rect;
        
        self.tableview.scrollEnabled = YES;
    }

     self.customerView.frame = CGRectMake(0 , ScreenHeight, ScreenWidth, CGRectGetHeight(_tableview.frame)+ ((self.cancleAction )? 70 : 2));
    _customerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    
    [self.view addSubview:self.customerView];
    
    [self.customerView addSubview:self.tableview];
    
    self.tableview.layer.cornerRadius = 10;
    
    self.tableview.layer.masksToBounds = YES;
    
    self.tableview.alpha = 0.95;
    
   
    if (self.cancleAction) {
     
        UIButton * cancleBtn = [[UIButton alloc] init];
        
        cancleBtn.alpha = 0.95;
        
        cancleBtn.backgroundColor = [UIColor whiteColor];
        
        cancleBtn.layer.masksToBounds = YES;
        
        cancleBtn.layer.cornerRadius = 10;
        
        cancleBtn.frame = CGRectMake(10,CGRectGetHeight(_tableview.frame)+10, ScreenWidth-20, 50);
        
        [cancleBtn setTitle:self.cancleAction.titleStr forState:UIControlStateNormal];
        
        [cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (self.cancleAction.textFont) {
            
            cancleBtn.titleLabel.font = self.cancleAction.textFont;
        }
        
        if (self.cancleAction.textColor) {
            
            [cancleBtn setTitleColor:self.cancleAction.textColor forState:UIControlStateNormal];
        }
        
        [cancleBtn addTarget:self action:@selector(tappedCancel) forControlEvents:UIControlEventTouchUpInside];
        
        [self.customerView addSubview:cancleBtn];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect rect = self.customerView.frame;
        
        rect.origin.y = ScreenHeight - CGRectGetHeight(rect);
        
        self.customerView.frame = rect;
        
    }];
    
    [self.tableview reloadData];
    
}


#pragma mark - Click

- (void)tappedCancel{
    
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 0;
        CGRect originRect = _customerView.frame;
        originRect.origin.y = ScreenHeight;
        _customerView.frame = originRect;
        
    } completion:^(BOOL finished) {
        if (finished) {
            
         
           [self dismissViewControllerAnimated:NO completion:nil];

            
            
            for (UIView *v in _customerView.subviews) {
                [v removeFromSuperview];
            }
            [_customerView removeFromSuperview];
            
            
        }
    }];
    
    if (self.cancleAction) {
        
        self.cancleAction.handelerBlock(self.cancleAction);
    }
    
    
}

- (void)tappedCancelCompletion:(void (^)(void))completion{
    
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 0;
        CGRect originRect = _customerView.frame;
        originRect.origin.y = ScreenHeight;
        _customerView.frame = originRect;
       
    } completion:^(BOOL finished) {
        if (finished) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completion) {
                   [self dismissViewControllerAnimated:NO completion:completion];
                }
                
            });
            
            
            for (UIView *v in _customerView.subviews) {
                [v removeFromSuperview];
            }
            [_customerView removeFromSuperview];
            
            
        }
    }];
    
    if (self.cancleAction) {
        
        self.cancleAction.handelerBlock(self.cancleAction);
    }
    
}

#pragma mark - Actions

- (void)addAction:(TBYAction *)action{
    
    
    
    if (action.tbyStyle == TBYActionStyleCancel) {
        
        self.cancleAction = action;
        
    }else{
        
        [self.dataList addObject:action];
    }
    
}

- (void)show{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:NO completion:nil];
        
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TBYActionCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    cell.action = self.dataList[indexPath.row];
    
    [cell setLayoutMargins:UIEdgeInsetsZero];
    

    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TBYAction * action = self.dataList[indexPath.row];
    
    
    
    [self tappedCancelCompletion:^{
        
        action.handelerBlock(action);
    }];;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TBYActionHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headReuseIdentifier];
    
    headerView.headerModel = self.headerModel;
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 45;
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    CGPoint point = [touch locationInView:self.view];
    
     point = [self.customerView.layer convertPoint:point fromLayer:self.view.layer];
    
    if ([self.customerView.layer containsPoint:point]) {
        
        return NO;
    }
    
    return YES;
}


#pragma mark - get/set

- (NSMutableArray *)dataList{
    
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
    }
    
    return _dataList;
}


- (UITableView *)tableview{
    
    if (!_tableview) {
        
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableview registerClass:[TBYActionCell class] forCellReuseIdentifier:cellReuseIdentifier];
        [_tableview registerClass:[TBYActionHeaderView class] forHeaderFooterViewReuseIdentifier:headReuseIdentifier];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = rowheight;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    
    return _tableview;
}

- (UIView *)customerView{
    
    if (!_customerView) {
        _customerView = [[UIView alloc] init];
        
    }
    return _customerView;
}

@end
