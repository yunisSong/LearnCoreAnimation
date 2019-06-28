//
//  HitTestViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/6/27.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "HitTestViewController.h"

@interface HitTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *tView;
@property(nonatomic,strong)CALayer *blueLayer;
@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CALayer *blueLayer = [CALayer new];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    [self.tView.layer addSublayer:blueLayer];
    self.blueLayer = blueLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    point = [self.tView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.tView.layer containsPoint:point]) {
        NSLog(@"tView");
        point = [self.blueLayer convertPoint:point fromLayer:self.tView.layer];
        if ([self.blueLayer containsPoint:point]) {
            NSLog(@"blueLayer");
        }
    }
    CGPoint point1 = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.tView.layer hitTest:point1];
    if (layer == self.blueLayer) {
        NSLog(@"11 blueLayer");

    }else if (layer == self.tView.layer)
    {
        NSLog(@"11 tView");

    }
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
