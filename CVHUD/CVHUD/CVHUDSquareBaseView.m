//
//  CVHUDSquareBaseView.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUDSquareBaseView.h"


/**
 正方形的基础 view
 */
@interface CVHUDSquareBaseView ()

@property (nonatomic, strong) UIImageView *imageView;   // 背景图片
@property (nonatomic, strong) UILabel *titleLabel;      // 标题
@property (nonatomic, strong) UILabel *subTitleLabel;   // 副标题

@end

@implementation CVHUDSquareBaseView

/**
 默认的大小
 */
+ (CGRect)defaultSquareBaseViewFrame {
    return CGRectMake(0, 0, 156.0, 156.0);
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title subtitle:(NSString *)subtitle {
    if (self = [super initWithFrame:[[self class] defaultSquareBaseViewFrame]]) {
        self.imageView.image = image;
        self.titleLabel.text = title;
        self.subTitleLabel.text = subtitle;
        
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subTitleLabel];
    }
    return self;
}


#pragma mark - Getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.alpha = 0.85f;
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeCenter;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.f];
        _titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.minimumScaleFactor = 0.25f;
    }
    return  _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        _subTitleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
        _subTitleLabel.adjustsFontSizeToFitWidth = YES;
        _subTitleLabel.minimumScaleFactor = 0.25f;
        _subTitleLabel.numberOfLines = 2;
    }
    return  _subTitleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // view 的宽和高
    CGFloat viewWidth = self.bounds.size.width;
    CGFloat viewHeight = self.bounds.size.height;
    
    CGFloat halfHeight = ceil(viewHeight / 2.0);
    CGFloat quarterHeight = ceil(viewHeight / 4.0);
    CGFloat threeQuarterHeight = ceil(viewHeight / 4.0 * 3.0);
    
    // titleLabel 四分之一高
    self.titleLabel.frame = CGRectMake(0, 0, viewWidth, quarterHeight);
    // imageView 占 view 的高度一半，宽度全部，位置居中
    self.imageView.frame = CGRectMake(0, quarterHeight, viewWidth, halfHeight);
    // subTitleLLabel 四分之一高度，最底下
    self.subTitleLabel.frame = CGRectMake(0, threeQuarterHeight, viewWidth, quarterHeight);
}

@end
