//
//  CAEmitterLayerViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/4.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CAEmitterLayerViewController.h"

@interface CAEmitterLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width/2.f, emitter.frame.size.height/2.f);

    
    /*
     这种粒子的某一属性的初始值。
     比如，color属性指定了一个可以混合图片内容颜色的混合色。在示例中，我们将它设置为桔色。
     例子某一属性的变化范围。
     比如emissionRange属性的值是2π，这意味着例子可以从360度任意位置反射出来。如果指定一个小一些的值，就可以创造出一个圆锥形
     指定值在时间线上的变化。
     比如，在示例中，我们将alphaSpeed设置为-0.4，就是说例子的透明度每过一秒就是减少0.4，这样就有发射出去之后逐渐小时的效果。
     */
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"Spark"].CGImage;
    cell.birthRate = 200;//产生速率/每秒
    cell.lifetime = 5.0;//存在时间
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;//每秒钟减去 0.4
    cell.velocity = 50;//速度
    cell.velocityRange = 50;//速度区间
    cell.emissionRange = M_PI / 6.f;//扩散的范围
    emitter.emitterCells = @[cell];
    
    CATransform3D tran = CATransform3DIdentity;
    tran =CATransform3DRotate(tran, - M_PI/2.f, 0, 0, 1);
    emitter.transform = tran;
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
