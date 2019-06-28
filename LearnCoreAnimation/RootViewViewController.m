//
//  ViewController.m
//  UP2019
//
//  Created by Yunis on 2019/1/2.
//  Copyright © 2019年 Yunis. All rights reserved.
//

#import "RootViewViewController.h"

@interface RootViewViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tab;
@property(nonatomic,strong)NSArray *sourceArray;

@end

@implementation RootViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UP2019"];
    self.tab.delegate = self;
    self.tab.dataSource = self;
}
#pragma mark - Delegate
//代理方法
#pragma mark -
#pragma mark Table View DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UP2019"];
    cell.textLabel.text = [self cellTitle:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row >= self.sourceArray.count) {
        return;
    }
    Class cls = NSClassFromString([self cellClass:indexPath]);
    if ( cls )
    {
        UIViewController *ctr = [cls new];
        ctr.title = [self cellTitle:indexPath];
        [self.navigationController pushViewController:ctr animated:YES];
    }
}
- (NSArray *)sourceArray{
    if (_sourceArray == nil) {
        _sourceArray = ({
            NSArray *arr = @[
                             @{@"title":@"寄宿图",@"class":@"ViewController"},
                             @{@"title":@"图形几何学-anchorPoint",@"class":@"LockViewController"},
                             @{@"title":@"图形几何学-hit",@"class":@"HitTestViewController"},
                             @{@"title":@"视觉效果-圆角",@"class":@"RadiusViewController"},
                             @{@"title":@"视觉效果-边框",@"class":@"BorderViewController"},

        
                             ];
            arr;
        });
    }
    
    return _sourceArray;
}
- (NSString *)cellTitle:(NSIndexPath *)index {
    NSDictionary *d = self.sourceArray[index.row];
    return d[@"title"];
}
- (NSString *)cellClass:(NSIndexPath *)index {
    NSDictionary *d = self.sourceArray[index.row];
    return d[@"class"];
}
@end