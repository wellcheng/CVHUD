//
//  WindowRootViewController.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/8.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "WindowRootViewController.h"
#import "AppDelegate.h"

@interface WindowRootViewController ()
@end

@implementation WindowRootViewController

#pragma mark - Getter & Setter

/**
 当前支持的屏幕方向
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    do {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if (!delegate) {break;}
        UIViewController *rootViewController = delegate.window.rootViewController;
        if (!rootViewController) {break;}
        return rootViewController.supportedInterfaceOrientations;
    } while (0);
    return UIInterfaceOrientationMaskPortrait;
}

/**
 偏好 statusBar 样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.presentedViewController) {
        return self.presentedViewController.preferredStatusBarStyle;
    }
    return [UIApplication sharedApplication].statusBarStyle;
}

/**
 stautsBar 是否要隐藏
 */
-(BOOL)prefersStatusBarHidden {
    if (self.presentedViewController) {
        return self.presentedViewController.prefersStatusBarHidden;
    }
    return [UIApplication sharedApplication].isStatusBarHidden;
}

/**
 statusBar 更新时的动画方式
 */
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    if ([self rootViewCtrl]) {
        return [self rootViewCtrl].preferredStatusBarUpdateAnimation;
    }
    return UIStatusBarAnimationNone;
}

/**
 是否支持自动旋转
 */
-(BOOL)shouldAutorotate {
    if ([self rootViewCtrl]) {
        return [self rootViewCtrl].shouldAutorotate;
    }
    return NO;
}

#pragma mark - Helper
- (UIViewController *)rootViewCtrl {
    do {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if (!delegate) {break;}
        UIViewController *rootViewController = delegate.window.rootViewController;
        if (!rootViewController) {break;}
        return rootViewController;
    } while (0);
    return nil;
}

@end
