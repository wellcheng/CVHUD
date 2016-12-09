//
//  CVHUDErrorView.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/9.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUDErrorView.h"

@interface CVHUDErrorView ()
@property (nonatomic, strong) CAShapeLayer *upLeftStartDashLayer;
@property (nonatomic, strong) CAShapeLayer *bottomLeftStartDashLayer;
@end

@implementation CVHUDErrorView

- (instancetype)init
{
    return [self initWithTitle:nil subtitle:nil];
}

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    self = [super initWithImage:nil title:title subtitle:subtitle];
    if (self) {
        [self initLayer];
    }
    return self;
}

- (void)initLayer {
    _upLeftStartDashLayer = [CVHUDErrorView generateDashLayer];
    _upLeftStartDashLayer.position = self.layer.position;
    [self.layer addSublayer:_upLeftStartDashLayer];
    
    _bottomLeftStartDashLayer = [CVHUDErrorView generateDashLayer];
    _bottomLeftStartDashLayer.position = self.layer.position;
    [self.layer addSublayer:_bottomLeftStartDashLayer];
}

- (void)startAnimation {
    CABasicAnimation *upLeftAnim = [self generateRotationAnimationWith:-45];
    CABasicAnimation *bottomLeftAnim = [self generateRotationAnimationWith:45];
    
    self.upLeftStartDashLayer.transform = CATransform3DMakeRotation(-45 * (M_PI / 180), 0.0, 0.0, 1.0);
    self.bottomLeftStartDashLayer.transform = CATransform3DMakeRotation(45 * (M_PI / 180), 0.0, 0.0, 1.0);
    
    [self.upLeftStartDashLayer addAnimation:upLeftAnim forKey:@"upLeftStartDashLayer"];
    [self.bottomLeftStartDashLayer addAnimation:bottomLeftAnim forKey:@"bottomLeftStartDashLayer"];
}
- (void)stopAnimation {
    [self.upLeftStartDashLayer removeAnimationForKey:@"upLeftStartDashLayer"];
    [self.bottomLeftStartDashLayer removeAnimationForKey:@"bottomLeftStartDashLayer"];
}


- (CABasicAnimation *)generateRotationAnimationWith:(CGFloat)angle {
    static NSString *animationKeyPath = @"transform.rotation.z";
    CABasicAnimation *anim = nil;
    if (NSStringFromClass([CASpringAnimation class])) {
        CASpringAnimation *spAnim = [CASpringAnimation animationWithKeyPath:animationKeyPath];
        spAnim.damping = 1.5;
        spAnim.mass = 0.22;
        spAnim.initialVelocity = 0.5;
        anim = spAnim;
    } else {
        anim = [CABasicAnimation animationWithKeyPath:animationKeyPath];
    }
    
    anim.fromValue = @(0);
    anim.toValue = @(angle * (M_PI / 180.0));
    anim.duration = 1.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    return anim;
}

+ (CAShapeLayer *)generateDashLayer {
    CAShapeLayer *dash = [CAShapeLayer layer];
    dash.frame = CGRectMake(0, 0, 88, 88);
    dash.path = ({
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 44)];
        [path addLineToPoint:CGPointMake(88, 44)];
        path.CGPath;
    });
    dash.lineCap = kCALineCapRound;
    dash.lineJoin = kCALineJoinRound;
    dash.fillColor = nil;
    dash.strokeColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1].CGColor;
    dash.lineWidth = 6;
    dash.fillMode = kCAFillModeForwards;
    return dash;
}
@end
