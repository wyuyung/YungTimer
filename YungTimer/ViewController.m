//
//  ViewController.m
//  YungTimer
//
//  Created by zhangyaoyuan on 2019/8/9.
//  Copyright © 2019 Yung. All rights reserved.
//

#import "ViewController.h"
#import "YungTimerVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/** 点击进入测试TimerDemo
 */
- (IBAction)onClickCreateTimerVC:(id)sender {
    YungTimerVC *vc = [[YungTimerVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
