//
//  HUD.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HUDContentType) {
    HUDContentSuccess,
    HUDContentError,
    HUDContentProgress,
};

@interface HUD : NSObject

+ (void)showWith:(HUDContentType)type;

@end
