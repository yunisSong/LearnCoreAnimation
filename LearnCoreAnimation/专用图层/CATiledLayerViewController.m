//
//  CATiledLayerViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/3.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CATiledLayerViewController.h"

@interface CATiledLayerViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollowView;
@property(nonatomic,strong)CATiledLayer *tileLayer;
@end

@implementation CATiledLayerViewController
- (void)dealloc
{
    self.tileLayer.delegate = nil;
    NSLog(@"__%d____%s__",__LINE__,__FILE__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2018, 2048);
    tileLayer.delegate = self;
    [self.scrollowView.layer addSublayer:tileLayer];

    self.scrollowView.contentSize = tileLayer.frame.size;
    [tileLayer setNeedsDisplay];
    self.tileLayer = tileLayer;
    
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
{
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    int x = floor(bounds.origin.x/ layer.tileSize.width);
    int y = floor(bounds.origin.y / layer.tileSize.height);
    
    NSString *imageName = [NSString stringWithFormat:@" Snowman_%02i_%02i",x,y];
    NSLog(@"imageName == %@",imageName);
    UIImage *tileImage = [UIImage imageNamed:imageName];
    
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}


@end
