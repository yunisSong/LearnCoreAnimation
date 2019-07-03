//
//  CATransformLayerViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/2.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CATransformLayerViewController.h"

@interface CATransformLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation CATransformLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -80, 0, 0);
    c1t = CATransform3DRotate(c1t, -M_PI_4/2.f, 1, 0, 0);
    c1t = CATransform3DRotate(c1t, -M_PI_4/2.f, 0, 1, 0);
    CALayer *layer = [self cubeWithTransform:c1t];
    [self.layerView.layer addSublayer:layer];

    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 80, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *layer1 = [self cubeWithTransform:c2t];


    [self.layerView.layer addSublayer:layer1];
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    self.layerView.layer.sublayerTransform = pt;
    
}
- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //create cube face layer
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(0, 0, 100, 100);
    
    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)t
{
    CATransformLayer *cube = [CATransformLayer layer];
    cube.backgroundColor = [UIColor yellowColor].CGColor;
    float offset = 50.f;
    
    //向 z 轴移动 offset
    CATransform3D tranform = CATransform3DIdentity;
    tranform = CATransform3DTranslate(tranform, 0, 0, offset);
    [cube addSublayer:[self faceWithTransform:tranform]];
    
    //向 z 轴移动 - offset
    tranform = CATransform3DIdentity;
    tranform = CATransform3DTranslate(tranform, 0, 0, - offset);
    [cube addSublayer:[self faceWithTransform:tranform]];
    
    //向 x 轴移动  offset,同时绕 y 轴旋转 90度
    tranform = CATransform3DIdentity;
    tranform = CATransform3DTranslate(tranform, offset, 0, 0);
    tranform = CATransform3DRotate(tranform, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:tranform]];

    //向 x 轴移动  -offset,同时绕 y 轴旋转 -90度
    tranform = CATransform3DIdentity;
    tranform = CATransform3DTranslate(tranform, - offset, 0, 0);
    tranform = CATransform3DRotate(tranform, - M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:tranform]];

    
    //向 y 轴移动  offset,同时绕 x 轴旋转 -90度
    tranform = CATransform3DIdentity;
    tranform = CATransform3DTranslate(tranform, 0, offset, 0);
    tranform = CATransform3DRotate(tranform, - M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:tranform]];

    //向 y 轴移动  -offset,同时绕 y 轴旋转 90度
    tranform = CATransform3DIdentity;
    tranform = CATransform3DTranslate(tranform, 0, - offset, 0);
    tranform = CATransform3DRotate(tranform,  M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:tranform]];
    
    
    //设置 position / anchor point
    CGSize containerSize = self.layerView.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    //设置 3d transform
    cube.transform = t;
    return cube;
}

@end
