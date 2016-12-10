//
//  HUD.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HUD.h"
#import "CVHUD.h"
#import "CVHUDSuccessView.h"
#import "CVHUDErrorView.h"
#import "CVHUDProgressView.h"

@interface HUD ()

@end

@implementation HUD

#pragma mark - Interface
+ (void)show {
    [self showWith:HUDContentSuccess];
}

+ (void)showWith:(HUDContentType)type {
    [self showWithType:type delay:2.0];
}

#pragma mark - Custom
+ (void)showWithType:(HUDContentType)type delay:(NSTimeInterval)delay {
    [CVHUD sharedHUD].contentView = [self contentViewWithType:type];
    [[CVHUD sharedHUD] show];
    [[CVHUD sharedHUD] hideAfterDelay:delay];
}


+ (UIView *)contentViewWithType:(HUDContentType)type {
    switch (type) {
        case HUDContentSuccess:
            return [[CVHUDSuccessView alloc] init];
            break;
        case HUDContentError:
            return [[CVHUDErrorView alloc] init];
            break;
        case HUDContentProgress:
            return [[CVHUDProgressView alloc] init];
    }
}
@end
