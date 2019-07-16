//
//  TimeOffsetViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/9.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "TimeOffsetViewController.h"

@interface TimeOffsetViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *logLabel;
@property (weak, nonatomic) IBOutlet UISlider *timeOffset;
@property (weak, nonatomic) IBOutlet UISlider *speed;
@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, strong) CALayer *shipLayer;
@end

@implementation TimeOffsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.bezierPath = [[UIBezierPath alloc] init];
    [self.bezierPath moveToPoint:CGPointMake(100, 150)];
    [self.bezierPath addCurveToPoint:CGPointMake(400, 150) controlPoint1:CGPointMake(175, 0) controlPoint2:CGPointMake(325, 300)];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = self.bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 64, 64);
    self.shipLayer.position = CGPointMake(100, 150);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship1"].CGImage;
    [self.containerView.layer addSublayer:self.shipLayer];
    //set initial values
    [self updateSliders];
}
- (IBAction)updateSliders
{
    CFTimeInterval timeOffset = self.timeOffset.value;
    NSString *timeOffsetText = [NSString stringWithFormat:@"%0.2f", timeOffset];
    float speed = self.speed.value;
    NSString *speedText = [NSString stringWithFormat:@"%0.2f", speed];
    
    self.logLabel.text = [NSString stringWithFormat:@"timeOffset == %@ speed == %@",timeOffsetText,speedText];
}
- (IBAction)play:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.timeOffset = self.timeOffset.value;
    animation.speed = self.speed.value;
    animation.duration = 1.0;
    animation.path = self.bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = NO;
//    animation.autoreverses = YES;
    [self.shipLayer addAnimation:animation forKey:@"slide"];
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
