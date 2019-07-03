//
//  CAReplicatorLayerViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/2.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CAReplicatorLayerViewController.h"

@interface CAReplicatorLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CAReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self t1];

}
- (void)t1 {
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicatorLayer];
    replicatorLayer.instanceCount = 10;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.f, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, - 200, 0);
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceBlueOffset = - 0.1;
    replicatorLayer.instanceGreenOffset = - 0.1;
    replicatorLayer.instanceRedOffset = - 0.1;
    replicatorLayer.instanceAlphaOffset = - 0.05;

    CALayer * subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(100, 100, 100, 100);
    subLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:subLayer];
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
