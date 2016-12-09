//
//  FrameView.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/8.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKHUDAnimating.h"

/**
 Frame View 实现模糊效果，将需要模糊的 content 添加到 FrameView 上，即可实现模糊效果
 */
@interface FrameView : UIVisualEffectView
@property(nonatomic, strong) UIView<PKHUDAnimating> *content;
//- (UIView *)content;
//- (void)setContent:(UIView *)content;
@end
