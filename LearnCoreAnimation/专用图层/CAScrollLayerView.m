//
//  CAScrollLayerView.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/3.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CAScrollLayerView.h"

@implementation CAScrollLayerView
+ (Class)layerClass
{
    return [CAScrollLayer class];
}

- (void)setup{
    self.layer.masksToBounds = YES;
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    [self.layer scrollPoint:offset];
    [recognizer setTranslation:CGPointZero inView:self];
}
@end
