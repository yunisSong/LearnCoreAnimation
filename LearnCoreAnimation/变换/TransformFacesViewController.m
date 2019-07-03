//
//  TransformFacesViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/1.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "TransformFacesViewController.h"
#import <GLKit/GLKit.h>
@interface TransformFacesViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *faces;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation TransformFacesViewController

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.3

- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(0, 1, -0.5));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0.5 alpha:shadow];
    layer.backgroundColor = color.CGColor;

}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
//    face.backgroundColor = [UIColor whiteColor];
    //center the face view within the container
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
    [self applyLightingToFace:face.layer];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;

    /*
     CATransform3DRotate (CATransform3D t, CGFloat angle,
     CGFloat x, CGFloat y, CGFloat z)
     */
    
    //旋转  45 围绕 x 轴
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    //旋转  45 围绕 y 轴
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
    
    float offset = 50.f;
    
    //向 z 轴 移动 50 px
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, offset);
    [self addFace:0 withTransform:transform];
    //add cube face 2
    //向 x 轴 移动 50 px
    transform = CATransform3DMakeTranslation(offset, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
     //向 y 轴 移动 - 50 px
    transform = CATransform3DMakeTranslation(0, - offset, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    //向 y 轴 移动  50 px
    transform = CATransform3DMakeTranslation(0, offset, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    //向 x 轴 移动  - 50 px
    transform = CATransform3DMakeTranslation(- offset, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    //向 z 轴 移动  - 50 px
    transform = CATransform3DMakeTranslation(0, 0, - offset);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
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
