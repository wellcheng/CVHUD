//
//  CVHUDSuccessView.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUDSuccessView.h"

@interface CVHUDSuccessView ()
@property (nonatomic, strong) CAShapeLayer *checkmarkShapeLayer;
@end

static NSString *checkmarkStrokeAnimKey = @"checkmarkStrokeAnim";

@implementation CVHUDSuccessView
- (CAShapeLayer *)checkmarkShapeLayer {
    if (!_checkmarkShapeLayer) {
        // 画一个对号
        UIBezierPath *checkmarkPath = [UIBezierPath bezierPath];
        [checkmarkPath moveToPoint:CGPointMake(4, 27)];
        [checkmarkPath addLineToPoint:CGPointMake(34, 56)];
        [checkmarkPath addLineToPoint:CGPointMake(88, 0)];

        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.frame = CGRectMake(3, 3, 88, 56);
        layer.path = checkmarkPath.CGPath;
        layer.fillMode = kCAFillModeForwards;
        layer.lineCap = kCALineCapRound;
        layer.lineJoin = kCALineJoinRound;
        layer.fillColor = nil;
        layer.strokeColor = [UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.0].CGColor;
        layer.lineWidth = 6.0;
        _checkmarkShapeLayer = layer;
    }
    return _checkmarkShapeLayer;
}

- (instancetype)init
{
    return [self initWithTitle:nil subTitle:nil];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    
    if (self = [super initWithImage:nil title:title subtitle:subTitle]) {
        [self.layer addSublayer:self.checkmarkShapeLayer];
        self.checkmarkShapeLayer.position = self.layer.position;
    }
    return self;
}
#pragma mark - Animation
- (void)startAnimation
{
    // 创建一个关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    anim.values = @[@0, @1];
    anim.keyTimes = @[@0, @1];
    anim.duration = 0.35f;
    
    [self.checkmarkShapeLayer addAnimation:anim forKey:checkmarkStrokeAnimKey];
}

- (void)stopAnimation
{
    [self.checkmarkShapeLayer removeAnimationForKey:checkmarkStrokeAnimKey];
}
@end
