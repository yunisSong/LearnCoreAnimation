//
//  RepeatCountViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/9.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "RepeatCountViewController.h"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
@interface RepeatCountViewController ()<CAAnimationDelegate>
#else
@interface RepeatCountViewController ()
#endif
@property (weak, nonatomic) IBOutlet UITextField *durationField;
@property (weak, nonatomic) IBOutlet UITextField *repeatCountField;
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIButton *startBtr;
@property (nonatomic, strong) CALayer *shipLayer;

@end

@implementation RepeatCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(120, 120);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship1"].CGImage;
    [self.layerView.layer addSublayer:self.shipLayer];
    
    
    
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 128, 256);
    doorLayer.position = CGPointMake( 64, 650);
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.contents = (__bridge id)[UIImage imageNamed: @"Door.png"].CGImage;
    [self.view.layer addSublayer:doorLayer];
    //apply perspective transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    //apply swinging animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}
- (void)setControlsEnabled:(BOOL)enabled
{
    for (UIControl *control in @[self.durationField, self.repeatCountField, self.startBtr]) {
        control.enabled = enabled;
        control.alpha = enabled? 1.0f: 0.25f;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.repeatCountField resignFirstResponder];
    [self.durationField resignFirstResponder];
}
- (IBAction)strat:(id)sender {
    CFTimeInterval duration = [self.durationField.text doubleValue];
    float repeatCount = [self.repeatCountField.text floatValue];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    //disable controls
    [self setControlsEnabled:NO];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //reenable controls
    [self setControlsEnabled:YES];
}
@end
