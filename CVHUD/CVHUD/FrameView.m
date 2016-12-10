//
//  FrameView.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/8.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "FrameView.h"


@interface FrameView ()
{
    UIView<PKHUDAnimating> *_content;
}
@end

@implementation FrameView

- (instancetype)init
{
    self = [super initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    if (self) {
        [self commanInit];
        
    }
    return self;
}

// 设置背景色、圆角、添加内容 content
- (void)commanInit {
    self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.36];
    self.layer.cornerRadius = 9.0f;
    self.layer.masksToBounds = YES;
    [self.contentView addSubview:self.content];
    
    [self motionInit];
}
// 给当前的 view 添加透视功能
- (void)motionInit {
    CGFloat offset = 20.0;
    UIInterpolatingMotionEffect *motionEffectsX =
        [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    motionEffectsX.maximumRelativeValue = @(offset);
    motionEffectsX.minimumRelativeValue = @(- offset);
    
    UIInterpolatingMotionEffect *motionEffectsY =
    [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    motionEffectsY.maximumRelativeValue = @(offset);
    motionEffectsY.minimumRelativeValue = @(- offset);
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[motionEffectsX, motionEffectsY];
    [self addMotionEffect:group];
}


#pragma mark - Getter & Setter
- (UIView<PKHUDAnimating> *)content {
    if (!_content) {
        _content = [[UIView alloc] init];
    }
    return _content;
}

// 配置 content、让 Frame 跟随 content 变化大小
- (void)setContent:(UIView<PKHUDAnimating> *)content
{
    [_content removeFromSuperview];
    _content = content;
    _content.alpha = 0.85f;
    _content.contentMode = UIViewContentModeCenter;
    _content.clipsToBounds = YES;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _content.bounds.size.width, _content.bounds.size.height);
    [self addSubview:_content];
}
@end
