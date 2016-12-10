//
//  CVHUDSquareBaseView.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 正方形的基础 view
 
 有一个固定的尺寸。
 可以显示图片和 title
 
 只是做简单的显示以及布局
 */
@interface CVHUDSquareBaseView : UIView

@property (nonatomic, strong) UIImageView *imageView;   // 背景图片
@property (nonatomic, strong) UILabel *titleLabel;      // 标题
@property (nonatomic, strong) UILabel *subTitleLabel;   // 副标题

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title subtitle:(NSString *)subtitle;
@end
