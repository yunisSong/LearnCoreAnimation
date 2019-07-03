//
//  CATextLayerViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/2.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CATextLayerViewController.h"

@interface CATextLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *lableVIew;

@end

@implementation CATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.lableVIew.bounds;
    [self.lableVIew.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15.f];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"这是一段使用 CATextLayer 显示的内容";
    textLayer.string = text;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
    
    
    
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
