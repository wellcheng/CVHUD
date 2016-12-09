//
//  CVHUD.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUD.h"
#import "CVWindow.h"
#import "PKHUDAnimating.h"

typedef void(^TimerAction)(BOOL isOK);

@interface CVHUD()
@property (nonatomic, strong) CVWindow *window;
@property (nonatomic, strong) NSTimer *hideTimer;
@property (nonatomic, strong) NSDictionary<NSString *, TimerAction>* timeActions;
@property (nonatomic, assign) BOOL userInteractionOnUnderlyingViewsEnabled;
@property (nonatomic, assign) BOOL dimsBackground;
@property (nonatomic, assign, getter=isVisible) BOOL visible;
@end


@implementation CVHUD
+(instancetype)sharedHUD {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _window = [[CVWindow alloc] init];
        _dimsBackground = NO;
        [self addObserver];
        [self commanInit];
    }
    return self;
}

#pragma mark - Life Cycle

- (void)commanInit {
    self.userInteractionOnUnderlyingViewsEnabled = NO;
    self.window.frameView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                              UIViewAutoresizingFlexibleLeftMargin |
                                              UIViewAutoresizingFlexibleRightMargin |
                                              UIViewAutoresizingFlexibleBottomMargin);
}

- (void)dealloc {
    [self removeObserver];
}

#pragma mark - Setter & Getter

- (UIVisualEffect *)effect {
    return self.window.frameView.effect;
}

- (void)setEffect:(UIVisualEffect *)effect {
    self.window.frameView.effect = effect;
}

- (UIView<PKHUDAnimating> *)contentView {
    return self.window.frameView.content;
}

- (void)setContentView:(UIView<PKHUDAnimating> *)contentView {
    self.window.frameView.content = contentView;
    [self startAnimatingContentView];
}
- (BOOL)isVisible {
    return !self.window.isHidden;
}
- (BOOL)isUserInteractionOnUnderlyingViewsEnabled {
    return !self.window.isUserInteractionEnabled;
}

- (void)setUserInteractionOnUnderlyingViewsEnabled:(BOOL)userInteractionOnUnderlyingViewsEnabled {
    self.window.userInteractionEnabled = !userInteractionOnUnderlyingViewsEnabled;
}

#pragma mark - Event

- (void)show {
    [self.window showFrameView];
    if (self.dimsBackground) {
        [self.window showBackground:YES];
    }
    [self startAnimatingContentView];
}

#pragma mark - Observer

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
}

- (void)removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - Animation
- (void)startAnimatingContentView {
    if (self.isVisible && [self.contentView conformsToProtocol:@protocol(PKHUDAnimating)]) {
        UIView<PKHUDAnimating> *view = self.contentView;
        [view startAnimation];
    }
}
- (void)stopAnimatingContentView {
    if ([self.contentView conformsToProtocol:@protocol(PKHUDAnimating)]) {
        UIView<PKHUDAnimating> *view = self.contentView;
        [view stopAnimation];
    }
}

@end
