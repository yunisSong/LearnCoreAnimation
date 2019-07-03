//
//  TransformViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/1.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation TransformViewController
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
     弧度用数学常量pi的倍数表示，一个pi代表180度，所以四分之一的pi就是45度。
     */
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//    self.layerView.layer.affineTransform = transform;
    
    /* 先缩小50%，再旋转30度，最后向右移动200个像素（清单5.2）。图5.4显示了图层变换最后的结果。*/
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformTranslate(transform, 200, 0);
    transform = CGAffineTransformRotate(transform, RADIANS_TO_DEGREES(30.f));

    self.layerView.layer.affineTransform = transform;
    
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
