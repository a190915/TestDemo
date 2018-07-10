//
//  ViewController.m
//  TestDemo
//
//  Created by admin on 2017/3/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonPress:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonPress:)];

    
    
}
- (void)leftBarButtonPress:(UIBarButtonItem *)buttonItem {
    int a;
    NSLog(@"%d", a = 2);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"app-Prefs:root"]];
}

- (void)rightBarButtonPress:(UIBarButtonItem *)buttonItem {
    FirstViewController *firstVC = [FirstViewController new];
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
