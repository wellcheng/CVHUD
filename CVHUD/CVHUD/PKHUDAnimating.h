//
//  PKHUDAnimating.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/7.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKHUDAnimating <NSObject>

- (void)startAnimation;
- (void)stopAnimation;

@end

@interface PKHUDAnimation : NSObject
+ (CAAnimation *)discreteRotation;
@end
