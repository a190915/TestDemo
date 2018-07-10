//
//  FirstViewController.m
//  TestDemo
//
//  Created by admin on 2017/3/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FirstViewController.h"
#import <WebKit/WebKit.h>
@interface FirstViewController ()<WKUIDelegate, WKNavigationDelegate,UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSArray *area;
@property (nonatomic, strong) NSDictionary *picKViewDic;

@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) NSArray *dataSourceArrM;

@property (nonatomic, strong) NSString *selectedArea;



@end

#define currentView_Center CGPointMake([UIScreen mainScreen].bounds.size.width * 1.0 / 2, [UIScreen mainScreen].bounds.size.height * 1.0 / 2)
@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    pickView.delegate = self;
    pickView.dataSource = self;
    [pickView setShowsSelectionIndicator:YES];
    pickView.center = currentView_Center;
    [self.view addSubview:pickView];
    self.area = @[@"孔令辉",@"刘国梁"];
    self.area = [self.area sortedArrayUsingSelector:@selector(compare:)];
    self.dataSourceArr = @[@"王皓",@"马琳",@"王励勤",@"张继科",@"马龙",@"许昕",@"樊振东",@"周雨",@"尚坤",@"波尔"];
    self.dataSourceArrM = @[@"丁宁",@"刘诗雯",@"李晓霞",@"陈梦",@"武杨",@"郭跃"];
    self.picKViewDic = @{self.area[0]:self.dataSourceArr, self.area[1]:self.dataSourceArrM};
    self.selectedArea = self.area[0];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    //[self.view addSubview:self.webView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}
- (void)dateChange:(UIDatePicker *)datePicker {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"YYYY年MM月dd日";
    
    
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.area.count;
    }
    return [self.picKViewDic[_selectedArea] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.area[row];
    }
    return self.picKViewDic[_selectedArea][row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _selectedArea = self.area[row];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 100;
    }
    return 220;
}

#pragma mark - lazy loading

- (WKWebView *)webView {
    
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 64)];
        NSLog(@"CGRectGetWidth(self.view.bounds) = %.2f,CGRectGetHeight(self.view.bounds) = %.2f, [UIScreen mainScreen].bounds.size.width = %.2f", self.view.bounds.size.width, self.view.bounds.size.height, [UIScreen mainScreen].bounds.size.width);
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
    }
    return _webView;
}

@end
