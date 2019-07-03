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
@property (weak, nonatomic) IBOutlet UIView *bottomSuperView;

@end

@implementation RadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //圆角
    self.upView.layer.cornerRadius = 20.f;
    self.bottomView.layer.cornerRadius = 20.f;
    

    //边框
    self.upView.layer.borderWidth = 5.f;
    self.bottomView.layer.borderWidth = 5.f;
    
    
    
    //是否裁剪
    self.bottomView.layer.masksToBounds = YES;
    
    //阴影
    self.upView.layer.shadowColor = [UIColor redColor].CGColor;
    self.upView.layer.shadowRadius = 3;
    self.upView.layer.shadowOffset = CGSizeMake(0, 3);
    self.upView.layer.shadowOpacity = .7;
    
    //因为设置了 masksToBounds 所以不生效 如果想有阴影，只需要给他添加一个俯视图，俯视图加阴影就行了
//    self.bottomView.layer.shadowColor = [UIColor redColor].CGColor;
//    self.bottomView.layer.shadowRadius = 3;
//    self.bottomView.layer.shadowOffset = CGSizeMake(0, 3);
//    self.bottomView.layer.shadowOpacity = .7;
    
    self.bottomSuperView.layer.shadowColor = [UIColor redColor].CGColor;
    self.bottomSuperView.layer.shadowRadius = 3;
    self.bottomSuperView.layer.shadowOffset = CGSizeMake(0, 3);
    self.bottomSuperView.layer.shadowOpacity = .7;
    
    
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
