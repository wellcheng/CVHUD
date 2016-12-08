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

@interface CVWindow ()
@property (nonatomic, strong) FrameView *frameView;
@property (nonatomic, strong) UIView *backgroundView;
@end

@implementation CVWindow

- (instancetype)initWithFrameView:(FrameView *)frameView
{
    _frameView = [[FrameView alloc] init];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self = [super initWithFrame:delegate.window.bounds];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.rootViewController = [[WindowRootViewController alloc] init];
    self.windowLevel = UIWindowLevelNormal + 500.f;
    self.backgroundColor = [UIColor clearColor];
}

- (UIView *)backgroundView {
    if (_backgroundView) {
        
    }
}
@end
