//
//  CVHUDSuccessView.h
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "CVHUDSquareBaseView.h"
#import "PKHUDAnimating.h"


/**
 在原来的 BaseView 上，添加一层 layer。
 遵循 animation 协议。
 可以开启动画，关闭动画。在动画方法中做响应的动画即可。
 */
@interface CVHUDSuccessView : CVHUDSquareBaseView <PKHUDAnimating>
@end
