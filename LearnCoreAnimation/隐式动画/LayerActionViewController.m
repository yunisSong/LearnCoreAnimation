//
//  LayerActionViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/8.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "LayerActionViewController.h"

@interface LayerActionViewController ()
@property (weak, nonatomic ) IBOutlet UIView  *layerView;
@property (strong,nonatomic) CALayer *colorLayer;
@end

@implementation LayerActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading thew from its nib.
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.colorLayer.position = CGPointMake(self.layerView.bounds.size.width / 2, self.layerView.bounds.size.height / 2);

    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1.f;
    self.colorLayer.actions = @{@"backgroundColor":transition};
    [self.layerView.layer addSublayer:self.colorLayer];

}

- (void)changeColor
{
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    
}
- (void)t2WithPoint:(CGPoint)point {
 
    //get the touch point
    //check if we've tapped the moving layer
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        //randomize the layer background color
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    } else {
        //otherwise (slowly) move the layer to new position
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self changeColor];
    CGPoint point = [[touches anyObject] locationInView:self.layerView];
    [self t2WithPoint:point];
}
- (void)t1 {
    NSLog(@"%@",[self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);
    [UIView beginAnimations:nil context:nil];
    NSLog(@"beginAnimations %@",[self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);
    [UIView commitAnimations];
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
