//
//  RadiusViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/6/28.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "RadiusViewController.h"

@interface RadiusViewController ()
@property (weak, nonatomic) IBOutlet UIView *upView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation RadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.upView.layer.cornerRadius = 20.f;
    self.bottomView.layer.cornerRadius = 20.f;
    

    self.bottomView.layer.masksToBounds = YES;
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
