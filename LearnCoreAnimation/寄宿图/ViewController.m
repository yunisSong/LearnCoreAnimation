//
//  ViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2018/9/29.
//  Copyright © 2018年 Yunis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>
@property (strong, nonatomic)UIView *bgView;
@property (strong, nonatomic)CALayer *blueLayer;
@end

@implementation ViewController
- (void)dealloc
{
    self.blueLayer.delegate = nil;
    NSLog(@"__%d____%s__",__LINE__,__FILE__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgView = [UIView new];
    self.bgView.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:self.bgView];
    self.bgView.center = self.view.center;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *blueLayer = [CALayer new];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    [self.bgView.layer addSublayer:blueLayer];
    
    UIImage *image = [UIImage imageNamed:@"batman"];
    blueLayer.contents = (__bridge id)image.CGImage;
    blueLayer.contentsGravity = kCAGravityCenter;
    //是否显示超出边界的内容
    blueLayer.masksToBounds = YES;
    blueLayer.delegate = self;
    //设置分辨率
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [blueLayer  display];
    self.blueLayer = blueLayer;

    /*
     显示图片的一部分
     
     0 0 0.5  0.5 显示左上 1/4
     0 0 1  0.5 显示上面 1/2
     
     */
//    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) ￼toLayer:blueLayer];
//    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) ￼toLayer:blueLayer];
//    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) ￼toLayer:blueLayer];
//    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) ￼toLayer:blueLayer];
//    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 1, 0.5) ￼toLayer:blueLayer];

    
}
- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect ￼toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    
    //set contentsRect
    layer.contentsRect = rect;
    
}
#pragma mark CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 2.f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
