//
//  FilterViewController.m
//  LearnCoreAnimation
//
//  Created by Yunis on 2019/7/1.
//  Copyright © 2019 Yunis. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *testViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *test1Views;

@property (nonatomic, weak) NSTimer *timer;



@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *digits = [UIImage imageNamed:@"Digits"];

    for (UIView * view in self.testViews) {
        NSLog(@"View == %@",view);
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 0.l);
        view.layer.contentsGravity = kCAGravityResizeAspect;
    }
    for (UIView * view in self.test1Views) {
        NSLog(@"View == %@",view);
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 0.l);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        view.layer.magnificationFilter = kCAFilterNearest;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];
}

- (void)tick
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    //set hours
    [self setDigit:components.hour / 10 forView:self.testViews[0]];
    [self setDigit:components.hour % 10 forView:self.testViews[1]];
    
    //set minutes
    [self setDigit:components.minute / 10 forView:self.testViews[2]];
    [self setDigit:components.minute % 10 forView:self.testViews[3]];
    
    //set seconds
    [self setDigit:components.second / 10 forView:self.testViews[4]];
    
    [self setDigit:components.second % 10 forView:self.testViews[5]];
    
    
    
    //set hours
    [self setDigit:components.hour / 10 forView:self.test1Views[0]];
    [self setDigit:components.hour % 10 forView:self.test1Views[1]];
    
    //set minutes
    [self setDigit:components.minute / 10 forView:self.test1Views[2]];
    [self setDigit:components.minute % 10 forView:self.test1Views[3]];
    
    //set seconds
    [self setDigit:components.second / 10 forView:self.test1Views[4]];
    
    [self setDigit:components.second % 10 forView:self.test1Views[5]];
}
- (void)setDigit:(NSInteger)digit forView:(UIView *)view
{
    //adjust contentsRect to select correct digit
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
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
