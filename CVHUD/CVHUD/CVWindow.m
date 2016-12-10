//
//  CVWindow.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/8.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVWindow.h"
#import "FrameView.h"
#import "AppDelegate.h"
#import "WindowRootViewController.h"

@interface CVWindow () {
    BOOL _willHide;
}

/**
 一个不透明的蒙层
 */
@property (nonatomic, strong) UIView *backgroundView;
@end

@implementation CVWindow

// 创建 window
- (instancetype)init
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self = [super initWithFrame:delegate.window.bounds];
    if (self) {
        [self commonInit];
    }
    return self;
}

/**
 生成 window 的 rootVC
 添加背景图片以及 FrameView
 */
- (void)commonInit {
    self.rootViewController = [[WindowRootViewController alloc] init];
    self.windowLevel = UIWindowLevelNormal + 500.f;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.backgroundView];
    [self addSubview:self.frameView];
}


/**
 布局，将背景图和frameView 都放在 window 中间
 背景图和 window 一样大
 */
-(void)layoutSubviews {
    [super layoutSubviews];
    self.frameView.center = self.center;
    self.backgroundView.frame = self.bounds;
}

-(void)showFrameView {
    [self.layer removeAllAnimations];
    [self makeKeyAndVisible];
    self.frameView.center = self.center;
    self.frameView.alpha = 1.0f;
    self.hidden = NO;
}

#pragma mark - Getter & Setter
- (FrameView *)frameView {
    if (!_frameView) {
        _frameView = [[FrameView alloc] init];
    }
    return  _frameView;
}

- (UIView *)backgroundView {
    if (_backgroundView) {
        return _backgroundView;
    }
    _backgroundView = [[UIView alloc] init];
    _backgroundView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.25f];
    _backgroundView.alpha = 0.0;
    return _backgroundView;
}

- (void)showBackground:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.175 animations:^{
            self.backgroundView.alpha = 1.0f;
        }];
    } else {
        self.backgroundView.alpha = 1.0f;
    }
}

- (void)hideBackground:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.65 animations:^{
            self.backgroundView.alpha = 0.0f;
        }];
    } else {
        self.backgroundView.alpha = 0.0f;
    }
}

- (void)hideFrameViewAnimated:(BOOL)animated {
    
    if (self.isHidden) {
        return;
    }
    _willHide = YES;
    
    if (animated) {
        [UIView animateWithDuration:0.8 animations:^{
            self.frameView.alpha = 0;
            [self hideBackground:false];
        }];
    } else {
        self.frameView.alpha = 0;
    }
    
    self.hidden = YES;
    [self resignKeyWindow];
    _willHide = NO;
}
@end
