//
//  YungTimer.m
//  YungTimer
//
//  Created by zhangyaoyuan on 2019/8/9.
//  Copyright © 2019 Yung. All rights reserved.
//

#import "YungTimer.h"
#import <Foundation/Foundation.h>

@interface YungTimer () {
    int _num;
}

@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, copy) YungTimerVoidBlock timerBlock;

@end

@implementation YungTimer

- (void)dealloc {
    NSLog(@"%@_%s", [self class], __func__);
}

#pragma mark - public
/** 创建一个定时器Timer
 */
- (void)createTimerWithTimeInterval:(NSTimeInterval)interval block:(YungTimerVoidBlock)block {
    _timerBlock = block;
    if (@available(iOS 10.0, *)) {
        //iOS10以上可以直接使用block,不会出现timer与self的循环使用问题
        __weak typeof(self)weakSelf = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
            /**此处使用weakSelf和strongSelf有点多余,因为NSTimer持有self,并不会引起循环引用.因为NSTimer是由外层YungTimerVC调用deallocTimer来释放,并不是self来控制释放NSTimer.不过为了统一代码格式,建议还是使用weakSelf和strongSelf.如果在外层YungTimerVC使用NSTimer,则必须使用weakSelf和strongSelf,否则会引起循环引用
             */
            __strong typeof(weakSelf)strongSelf = weakSelf;
            if (strongSelf.timerBlock) {
                strongSelf.timerBlock();
            }
        }];
    } else {
        _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(handleTimerRun) userInfo:nil repeats:YES];
    }
}

/** 释放定时器Timer
 */
- (void)deallocTimer {
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - private

/** ios10以下,定时器定时调用函数
 */
- (void)handleTimerRun {
    if (_timerBlock) {
        _timerBlock();
    }
}

@end
