//
//  CAKeyframeAnimationViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/8.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()
@property (nonatomic,strong) CALayer *colorLayer;

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(150, 150, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    [self t1];
    
    float offsetY = 200;
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(50, 250 + offsetY)];
    [bezierPath addCurveToPoint:CGPointMake(350, 250+ offsetY) controlPoint1:CGPointMake(125, 100+ offsetY) controlPoint2:CGPointMake(275, 400+ offsetY)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.lineWidth = 3.f;
    [self.view.layer addSublayer:layer];
    
    CAShapeLayer *shipLayer = [CAShapeLayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(50, 250 + offsetY);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"Ship1"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;

    [shipLayer addAnimation:animation forKey:nil];
    
    
}


- (void)t1
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.f;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor];
    
    [self.colorLayer addAnimation:animation forKey:nil];
}

@end
