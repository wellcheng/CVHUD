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

typedef enum : NSUInteger {
    HUDContentSuccess,
    HUDContentError,
    
} HUDContentType;

@interface HUD ()

@end

@implementation HUD


+ (void)show {
    [CVHUD sharedHUD].contentView = [self contentViewWithType:HUDContentError];
    [[CVHUD sharedHUD] show];
}

+ (UIView *)contentViewWithType:(HUDContentType)type {
    switch (type) {
        case HUDContentSuccess:
            return [[CVHUDSuccessView alloc] init];
            break;
        case HUDContentError:
            return [[CVHUDErrorView alloc] init];
            break;
    }
}
@end
