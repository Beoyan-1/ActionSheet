//
//  TBYActionCell.m
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import "TBYActionCell.h"
#import "Masonry.h"

@interface TBYActionCell ()

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UIImageView * leftImageView;

@property (nonatomic, strong) UIImageView * rightImageView;

@property (nonatomic, strong) UIView * backView;

@property (nonatomic, strong) UIVisualEffectView * effectView;

@property (nonatomic, strong) UIView * lineView;

@end


#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation TBYActionCell






- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.backView];
        
        [self.backView addSubview:self.titleLabel];
        
        [self.backView addSubview:self.leftImageView];
        
        [self.backView addSubview:self.rightImageView];
        
        [self.backView addSubview:self.titleLabel];
        
        [self.backView addSubview:self.lineView];
        
        [self layout];
        
    }
    
    return self;
}


#pragma mark - layoutSubviews

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-1);
    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.backView.mas_centerY);
        
        make.left.equalTo(self.backView.mas_left).with.offset(12);
        
        make.size.mas_equalTo(CGSizeMake(20, 21));
        
    }];
    
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.backView.mas_centerY);
        
        make.left.equalTo(self.titleLabel.mas_right).with.offset(12);
        
        make.size.mas_equalTo(CGSizeMake(20, 21));
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.equalTo(self.backView);
        
        make.height.mas_equalTo(1);
        
    }];
    
}

- (void)layout{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.backView.mas_centerY);
        
        make.centerX.equalTo(self.backView.mas_centerX);
        
        make.left.greaterThanOrEqualTo(self.backView.mas_left).with.offset(40);
        
        make.right.lessThanOrEqualTo(self.backView.mas_right).with.offset(-40);
        
    }];
}

#pragma mark - get/set

- (void)setAction:(TBYAction *)action{
    
    _action = action;
    
    self.titleLabel.text = action.titleStr;
    
    if (action.leftImageStr) {
        
        self.leftImageView.image = [UIImage imageNamed:action.leftImageStr];
    }else{
        self.leftImageView.hidden = YES;
    }
    
    if (action.rightIamgeStr) {
        
        self.rightImageView.image = [UIImage imageNamed:action.rightIamgeStr];
        
    }else{
        self.rightImageView.hidden = YES;
    }
    
    switch (action.tbyStyle) {
            
        case TBYActionStyleDefault:
            
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            
            self.titleLabel.textColor = [UIColor blackColor];
            
            break;
            
        case TBYActionStyleDestructive:
            
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            
            self.titleLabel.textColor = kUIColorFromRGB(0xfa5c5c);
            
            break;
        default:
            break;
    }
    
    if (action.textColor) {
        
        self.titleLabel.textColor = action.textColor;
    }
    
    if (action.textFont) {
        
        self.titleLabel.font = action.textFont;
    }
    
    
    switch (action.textAlign) {
            
        case NSTextAlignmentRight:{
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.centerY.equalTo(self.backView.mas_centerY);
                
                make.centerX.equalTo(self.backView.mas_centerX);
                
                make.left.equalTo(self.leftImageView.mas_right).with.offset(12);
                
                
            }];
            
            break;
        }
            
        case NSTextAlignmentLeft:{
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.centerY.equalTo(self.backView.mas_centerY);
                
                make.centerX.equalTo(self.backView.mas_centerX);
                
                make.left.equalTo(self.leftImageView.mas_right).with.offset(12);
                
                
            }];
            
            
            break;
        }
        default:
            break;
    }
    
    self.titleLabel.textAlignment = action.textAlign;
    

}

- (UILabel *)titleLabel{
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UIImageView *)leftImageView{
    
    if (!_leftImageView) {
        
        _leftImageView = [[UIImageView alloc] init];
        
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView{
    
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
}

- (UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
//        _backView.alpha = 0.5;
    }
    return _backView;
}

- (UIView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xf8f5f5);
    }
    return _lineView;
}

- (UIVisualEffectView *)effectView{
    
    if (!_effectView) {
         UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    }
    return _effectView;
}

@end
