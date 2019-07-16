//
//  RemoveViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/9.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "RemoveViewController.h"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
@interface RemoveViewController ()<CAAnimationDelegate>
#else
@interface RemoveViewController ()
#endif

@property (nonatomic, strong) CALayer *shipLayer;

@end

@implementation RemoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(200, 400);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed:@"Ship1"].CGImage;
    [self.view.layer addSublayer:self.shipLayer];
}
- (IBAction)start:(id)sender {
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
}
- (IBAction)stop:(id)sender {
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];

}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //log that the animation stopped
    NSLog(@"The animation stopped (finished: %@)", flag? @"YES": @"NO");
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
