//
//  Transform_RotationViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/9.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "Transform_RotationViewController.h"

@interface Transform_RotationViewController ()

@end

@implementation Transform_RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(200, 400);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"Ship1"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2;
    animation.byValue = @(M_PI * 2);
    [shipLayer addAnimation:animation forKey:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
