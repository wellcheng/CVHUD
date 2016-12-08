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
    UIView *_content;
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

- (void)commanInit {
    self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.36];
    self.layer.cornerRadius = 9.0f;
    self.layer.masksToBounds = YES;
    [self.contentView addSubview:self.content];
    
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
- (UIView *)content {
    if (!_content) {
        _content = [UIView new];
    }
    return _content;
}

- (void)setContent:(UIView *)content
{
    [_content removeFromSuperview];
    _content = content;
    _content.alpha = 0.85f;
    _content.contentMode = UIViewContentModeCenter;
    _content.clipsToBounds = YES;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _content.bounds.size.width, _content.bounds.size.height);
    [self addSubview:_content];
}
//- (void)setFrameContent:(UIView *)frameContent
//}
@end
