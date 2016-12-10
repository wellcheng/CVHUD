//
//  ViewController.m
//  CVHUD
//
//  Created by chengwei06 on 2016/12/4.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

#import "ViewController.h"
#import "HUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showOne:(id)sender {
    [HUD showWith:HUDContentSuccess];
}

- (IBAction)showTwo:(id)sender {
    [HUD showWith:HUDContentProgress];
}

- (IBAction)showThree:(id)sender {
    [HUD showWith:HUDContentError];
}


@end
