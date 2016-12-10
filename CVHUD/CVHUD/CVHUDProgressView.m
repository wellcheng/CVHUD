//
//  CVHUDProgressView.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/10.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUDProgressView.h"

@implementation CVHUDProgressView

- (instancetype)init
{
    return [super initWithImage:[UIImage imageNamed:@"progress_activity"]
                          title:nil subtitle:nil];
}

- (void)startAnimation {
    [self.imageView.layer addAnimation:[PKHUDAnimation discreteRotation] forKey:@"CAAnimation"];
}

- (void)stopAnimation {
    
}

@end
