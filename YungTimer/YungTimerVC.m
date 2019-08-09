//
//  YungTimerVC.m
//  YungTimer
//
//  Created by zhangyaoyuan on 2019/8/9.
//  Copyright © 2019 Yung. All rights reserved.
//

#import "YungTimerVC.h"
#import "YungTimer.h"

@interface YungTimerVC () {
    NSInteger _num;
}

@property(nonatomic,strong) YungTimer *timer;

@end

@implementation YungTimerVC

- (void)dealloc {
    [self.timer deallocTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Timer Demo";
    [self createTimer];
}

/** 创建一个定时器
 */
- (void)createTimer {
    self.timer = [[YungTimer alloc] init];
    [self.timer createTimerWithTimeInterval:1 block:^{
        NSLog(@"%s", __func__);
    }];
}

@end
