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

/**
 content 显示真正的内容，将 Content内容放在 FrameView 上可以进行模糊效果。
 content 遵循动画协议，可以进行动画
 content 的大小决定了 FrameView 的大小
 */
@property(nonatomic, strong) UIView<PKHUDAnimating> *content;

@end
