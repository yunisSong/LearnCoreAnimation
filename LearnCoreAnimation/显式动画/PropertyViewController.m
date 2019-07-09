//
//  PropertyViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/8.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "PropertyViewController.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
@interface PropertyViewController ()<CAAnimationDelegate>
#else
@interface PropertyViewController ()
#endif

@property (weak, nonatomic ) IBOutlet UIView  *layerView;
@property (nonatomic,strong) CALayer *colorLayer;


@end

@implementation PropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
        [self changeColor];
}
- (void)changeColor
{
    //create a new random color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //create a basic animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    animation.duration = 1.f;
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    //set the backgroundColor property to match animation toValue
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
}

@end
