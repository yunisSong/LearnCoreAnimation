//
//  MaskViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/6/28.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CALayer *maskeLayer = [CALayer layer];
    maskeLayer.frame = self.imageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"Cone"];
    maskeLayer.contents = (__bridge id)maskImage.CGImage;
    self.imageView.layer.mask = maskeLayer;
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
