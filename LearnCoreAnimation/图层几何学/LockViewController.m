//
//  LockViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/6/27.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "LockViewController.h"

@interface LockViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *hour;
@property (weak, nonatomic) IBOutlet UIImageView *minute;
@property (weak, nonatomic) IBOutlet UIImageView *second;

@property (nonatomic, weak) NSTimer *timer;
@end

@implementation LockViewController
- (void)dealloc
{
    NSLog(@"__%d____%s__",__LINE__,__FILE__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.hour.layer.anchorPoint = CGPointMake(0.5, 0.85);
    self.minute.layer.anchorPoint = CGPointMake(0.5, 0.85);
    self.second.layer.anchorPoint = CGPointMake(0.5, 0.85);
    
    typeof(self) __weak weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        [weakSelf tick];
    }];
    [self tick];
}


- (void)tick {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    //rotate hands
    self.hour.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minute.transform = CGAffineTransformMakeRotation(minsAngle);
    self.second.transform = CGAffineTransformMakeRotation(secsAngle);
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
