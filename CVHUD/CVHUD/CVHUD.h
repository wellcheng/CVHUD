//
//  CVHUD.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CVHUD : NSObject

@property (nonatomic, strong) UIView *contentView;

+(instancetype)sharedHUD;

- (void)show;

- (void)hideAfterDelay:(NSTimeInterval)delay;

@end
