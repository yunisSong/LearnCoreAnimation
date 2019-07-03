//
//  CAGradientLayerViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/2.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self t1];
//    [self t2];
    [self t3];

}
- (void)t1 {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view1.bounds;
    [self.view1.layer addSublayer:gradientLayer];
    
    gradientLayer.colors = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    
    gradientLayer.startPoint = CGPointMake(0,0);
    gradientLayer.endPoint = CGPointMake(1, 1);
}
- (void)t2 {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view1.bounds;
    [self.view1.layer addSublayer:gradientLayer];
    
    gradientLayer.colors = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    
    gradientLayer.startPoint = CGPointMake(0.5,0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
}
- (void)t3 {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view1.bounds;
    [self.view1.layer addSublayer:gradientLayer];
    
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id) [UIColor yellowColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    gradientLayer.locations = @[@0.0, @0.25, @0.5];

    gradientLayer.startPoint = CGPointMake(0.5,0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
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
