//
//  CAReplicatorLayerView.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/2.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "CAReplicatorLayerView.h"

@implementation CAReplicatorLayerView

+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}
- (id)initWithFrame:(CGRect)frame
{
    //this is called when view is created in code
    if ((self = [super initWithFrame:frame])) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    //this is called when view is created from a nib
    [super awakeFromNib];
    [self setUp];
}
- (void)setUp
{
    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.instanceCount = 2;
    
    CATransform3D tranform = CATransform3DIdentity;
    CGFloat verticalOffset = self.bounds.size.height + 2;
    tranform = CATransform3DTranslate(tranform, 0, verticalOffset, 0);
    tranform = CATransform3DScale(tranform, 1, -1, 0);
    layer.instanceTransform = tranform;
    
    layer.instanceAlphaOffset = - 0.8;

}
@end
