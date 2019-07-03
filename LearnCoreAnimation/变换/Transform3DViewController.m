//
//  Transform3DViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/1.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "Transform3DViewController.h"

@interface Transform3DViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@end

@implementation Transform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.imageView1.layer.transform = transform;
    
    CATransform3D transform2 = CATransform3DIdentity;
    //apply perspective
    transform2.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform2 = CATransform3DRotate(transform2, M_PI_4, 0, 1, 0);
    //apply to layer
    self.imageView2.layer.transform = transform2;
    
    
    CATransform3D transform3 = CATransform3DIdentity;
    //apply perspective
    transform3.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform3 = CATransform3DRotate(transform3, -M_PI_4, 0, 1, 0);
    //apply to layer
    self.imageView3.layer.transform = transform3;
    
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
