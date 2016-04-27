//
//  ViewController.m
//  JYTagViewDemo
//
//  Created by Gary on 16/4/27.
//  Copyright © 2016年 Gary. All rights reserved.
//

#import "ViewController.h"
#import "JYTagView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JYTagView *tagView = [[JYTagView alloc] initWithFrame:CGRectMake(0, 40, 320, 200)];
    [tagView setBackgroundColor:[UIColor blackColor]];
    [tagView setTitleArr:@[@"真是不容易啊",@"2",@"测试",@"我的",@"US",@"终于携粗来了09哦",@"真是我列个大擦了了了了了",@"终于携粗来了09哦",@"ou哈哈哈哈哈",@"终于携粗来了09哦",@"真是我列个大擦了了了了了",@"终于携粗来了09哦",@"真是我列个大擦了了了了了"]];
    [self.view addSubview:tagView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
