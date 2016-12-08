//
//  CVHUD.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUD.h"

typedef void(^TimerAction)(BOOL isOK);

@interface CVHUD()
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSTimer *hideTimer;
@property (nonatomic, strong) NSDictionary<NSString *, TimerAction>* timeActions;
@property (nonatomic, assign) BOOL userInteractionOnUnderlyingViewsEnabled;
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
        [self addObserver];
        [self cv_init];
    }
    return self;
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
}

- (void)cv_init {
    self.window
}

#pragma mark - Setter & Getter
- (BOOL)isUserInteractionOnUnderlyingViewsEnabled {
    return !self.window.isUserInteractionEnabled;
}

- (void)setUserInteractionOnUnderlyingViewsEnabled:(BOOL)userInteractionOnUnderlyingViewsEnabled {
    self.window.userInteractionEnabled = !userInteractionOnUnderlyingViewsEnabled;
}

- (void)show {
    
}
@end
