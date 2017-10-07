//
//  TBYActionHeaderView.m
//  自定义ActionSheet
//
//  Created by 佟博研 on 2017/9/19.
//  Copyright © 2017年 com. All rights reserved.
//

#import "TBYActionHeaderView.h"
#import "Masonry.h"


#define RGB_COLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kUIColorFromRGBAndAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

@interface TBYActionHeaderView ()


@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UIImageView * leftIconImageView;

@property (nonatomic, strong) UIImageView * rightIconImageView;

@property (nonatomic, strong) UIView * backView;

@property (nonatomic, strong) UIView * lineView;

@end


@implementation TBYActionHeaderView

#pragma mark - init

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.backView];
        
        [self.backView addSubview:self.leftIconImageView];
        
        [self.backView addSubview:self.rightIconImageView];
        
        [self.backView addSubview:self.titleLabel];
        
        [self.backView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView);
    }];
    
    [self.leftIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.backView.mas_left).with.offset(12);
        
        make.centerY.equalTo(self.backView.mas_centerY);
        
        make.size.mas_equalTo(CGSizeMake(20, 21));
        
    }];
    
    [self.rightIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.backView.mas_right).with.offset(- 12);
        
        make.centerY.equalTo(self.backView.mas_centerY);
        
        make.size.mas_equalTo(CGSizeMake(20, 21));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.backView.mas_centerY);
        
        make.centerX.equalTo(self.backView.mas_centerX);
        
        make.left.equalTo(self.backView.mas_left).with.offset(12);
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.equalTo(self.backView);
        
        make.height.mas_equalTo(1);
        
    }];
    
}

#pragma mark - get/set

- (void)setHeaderModel:(TBYActionHeaderModel *)headerModel{
    
    _headerModel = headerModel;
    
    if (headerModel.leftIconStr) {
        
        self.leftIconImageView.image = [UIImage imageNamed:headerModel.leftIconStr];
        
    }else{
        
        self.leftIconImageView.hidden = YES;
    }
    
    if (headerModel.rightIconStr) {
        
        self.rightIconImageView.image = [UIImage imageNamed:headerModel.rightIconStr];
        
    }else{
        
        self.rightIconImageView.hidden = YES;
    }
    
    self.titleLabel.text = headerModel.titleStr;
    
    self.titleLabel.font = headerModel.textFont;
    
    self.titleLabel.textColor = headerModel.textColor;
    
    [self.titleLabel layoutIfNeeded];
    
    self.titleLabel.textAlignment = headerModel.textAlign;
    
}

- (UIView *)backView{
    
    if (!_backView) {
        
        _backView = [[UIView alloc] init];
    }
    
    return _backView;
}

- (UIImageView *)leftIconImageView{
    
    if (!_leftIconImageView) {
        
        _leftIconImageView = [[UIImageView alloc] init];
    }
    return _leftIconImageView;
}

- (UIImageView *)rightIconImageView{
    
    if (!_rightIconImageView) {
        
        _rightIconImageView = [[UIImageView alloc] init];
        
    }
    
    return _rightIconImageView;
}

- (UILabel *)titleLabel{
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    return _titleLabel;
}

- (UIView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGBAndAlpha(0xf8f5f5, 1);
    }
    return _lineView;
}

@end
