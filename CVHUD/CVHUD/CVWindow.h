//
//  CVWindow.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/8.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrameView.h"


@interface CVWindow : UIWindow
@property (nonatomic, strong) FrameView *frameView;
- (void)showFrameView;
- (void)showBackground:(BOOL)animated;
- (void)hideBackground:(BOOL)animated;
@end
