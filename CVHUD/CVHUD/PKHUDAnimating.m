//
//  PKHUDAnimating.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/10.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "PKHUDAnimating.h"

@implementation PKHUDAnimation

+ (CAAnimation *)discreteRotation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.values = @[
                         @0.0,
                         @(1.0 * M_PI / 6.0),
                         @(2.0 * M_PI / 6.0),
                         @(3.0 * M_PI / 6.0),
                         @(4.0 * M_PI / 6.0),
                         @(5.0 * M_PI / 6.0),
                         @(6.0 * M_PI / 6.0),
                         @(7.0 * M_PI / 6.0),
                         @(8.0 * M_PI / 6.0),
                         @(9.0 * M_PI / 6.0),
                         @(10.0 * M_PI / 6.0),
                         @(11.0 * M_PI / 6.0),
                         @(2.0 * M_PI),
                         ];
    
    animation.keyTimes = @[
                          @0.0,
                          @(1.0 / 12.0),
                          @(2.0 / 12.0),
                          @(3.0 / 12.0),
                          @(4.0 / 12.0),
                          @(5.0 / 12.0),
                          @(6.0 / 12.0),
                          @(7.0 / 12.0),
                          @(8.0 / 12.0),
                          @(9.0 / 12.0),
                          @(10.0 / 12.0),
                          @(11.0 / 12.0),
                          @(12.0 / 12.0),
                          ];
    animation.duration = 1.2;
    animation.calculationMode = @"discrete";
    animation.repeatCount = INT_MAX;
    return animation;
}

@end
