//
//  BorderViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/6/28.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "BorderViewController.h"

@interface BorderViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *upView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *cenTerView;

@end

@implementation BorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.upView.backgroundColor = [UIColor clearColor];
    self.upView.layer.shadowOpacity = 0.5f;
    self.cenTerView.layer.shadowOpacity = 0.5f;
    self.bottomView.layer.shadowOpacity = 0.5f;

    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.upView.bounds);
    self.upView.layer.shadowPath = squarePath;
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.cenTerView.bounds);
    self.cenTerView.layer.shadowPath = circlePath;
    
    
    
    
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
