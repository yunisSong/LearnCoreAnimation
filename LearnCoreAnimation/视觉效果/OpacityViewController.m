//
//  OpacityViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/1.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "OpacityViewController.h"

@interface OpacityViewController ()

@end

@implementation OpacityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view from its nib.
    UIButton *btr1 = [self customButton];
    UIButton *btr2 = [self customButton];
    UIButton *btr3 = [self customButton];

    [self.view addSubview:btr1];
    [self.view addSubview:btr2];
    [self.view addSubview:btr3];

    btr1.center = CGPointMake(self.view.center.x , self.view.center.y - 100);
    btr2.center = CGPointMake(self.view.center.x , self.view.center.y);
    btr3.center = CGPointMake(self.view.center.x , self.view.center.y + 100);

    btr2.alpha = 0.5;
    btr3.alpha = 0.5;

    /*
     在 iOS7 以后 UIViewGroupOpacity 默认为 YES ，所以下面的代码可以不要，与abtr2 显示的效果一样。
     */
    btr3.layer.shouldRasterize = YES;
    btr3.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
}
- (UIButton *)customButton
{
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *btr = [[UIButton alloc] initWithFrame:frame];
    btr.backgroundColor = [UIColor whiteColor];
    btr.layer.cornerRadius = 10;
    
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello world";
    label.textAlignment = NSTextAlignmentCenter;
    [btr addSubview:label];
    
    return btr;
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
